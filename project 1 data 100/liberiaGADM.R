rm(list = ls(all = TRUE))

install.packages("tidyverse", dependencies = TRUE)
install.packages("sf", dependencies = TRUE)
library(tidyverse)
library(sf)

setwd("C:/Users/Ignat/Desktop/data100/project 1 data 100")

lbr_int <- read_sf("data/gadm36_LBR_shp/gadm36_LBR_0.shp")
lbr_adm1 <- read_sf("data/gadm36_LBR_shp/gadm36_LBR_1.shp")
lbr_adm2 <- read_sf("data/gadm36_LBR_shp/gadm36_LBR_2.shp")

ggplot() +
  geom_sf(data = lbr_adm2,
          size = .30,
          color = "grey50",
          fill = "gold3",
          alpha = .65) +
  geom_sf(data = lbr_adm1,
          size = .65,
          color = "gray50",
          alpha = .65) +
  geom_sf(data = lbr_int,
          size = 2,
          alpha = 0) +
  geom_sf_text(data = lbr_adm2,
               aes(label = NAME_2),
               size = .50) +
  geom_sf_text(data = lbr_adm1,
               aes(label = NAME_1),
               size = 1)
ggsave("liberia_adm2.png")

