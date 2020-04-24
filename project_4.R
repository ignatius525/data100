rm(list=ls(all=TRUE))

install.packages("rayshader", dependencies = TRUE)

library(raster)
library(sf)
library(tidyverse)

library(rayshader)
library(rayrender)

setwd("C:/Users/Ignat/desktop/data100ver2/data/lulc")

ukr_topo <- raster("ukr_srtm_topo_100m.tif")

setwd("C:/Users/Ignat/desktop/data100ver2/data/gadm36_UKR_shp")

ukr_adm2  <- read_sf("gadm36_UKR_2.shp")

setwd("C:/Users/Ignat/desktop/data100ver2/")
load("kiev2.RData")

combined_topo <- crop(ukr_topo, kiev2)

combined_matrix <- raster_to_matrix(combined_topo)

combined_matrix %>%
  sphere_shade() %>%
  add_water(detect_water(combined_matrix)) %>%
  plot_map()

ambientshadows <- ambient_shade(combined_matrix)

combined_matrix %>%
  sphere_shade() %>%
  add_water(detect_water(combined_matrix), color = "lightblue") %>%
  add_shadow(ray_shade(combined_matrix, sunaltitude = 3, zscale = 33, lambert = FALSE), max_darken = 0.5) %>%
  add_shadow(lamb_shade(combined_matrix, sunaltitude = 3, zscale = 33), max_darken = 0.7) %>%
  add_shadow(ambientshadows, max_darken = 0.1) %>%
  plot_3d(combined_matrix, zscale = 20,windowsize = c(1000,1000), 
          phi = 40, theta = 135, zoom = 0.5, 
          background = "grey30", shadowcolor = "grey5", 
          soliddepth = -50, shadowdepth = -100)
