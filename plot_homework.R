install.packages("ggExtra")

# libraries
library(ggplot2)
library(gridExtra)

# Make 3 simple graphics:
g1 <- ggplot(mtcars, aes(x = qsec)) +
    geom_density(fill = "slateblue")
g2 <- ggplot(mtcars, aes(x = drat, y = qsec, color = cyl)) +
    geom_point(size = 5) +
    theme(legend.position = "none")
g3 <- ggplot(mtcars, aes(x = factor(cyl), y = qsec, fill = cyl)) +
    geom_boxplot() +
    theme(legend.position = "none")
g4 <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
    geom_bar()

# Plots
grid.arrange(g1, g2, g3, g4)

grid.arrange(g2, arrangeGrob(g3, g4, ncol = 2), nrow = 2)

grid.arrange(g1, g2, g3, nrow = 3)
grid.arrange(g2, arrangeGrob(g3, g4, ncol = 2), nrow = 1)
grid.arrange(g2, arrangeGrob(g3, g4, nrow = 2), nrow = 1)


##### MARGIN PLOT #####
# library
library(ggplot2)
library(ggExtra)

# The mtcars dataset is proposed in R
head(mtcars)

# classic plot :
p <- ggplot(mtcars, aes(x = wt, y = mpg, color = cyl, size = cyl)) +
    geom_point() +
    theme(legend.position = "none")

# with marginal histogram
p1 <- ggMarginal(p, type = "histogram")

# marginal density
p2 <- ggMarginal(p, type = "density")

# marginal boxplot
p3 <- ggMarginal(p, type = "boxplot")

plot(p)

plot(p1)
plot(p2)
plot(p3)

# Set relative size of marginal plots (main plot 10x bigger than marginals)
p4 <- ggMarginal(p, type = "histogram", size = 10)

# Custom marginal plots:
p5 <- ggMarginal(p, type = "histogram", fill = "slateblue", xparams = list(bins = 10))

# Show only marginal plot for x axis
p6 <- ggMarginal(p, margins = "x", color = "purple", size = 4)

plot(p4)
plot(p5)
plot(p6)
