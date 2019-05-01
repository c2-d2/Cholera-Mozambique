library("raster")
library("rgdal")
library("sp")

rm(list = ls())
setwd("./data")

# read in tiff file as raster (use stack to get multiple layers)
str_name<-"./MOZ_lambda_per_cell.tif" # file to large (please contact us for access)
IR=stack(str_name)

# get mean of 1000 layers
meanIR <- stackApply(IR, indices =  rep(1,nlayers(IR)), fun = "mean", na.rm = T)

# read in shapefile
MOZ <- readOGR(dsn = ".", layer = "admin2", stringsAsFactors = F) 

# take mean at district level
district_means <- extract(meanIR, MOZ[1:2,], fun=mean, df=TRUE, na.rm=TRUE)

# normalize to 0-1 scale
district_means$norm <- (district_means$index_1 - min(district_means$index_1))/(max(district_means$index_1) - min(district_means$index_1))

write.csv(district_means$norm, file = "../code/district_means_norm_2.csv", row.names=FALSE)