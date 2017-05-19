canary$cluster<-as.character(canary$cluster) 
CanaryIslands<-get_map("Tenerife",maptype = "satellite", zoom = 8) 
p<-ggmap(CanaryIslands)
p + geom_point (data = canary, aes (x = long, y = lat, color = cluster))