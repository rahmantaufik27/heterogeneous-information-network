#heterogeneous information network
#call library igraph
library("igraph")
#import nodes daabd edges data table 
nodes2 <- read.csv(file.choose(), header=T, as.is=T)
links2 <- read.csv(file.choose(), header=T, row.names=1)
#edges as a matriks
links2 <- as.matrix(links2)
net2 <- graph_from_incidence_matrix(links2)
#plot table
table(V(net2)$type)
#plot network
V(net2)$color <- c("steel blue", "orange")[V(net2)$type+1]
V(net2)$shape <- c("square", "circle")[V(net2)$type+1]
V(net2)$label[V(net2)$type==F] <- nodes2$media[V(net2)$type==F]
V(net2)$label <- ""
V(net2)$label.cex=.4
V(net2)$label.font=2
#plot heterogenous network
plot(net2, vertex.shape="none", vertex.label=nodes2$media, vertex.label.color=V(net2)$color, vertex.label.font=2.5, vertex.label.cex=.6, edge.color="gray70", edge.width=2)
plot(net2, vertex.label.color="white", vertex.size=(2-V(net2)$type)*8)