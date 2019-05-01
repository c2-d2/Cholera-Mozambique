library(rgdal)
library(geojson)
library(geosphere)

rm(list = ls())
setwd("./data")

# read in admin boundary shapefile
adm <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 

#read in tiff file as raster (use stack to get multiple layers)
EN <- raster::raster("./el_nino_sensitivity.tif") #need to unzip file first

# take mean at district level
el_nino_means <- raster::extract(EN, adm, fun=mean, df=TRUE, na.rm=TRUE)

# create index
el_nino_means$EN <- el_nino_means$el_nino_sensitivity
el_nino_means$EN[el_nino_means$EN < 0] <- 0

el_nino_means$EN.ind <- (el_nino_means$EN - min(el_nino_means$EN)) / (max(el_nino_means$EN) - min(el_nino_means$EN))

save(el_nino_means, file = "../code/el_nino_sensitivity_index.Rdata")
