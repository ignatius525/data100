rm(list = ls(all= TRUE))

library(tidyverse)
library(sf)

setwd("C:/Users/Ignat/Desktop/data100/project 1 data 100")

ukr_int <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_0.shp")
ukr_adm1 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_1.shp")
ukr_adm2 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_2.shp")

ggplot() +
  geom_sf(data = ukr_adm2,
          size = .2,
          color = "blue2",
          fill = "yellow2",
          alpha = .65) +
  geom_sf(data = ukr_adm1,
          size = .5,
          color = "gray50",
          alpha = .65) +
  geom_sf(data = ukr_int,
          size = 1,
          color = "blue",
          alpha = 0) +
  geom_sf_text(data = ukr_adm2,
               aes(label = NAME_2),
               size = .75,
               color = "blue3") +
  geom_sf_text(data = ukr_adm1,
               aes(label = NAME_1),
               size = 2.5) +
  geom_sf_text(data = ukr_int,
               aes(label = NAME_0),
               size = 4,
               color = "blue")
ggsave("ukraine_adm2.png", height = 23.92, width = 14.10)
