rm(list = ls(all = TRUE))

#install.packages("tidyverse", dependencies = TRUE)
#install.packages("sf",dependencies = TRUE)
install.packages("raster", dependencies = TRUE )

library(tidyverse)
library(sf)
library(raster)

setwd("C:/Users/Ignat/Desktop/data100/project 1 data 100")

ukr_raster_2019 <- raster("data/world_pop/ukr_ppp_2019.tif")

ukr_sf_adm1 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_1.shp")

plot(ukr_raster_2019)
plot(st_geometry(ukr_sf_adm1), add = TRUE)
