# Copyright 2022 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
library(tidyverse)
library(sf)
bc_region_sf <- sf::st_read(here::here("data","bc_regions-polygon.shp"))[1:15,]%>%
  mutate(region=c(
    "north_coast",
    "northeast",
    "cariboo",
    "north_coast",
    "north_coast",
    "north_coast",
    "north_coast",
    "vancouver_island_coast",
    "thompson_okanagan",
    "north_coast",
    "vancouver_island_coast",
    "vancouver_island_coast",
    "kootenay",
    "mainland_southwest",
    "vancouver_island_coast"
  ))%>%
  select(-properties)

write_rds(bc_region_sf, here::here("out","bc_region_sf.rds"))

ggplot(bc_region_sf)+
  geom_sf(aes(fill=region), lwd=0)+
  theme_void()

