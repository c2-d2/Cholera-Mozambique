library(tigris)
library(fields)
library(sf)
library(rgeos)
library(rgdal)
library(ggspatial)
library(ggplot2)
library(igraph)
library(dplyr)
library(Imap)
library(RColorBrewer)
library(data.table)
library(cowplot)

rm(list = ls())
setwd("./data")

#### gravity model simulating movement from Beira ####
# read in facebook high res population data (aggregated to district level)
pop.df <- read.csv("./mozambique_pop_fbook.csv")


# add pop to admin shapefile
adm <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 

all.dat <- adm
all.dat@data$pop <- as.numeric(as.character(pop.df$X_sum))


# get centroids of districts
cent <- SpatialPointsDataFrame(gCentroid(all.dat, byid=TRUE), 
                               all.dat@data, match.ID=FALSE)

# distance from Beira
distance <- rep(NA, length = nrow(all.dat@data))
for (i in 1:nrow(all.dat@data)) {
  distance[i] <- gdist(lon.1 = 34.8370,
                       lat.1 = -19.8316,  
                       lon.2 = cent$x[i], 
                       lat.2 = cent$y[i], 
                       units="miles")
}

distance.df <- as.data.frame(cbind(distance, OBJECTID=all.dat$OBJECTID)) %>%
  left_join(., all.dat@data, by = "OBJECTID") %>%
  mutate(pop.origin = all.dat@data[all.dat$NAME_2 == "Dondo","pop"])


# compute gravity model travel 
grav.df <- distance.df %>%
  mutate(distance = as.numeric(as.character(distance))) %>%
  mutate(trav = (pop^0.5 * pop.origin^0.5)/distance) %>%
  mutate(prop.trav = trav/sum(trav,na.rm = T), diff = pop - trav) %>%
  dplyr::select(OBJECTID, distance, pop, pop.origin, trav, prop.trav, diff) %>%
  mutate(norm.trav = scale(trav))

all.dat <-  geo_join(adm, grav.df, "OBJECTID", "OBJECTID", how = "left") 

save(all.dat, grav.df, file = "../code/gravity_model_FBpop.Rdata")

#### gravity model simulating movement from Pemba ####
pop.df <- read.csv("./mozambique_pop_fbook.csv")


# add pop to admin shapefile
adm <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 

all.dat <- adm
all.dat@data$pop <- as.numeric(as.character(pop.df$X_sum))


# get centroids of districts
cent <- SpatialPointsDataFrame(gCentroid(all.dat, byid=TRUE), 
                               all.dat@data, match.ID=FALSE)

# distance from Pemba
distance <- rep(NA, length = nrow(all.dat@data))
for (i in 1:nrow(all.dat@data)) {
  distance[i] <- gdist(lon.1 = 40.5178,
                       lat.1 = -12.9732,  
                       lon.2 = cent$x[i], 
                       lat.2 = cent$y[i], 
                       units="miles")
}

distance.df <- as.data.frame(cbind(distance, OBJECTID=all.dat$OBJECTID)) %>%
  left_join(., all.dat@data, by = "OBJECTID") %>%
  mutate(pop.origin = all.dat@data[all.dat$NAME_2 == "Dondo","pop"])


# compute gravity model travel 
grav.df <- distance.df %>%
  mutate(distance = as.numeric(as.character(distance))) %>%
  mutate(travPemba = (pop^0.5 * pop.origin^0.5)/distance) %>%
  dplyr::select(OBJECTID, travPemba)

save(grav.df, file = "../code/gravity_model_FBpop_Kenneth.Rdata")
