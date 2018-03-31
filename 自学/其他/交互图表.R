#install.packages("dygraphs")
library(dygraphs)
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))

###networkD3###
#http://christophergandrud.github.io/networkD3/
#networkD3提供了从R创建D3 JavaScript网络图的工具。
install.packages("networkD3")
library(networkD3)
data(MisLinks, MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4)

###Plotly###
install.packages("plotly")
library(ggplot2)
library(plotly)
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")
ggplotly(p)


###threejs###
#https://github.com/bwlewis/rthreejs
#threejs包括3D散点图和3D球体（您可以使用鼠标直接操纵散点图）。
install.packages("threejs")
library(threejs)
z <- seq(-10, 10, 0.01)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)))


###rglwidget###
#http://cran.at.r-project.org/web/packages/rglwidget/index.html
#rglwidget呈现使用rgl包创建的WebGL场景。
install.packages("rgl")
install.packages("rglwidget")
install.packages("htmltools")
library(rgl)
library(rglwidget)
library(htmltools)

theta <- seq(0, 6*pi, len=100)
xyz <- cbind(sin(theta), cos(theta), theta)
lineid <- plot3d(xyz, type="l", alpha = 1:0, 
                 lwd = 5, col = "blue")["data"]

browsable(tagList(
  rglwidget(elementId = "example", width = 500, height = 400,
            controllers = "player"),
  playwidget("example", 
             ageControl(births = theta, ages = c(0, 0, 1),
                        objids = lineid, alpha = c(0, 1, 0)),
             start = 1, stop = 6*pi, step = 0.1, 
             rate = 6,elementId = "player")
))
