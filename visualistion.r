# Install ggplot2 if not already installed
# install.packages("ggplot2")

# Load the ggplot2 package
library(ggplot2)

# Use the built-in diamonds dataset
data("diamonds")

# Prepare the data
# Create a subset for better visualization performance
set.seed(123)  # Set seed for reproducibility
sampled_diamonds <- diamonds[sample(nrow(diamonds), 1000), ]

# Plotting
ggplot(sampled_diamonds, aes(x = carat, y = price, color = clarity, size = depth)) +
  geom_point(alpha = 0.7) +  # Scatter plot with transparency
  scale_color_brewer(palette = "Set3") +  # Use a color palette from RColorBrewer
  scale_size_continuous(range = c(1, 5)) +  # Adjust point size range
  labs(
    title = "Diamond Price vs. Carat",
    subtitle = "Sample of 1000 diamonds from the ggplot2 dataset",
    x = "Carat",
    y = "Price (USD)",
    color = "Clarity",
    size = "Depth (%)"
  ) +
  theme_minimal() +  # Use a minimal theme for a clean look
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    legend.position = "right",
    legend.title = element_text(size = 12, face = "bold"),
    legend.text = element_text(size = 10)
  ) +
  facet_wrap(~ cut, scales = "free_y")  # Facet by cut with free y-scales
