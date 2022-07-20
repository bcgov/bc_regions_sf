library(tidyverse)
library(sf)
library(plotly)

rd <- sf::st_read(here::here("shapefiles","test-polygon.shp"))[-c(33,35),]%>%
  mutate(id=row_number(),
         regional_district=c(
          "capital",
          "cowichan",
          "alberni_clayoquot",
          "nanaimo",
          "metro_vancouver",
          "fraser_valley",
          "okanagan_similkameen",
          "kootenay_boundary",
          "central_kootenay",
          "sunshine_coast",
          "comox_valley",
          "east_kootenay",
          "strathcona",
          "squamish_lillooet",
          "qathet",
          "thompson_nicola",
          "central_okanagan",
          "mount_waddington",
          "strathcona",
          "north_okanagan",
          "mount_waddington",
          "columbia_shuswap",
          "cariboo",
          "central_coast",
          "north_coast",
          "kitamat_stikine",
          "fraser_fort_george",
          "bulkley_nechako",
          "north_coast",
          "north_coast",
          "peace_river",
          "stikine",
          "northern_rockies"
         ))

plt <- ggplot(rd)+
  geom_sf(aes(fill=regional_district),lwd=0)+
  theme_void()+
  theme(legend.position = "none")


  ggplotly(plt)%>% 
    style(hoveron = "fill") 
