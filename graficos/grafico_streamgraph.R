#devtools::install_github("hrbrmstr/streamgraph")
library(dplyr)
library(tidyr)
# ----------  USO DA BIBLIOTECA STREAMGRAPH ------------------------
library(babynames)
library(streamgraph)
library(ggplot2)

babynames %>%
  filter(grepl("^Kr", name)) %>%
  group_by(year, name) %>%
  tally(wt = n) %>%
  streamgraph("name", "n", "year")

# outro
babynames %>%
  filter(grepl("^I", name)) %>%
  group_by(year, name) %>%
  tally(wt = n) %>%
  streamgraph("name", "n", "year", offset = "zero", interpolate = "linear") %>%
  sg_legend(show = TRUE, label = "I- names: ")

# outro

dat <- read.csv("http://asbcllc.com/blog/2015/february/cre_stream_graph_test/data/cre_transaction-data.csv")

dat %>%
  streamgraph("asset_class", "volume_billions", "year", interpolate = "cardinal") %>%
  sg_axis_x(1, "year", "%Y") %>%
  sg_fill_brewer("PuOr")

# outro
dat %>%
  streamgraph("asset_class", "volume_billions", "year", offset = "silhouette", interpolate = "step") %>%
  sg_axis_x(1, "year", "%Y") %>%
  sg_fill_brewer("PuOr")

# outro
dat %>%
  streamgraph("asset_class", "volume_billions", "year", offset = "zero", interpolate = "cardinal") %>%
  sg_axis_x(1, "year", "%Y") %>%
  sg_fill_brewer("PuOr") %>%
  sg_legend(TRUE, "Asset class: ")

# 0utro
dat %>%
  streamgraph("asset_class", "volume_billions", "year", offset="zero", interpolate="step") %>%
  sg_axis_x(1, "year", "%Y") %>%
  sg_fill_brewer("PuOr")

# outro
#The data to use for a streamgraph should be in “long format”9. The following example shows 
#how to produce a streamgraph from the ggplot2 movies data set.
install.packages("ggplot2movies")

ggplot2movies::movies %>%
  select(year, Action, Animation, Comedy, Drama, Documentary, Romance, Short) %>%
  tidyr::gather(genre, value, -year) %>%
  group_by(year, genre) %>%
  tally(wt = value) %>%
  ungroup %>%
  streamgraph("genre", "n", "year") %>%
  sg_axis_x(20) %>%
  sg_fill_brewer("PuOr") %>%
  sg_legend(show = TRUE, label = "Genres: ")


#---------------------------- FIM STREAMGRAPH -----------------------

# -------- Nifty graph: a 3d imitation with R ---------------
moxbuller = function(n) {   
  u = runif(n)   
  v = runif(n)   
  x = cos(2*pi*u)*sqrt(-2*log(v))  
  y = sin(2*pi*v)*sqrt(-2*log(u))
  r = list(x=x, y=y)
  return(r) 
}
r = moxbuller(50000) 
par(bg="black") 
par(mar=c(0,0,0,0)) 
plot(r$x,r$y, pch=".", col="blue", cex=1.2)

#---------------  FIM Nifty ------------------------------

# ------- 3D SURFACE PLOT -------
install.packages("plotly")
library(plotly)

# Data: volcano is provided by plotly

# Plot
p <- plot_ly(z = volcano, type = "surface")
p 

# save the widget
# library(htmlwidgets)
# saveWidget(p, file=paste0( getwd(), "/HtmlWidget/3dSurface.html"))