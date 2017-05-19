library(tidyverse)
canary<-read_csv("canary.csv")
a <- mutate(canary, code_sp = paste(subspecies, collector_number, sep = "_")) # Create a code for each species
b <- mutate(a, ratio_leaf = leaf_length / leaf_width)

# Cluster analysis
# _________________
can_clus <-
  select (
    b,
    code_sp,
    lobe_width,
    leaf_length,
    lobe_length,
    leaf_width,
    ratio_leaf
  )
hc <- hclust(dist(can_clus), "complete")
plot(hc, labels = can_clus$code_sp)

# NMDS
nmd <- metaMDS(can_clus)





