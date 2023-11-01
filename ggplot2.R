library(ggplot2)
library(remotes)
library(ggridges)
library(palmerpenguins)
library(rsconnect)
View(penguins)

#1
ggplot(penguins, aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(colour = "black")


#2

ggplot(penguins, aes(x = flipper_length_mm, fill = species)) +
  geom_density(alpha = 0.5)

#3
ggplot(penguins, aes(x = flipper_length_mm)) +
  geom_histogram() +
  facet_wrap(~species, ncol = 1)

#4
ggplot(penguins, aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(binwidth = 1, colour = "black") +
  labs(x = "Flipper Length (mm)", title = "Histogram of flipper length in Palmer penguins.") +
  facet_wrap(~species, ncol = 1)

#5
subset_penguins <- subset(penguins, !is.na(sex))
ggplot(subset_penguins, aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(binwidth = 1, colour = "black") +
  labs(x = "Flipper Length (mm)", y = "Count", title = "Histogram of flipper length and sex in Palmer penguins.", fill = "Penguin Species") +
  facet_grid(rows = species ~ sex)

#6
ggplot(subset_penguins, aes(x = flipper_length_mm, fill = sex)) +
  geom_density(alpha = 0.5) +
  labs(x = "Flipper Length (mm)", y = "Density", title = "Density plot of flipper length and sex in Palmer penguins.", fill = "Penguin Sex") +
  facet_wrap(~species)

#7

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) + geom_point() +
  stat_smooth(method = "lm")

#8
ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, colour = species)) + geom_point() +
  scale_colour_manual(values = c("blue", "red", "purple")) +
  geom_point(alpha = 0.4) +
  scale_x_continuous(breaks = seq(35, 60, 5))

#9
ggplot(penguins, aes(x = bill_length_mm, y = flipper_length_mm)) +
  geom_point(aes(colour = species, shape = species)) +
  stat_smooth(method = "lm") +
  labs(y = "Flipper Length (mm)", x = "Bill Length (mm)", title = "Flipper length and bill length in Palmer penguins.", fill = "Penguin Species")

#10
ggplot(penguins, aes(x = species, y = flipper_length_mm)) + geom_boxplot(notch = T)

#11
ggplot(penguins, aes(x = species, y = flipper_length_mm)) + geom_violin()

#12
ggplot(penguins, aes(x = species, y = flipper_length_mm)) + geom_violin() +
  geom_boxplot(notch = T)

#13
ggplot(penguins, aes(x = species, y = flipper_length_mm, colour = species)) + geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.3) +
  theme_bw()

#14
library(ggridges)
ggplot(penguins, aes(y = species, x = flipper_length_mm, fill = species)) + geom_density_ridges(scale = 0.4, alpha = 0.6) +
  geom_boxplot(width = .24, alpha = 0.5) +
  coord_flip()

#15
ggplot(penguins, aes(x = species, y = flipper_length_mm)) + geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.3) +
  theme_bw() +
  labs(x = "Species", y = "Flipper Length (mm)", col = "Species") + theme(axis.text.x = element_text(angle = 270, vjust = 0.2, hjust = 0),
                                                                          axis.title = element_text(size = 16), panel.background = element_rect(fill = "lightblue"))
