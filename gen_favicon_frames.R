library(tidyverse)
library(wesanderson)

n      <- 10
theta  <- seq(0, 1, 0.001)

colors <- wes_palette(name = "FantasticFox1",
                      n = n + 1,
                      type = "continuous")

save_to = "./static/images/favicon/"

for(x in 0:10) {

  likelihood <- 
    tibble(
      n     = n,
      x     = x,
      theta = theta,
      p     = dbinom(x, n, theta)
    )
  
  pl <- 
    likelihood %>%
    ggplot() +
    geom_line(
      aes(
        x = theta,
        y = p),
      alpha = 1,
      lwd = 20,
      color = colors[x+1]
    ) +
    theme_void()
  
  filename <- paste0(save_to, "lik_frame_", x+1, ".png")
  ggsave(filename,
         plot = pl,
         device = "png",
         dpi = 72)
}
