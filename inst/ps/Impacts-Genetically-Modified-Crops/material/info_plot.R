library(dplyr)
library(tidyr)
library(ggplot2)
#https://rpubs.com/mbounthavong/R-plotly-bar-charts
data <- readRDS("data_crop.rds")
#Data preparation
crucial_data <- data %>% 
  filter(crop %in% c("cotton", "maize", "soybean", "rapeseed")) %>% 
  filter(GMdefacto != 0) %>% 
  select(crop, country) %>% 
  distinct() 

#https://stackoverflow.com/questions/58035452/pivot-wider-outputs-s3-vctrs-list-of-objects
#information to the different GM countries per crop 
countries <- crucial_data %>% group_by(crop) %>%
  mutate(rn = row_number()) %>% ungroup() %>% pivot_wider(names_from = crop, values_from = country)

distinct_countries <- crucial_data %>% select(country) %>% distinct() %>% pull()

chart <- crucial_data %>% 
  group_by(crop) %>% 
  summarise(count_country = n())
#Plot:
GM_cult_plot <- ggplot(chart, aes(x = crop, y = count_country)) +
  geom_bar(stat = "identity", fill = "#3b7dd8") +
  geom_text(aes(label = count_country, x = crop, y = count_country), position = position_dodge(width = 0.8), vjust = -0.6) +
  xlab("Crops") +
  ylab("Number of GM-Countries") +
  ggtitle("Number of Countries where GM cultivation is legal per crop") +
  theme_bw() +
  theme(plot.caption = element_text(hjust = 0)) +
  labs(caption = "Note: \nThis plot was created with the 'ggplot2' package. We will learn about it in the second chapter.")

ggsave(
  "GM-cultivation-by-crop.png",
  plot = GM_cult_plot
)
