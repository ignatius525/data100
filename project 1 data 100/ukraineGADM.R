rm(list = ls(all= TRUE))

library(tidyverse)
library(sf)

setwd("C:/Users/Ignat/Desktop/project 1 data 100")

ukr_int <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_0.shp")
ukr_adm1 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_1.shp")
ukr_adm2 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_2.shp")

ggplot() +
  geom_sf(data = ukr_adm2,
          size = .30,
          color = "blue3",
          fill = "yellow2",
          alpha = .65) +
  geom_sf(data = ukr_adm1,
          size = .65,
          color = "gray50",
          alpha = .65) +
  geom_sf(data = ukr_int,
          size = 2,
          alpha = 0) +
  geom_sf_text(data = ukr_adm2,
               aes(label = NAME_2),
               size = .50) +
  geom_sf_text(data = ukr_adm1,
               aes(label = NAME_1),
               size = 1)
ggsave("ukraine_adm2.png")
