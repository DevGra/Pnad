# create a dataset:
data <- tibble(
  from=c("A", "A", "B", "D"),
  to=c("B", "E", "F", "A")
)

# Plot
#install.packages("igraph")
library(igraph)
library(networkD3)
p <- simpleNetwork(data, height="100px", width="100px")

# save the widget at .html format
install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(p, file="myFile.html")

# Save at .png
install.packages("webshot")
library(webshot)
webshot::install_phantomjs()
webshot("paste_your_html_here" , "output.png", delay = 0.2 , cliprect = c(440, 0, 1000, 10))