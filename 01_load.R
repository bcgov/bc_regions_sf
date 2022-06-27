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
bc_region_sf <- sf::st_read(here::here("data","map-polygon.shp"))[2:15,]%>%
  mutate(id=row_number())%>%
  mutate(region=c(
    "northeast",
    "nechako",
    "cariboo",
    "thompson_okanagan",
    "north_coast",
    "kootenay",
    "vancouver_island_coast",
    "mainland_southwest",
    "vancouver_island_coast",
    "north_coast",
    "north_coast",
    "north_coast",
    "north_coast",
    "north_coast"
   ))%>%
  select(-properties)

write_rds(bc_region_sf, here::here("out","bc_region_sf.rds"))

ggplot(bc_region_sf)+
  geom_sf(aes(fill=region), colour="white")+
  geom_sf_text(aes(label=id))+
  theme_void()

