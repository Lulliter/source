# Ensure ggplot2 is loaded
require(ggplot2)

# Define the theme 
my_theme <- theme(
legend.position = "right",
panel.background = element_rect(fill = NA),
panel.border = element_rect(fill = NA, color = "grey75"), axis.ticks = element_line(color = "grey85"),
panel.grid.major = element_line(color = "grey95", size = 0.2), panel.grid.minor = element_line(color = "grey95", size = 0.2), legend.key = element_blank())

# To USE: simply add to plot `+ my_theme`