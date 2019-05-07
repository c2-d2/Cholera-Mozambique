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
library(tmap)
library(tmaptools)

rm(list = ls())
setwd("./code")

#### Put together all the data ####
# load gravity model (for movement from Beira) + shapefile
load("./gravity_model_FBpop.Rdata")

# convert gravity model to 0 - 1 index
all.dat@data$gm.ind <- (all.dat@data$trav - min(all.dat@data$trav)) / (max(all.dat@data$trav) - min(all.dat@data$trav))

# add flood index to GM shapefile 
load("./flooding_data.Rdata")
all.dat@data$flood.ind <- adm@data$flood.ind

# add incidence data to GM shape file 
incidence_data <- read.csv("./district_means_norm_2.csv")
all.dat@data$inc.ind <- incidence_data$norm

# add El Nino Sensitivity Measure 
load("./el_nino_sensitivity_index.Rdata")
all.dat@data$EN.ind <- (el_nino_means$EN.ind)

# add flood index for kenneth
load("./flooding_data_Kenneth.Rdata")
all.dat$flood.ind.ken <- flood.unc$flood.ind.ken
all.dat$flood.ind.ken[is.na(all.dat$flood.ind.ken )] <- 0

# add gravity model for movement from Pemba
load("./gravity_model_FBpop_Kenneth.Rdata")
all.dat@data$gm.ind.pemba <-  (grav.df$travPemba - min(grav.df$travPemba)) / (max(grav.df$travPemba) - min(grav.df$travPemba))

#### Create risk indices for Cyclone Idai ####
# create risk score combining gravity and flood
all.dat@data$grav.flood.ind <- all.dat@data$gm.ind*0.5 + all.dat@data$flood.ind*0.5

# create risk score combining gravity and incidence
all.dat@data$grav.inc.ind <- all.dat@data$gm.ind*0.5 + all.dat@data$inc.ind*0.5

# create risk score combining flood and incidence
all.dat@data$flood.inc.ind <- all.dat@data$flood.ind*0.5 + all.dat@data$inc.ind*0.5

# create risk score combining gravity, flood and incidence
all.dat@data$grav.flood.inc.ind <- all.dat@data$gm.ind/3+ all.dat@data$flood.ind/3 + all.dat@data$inc.ind/3

# create risk score combining gravity, flood, EL Nino sensitivity and incidence
all.dat@data$grav.flood.inc.en.ind <- all.dat@data$EN.ind/4 + all.dat@data$gm.ind/4 + 
  all.dat@data$flood.ind/4 + all.dat@data$inc.ind/4

#### Create risk indices for Cyclone Kenneth ####

# create risk score combining gravity and flood
all.dat@data$grav.flood.ind.ken <- all.dat@data$gm.ind*0.5 + all.dat@data$flood.ind.ken*0.5

# create risk score combining flood and incidence
all.dat@data$flood.inc.ind.ken <- all.dat@data$flood.ind.ken*0.5 + all.dat@data$inc.ind*0.5

# create risk score combining gravity, flood and incidence
all.dat@data$grav.flood.inc.ind.ken <- all.dat@data$gm.ind/3+ all.dat@data$flood.ind.ken/3 + all.dat@data$inc.ind/3


# create risk score combining gravity, flood, EL Nino sensitivity and incidence
all.dat@data$grav.flood.inc.en.ind.ken <- all.dat@data$EN.ind/4 + all.dat@data$gm.ind/4 + 
  all.dat@data$flood.ind.ken/4 + all.dat@data$inc.ind/4


# create risk score combining, flood, EL Nino sensitivity and incidence
all.dat@data$flood.inc.en.ind.ken <- all.dat@data$EN.ind/3 + 
  all.dat@data$flood.ind.ken/3 + all.dat@data$inc.ind/3

save(all.dat, file = "./all.dat.Rdata")


