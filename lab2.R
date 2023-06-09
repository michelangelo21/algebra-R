library(ggplot2)
?qplot

data()
mtcars
diamonds

ggplot(mtcars, aes(x = disp, y = mpg)) +
    geom_point()
mtcars
ggplot(pressure, aes(x = temperature, y = pressure)) +
    geom_line()

# Visualizing statistics on cilinders
cylcount <- table(mtcars$cyl)
barplot(cylcount)
# or
qplot(mtcars$cyl)

# Some other examples of aesthetics usage:
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, size = class))
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, shape = class))
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Plotting facets
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_wrap(~class, nrow = 2)
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(drv ~ cyl)

# Geoms
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) +
    geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
ggplot(data = mpg) +
    geom_smooth(
        mapping = aes(x = displ, y = hwy, color = drv),
        show.legend = FALSE
    )
ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) +
    geom_smooth(mapping = aes(x = displ, y = hwy))
