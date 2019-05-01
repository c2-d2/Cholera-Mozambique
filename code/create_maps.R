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

# load final data
load(file = "./all.dat.Rdata")

# load cyclone kenneth storm track files
setwd("../data")
storm_track <- readOGR(dsn = ".", layer = "storm_track", stringsAsFactors = F) 
uncertainty <- readOGR(dsn = ".", layer = "uncertainty_cone", stringsAsFactors = F) 

#### save maps ####
# El nino + previous incidence + flood map for Cyclone Kenneth
pdf(file ="../maps/Kenneth_incidence_flood_EN_map_ken.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("flood.inc.en.ind.ken", textNA = "No data", 
          title= "Modeled incidence, flood risk index,\nand El Nino sensitivity index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.5,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# gravity, incidence and flood map for Cyclone Idai
pdf(file ="../maps/Idai_gravity_incidence_flood_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("grav.flood.inc.ind", textNA = "No data", 
          title= "Gravity model, modeled incidence and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

#### supplementary maps ####

# flood map for Cyclone Kenneth ####
pdf(file ="../supplementary_maps/flood_map_ken.pdf", width=6,height=8)
map <-   
  tm_shape(all.dat) +
  tm_fill("flood.ind.ken", textNA = "No data", 
          title= "Flooding risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()


#flood map for Cyclone Idai
pdf(file ="../supplementary_maps/flood_map_idai.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("flood.ind", textNA = "No data", 
          title= "Flooding risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# produce gravity model map
pdf(file ="../supplementary_maps/GM_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("gm.ind", textNA = "No data", 
          title= "Gravity model risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# incidence map
pdf(file ="../supplementary_maps/incidence_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("inc.ind", textNA = "No data", 
          title= "Modeled incidence risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# El nino sensitivity map
pdf(file ="../supplementary_maps/El_nino_sens_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("EN.ind", textNA = "No data", 
          title= "El Nino Sensitivity Index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()


## gravity and incidence map
pdf(file ="../supplementary_maps/gravity_incidence_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("grav.inc.ind", textNA = "No data", 
          title= "Gravity model and modeled incidence risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# gravity and flood map for Cyclone Kenneth
pdf(file ="../supplementary_maps/gravity_flood_map_ken.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("grav.flood.ind.ken", textNA = "No data", 
          title= "Gravity model and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()


# incidence and flood map for Cyclone Kenneth
pdf(file ="../supplementary_maps/incidence_flood_map_ken.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("flood.inc.ind.ken", textNA = "No data", 
          title= "Modeled incidence and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

## gravity, incidence and flood map for Cyclone Kenneth
pdf(file ="../supplementary_maps/gravity_incidence_flood_map_ken.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("grav.flood.inc.ind.ken", textNA = "No data", 
          title= "Gravity model, modeled incidence and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_shape(storm_track) + tm_lines(col = "blue", lwd = 1.5) +
  tm_shape(uncertainty) + tm_borders(col = "blue", lty = 2, lwd = 1) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

# gravity and flood map for Cyclone Idai
pdf(file ="../supplementary_maps/gravity_flood_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("grav.flood.ind", textNA = "No data", 
          title= "Gravity model and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()


# incidence and flood map for Cyclone Idai
pdf(file ="../supplementary_maps/incidence_flood_map.pdf", width=6,height=8)
map <- tm_shape(all.dat) +
  tm_fill("flood.inc.ind", textNA = "No data", 
          title= "Modeled incidence and flood risk index", 
          palette = "YlOrRd", style = "cont",
          breaks = c(0,0.2,0.4,0.6,0.8,1), labels = c("Low", "", "", "", "", "High")) +
  tm_layout(
    frame = "white",
    title = "",
    title.size = 1,
    fontfamily = "serif",
    legend.title.size = 1,
    legend.text.size = 0.6,
    legend.position = c(0.4,0),
    legend.width = 10,
    legend.text.color = "black") +
  tm_scale_bar(position=c("left", "top"))
map
dev.off()

