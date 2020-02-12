rm(list = ls(all= TRUE))

library(tidyverse)
library(sf)

setwd("C:/Users/Ignat/Desktop/data100/project 1 data 100")

ukr_int <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_0.shp")
ukr_adm1 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_1.shp")
ukr_adm2 <- read_sf("data/gadm36_UKR_shp/gadm36_UKR_2.shp")

plot1 <- ggplot() +
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
  geom_rect(data = ukr_adm1, xmin = 30, xmax=31.2, ymin = 50.1, ymax = 50.9,
            fill = NA, colour = "green", size = 1.5) +
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

kiev_city <- ukr_adm1 %>%
  filter(NAME_1 == "Kiev City")

plot2 <- ukr_adm2 %>%
  filter(NAME_1 == "Kiev City") %>%
  ggplot() +
  geom_sf(size = .15)+
  geom_sf_text(aes(label = NAME_2),
               size = 1.75) +
  geom_sf(data = kiev_city,
          size = .5,
          alpha = 0)+
  geom_sf_text(data = kiev_city,
               aes(label = NAME_1),
               size = 3.75,
               alpha = .5)
ggplot() +
  coord_equal(xlim = c(0, 12.0), ylim = c(0, 6), expand = FALSE) +
  annotation_custom(ggplotGrob(plot1), xmin = 0.0, xmax = 8.0, ymin = 0, 
                    ymax = 6.0) +
  annotation_custom(ggplotGrob(plot2), xmin = 8.0, xmax = 12.0, ymin = 0.0, 
                    ymax = 4.0) +
  theme_void()
  
ggsave("ukraine_details.png", width = 23.92, height = 14.20)
