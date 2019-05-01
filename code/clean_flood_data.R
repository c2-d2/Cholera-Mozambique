library(rgdal)
library(geojson)
library(geosphere)

rm(list = ls())
setwd("./data")

#### Idai ####
# read in admin boundary shapefile
adm <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 


# read in flooding data for Cyclone Idai
flood <- rgdal::readOGR("hazard_aggregation_summary_13.geojson", "OGRGeoJSON")


dis.map <- over(adm, flood, returnList = TRUE)
flood.ind <- rep(NA, length(adm))
for (n in 1:length(dis.map)) {
  tmp <- ifelse(dis.map[[n]]$hazard_class == "wet", 1, 0)
  flood.ind[n] <- sum(tmp)/length(dis.map[[n]]$hazard_class)
}

# save flood index to shapefile
adm@data$flood.ind <- flood.ind
save(adm, file = "../code/flooding_data.Rdata")

#### Kenneth ####
setwd("./data")
# read in admin boundary shapefile
adm <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 

# read in storm track and uncertainty cone vectors
storm_track <- readOGR(dsn = ".", layer = "storm_track", stringsAsFactors = F) 
uncertainty <- readOGR(dsn = ".", layer = "uncertainty_cone", stringsAsFactors = F) 

# extract districts affected 
flood.unc <- sp::over(adm, uncertainty, returnlist = TRUE)
flood.unc$flood.unc.ind.ken <- 0
flood.unc$flood.unc.ind.ken[!is.na(flood.unc$objectid)] <- 1

cent <- SpatialPointsDataFrame(gCentroid(adm, byid=TRUE), 
                               adm@data, match.ID=FALSE)

d = dist2Line(cent, storm_track)

flood.unc$dist_to_storm <- d[,1]
flood.unc$dist_to_storm[flood.unc$flood.unc.ind.ken != 1] <- NA
flood.unc$flood.ind.ken <- (flood.unc$dist_to_storm - max(flood.unc$dist_to_storm, na.rm = T)) / (min(flood.unc$dist_to_storm, na.rm = T) - max(flood.unc$dist_to_storm, na.rm=T))

save(flood.unc, file = "../code/flooding_data_Kenneth.Rdata")
