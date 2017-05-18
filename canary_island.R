canary <- read.csv("Canary_island_Argyranthemum.csv", header = TRUE)
head(canary)
library(ggplot2)
ggplot(canary, aes(x=subspecies, y=leaf_length)) +
  geom_boxplot ()
ggplot(canary, aes(x=as.factor(cluster), y=leaf_length)) +
  geom_boxplot ()
ggplot(canary, aes(x=leaf_length, y=lobe_count, colour=subspecies, shape=island, size=3)) +
  geom_point ()

library(dplyr)
a <- mutate(canary, leafratio = (leaf_length/leaf_width))
names(canary)
names(a)


ggplot(a, aes(x=subspecies, y=leafratio)) +
  geom_boxplot ()
ggplot(a, aes(x=as.factor(cluster), y=leafratio)) +
  geom_boxplot ()
  ggplot(a, aes(x=leafratio, y=lobe_count, colour=subspecies, shape=island, size=3)) +
    geom_point ()
  
  ggplot(a, aes(x=leafratio, y=lobe_count, colour=subspecies, shape=as.factor(involucral_bracts), size=3)) +
    geom_point ()

ggplot(a, aes(x=leafratio, y=lobe_count, colour=subspecies, shape=as.factor(cluster), size=3)) +
  geom_point ()


model1 <- lm(leafratio ~ as.factor(cluster), data = a)
library (ggfortify)
autoplot(model1)
anova(model1)
summary(model1)


model2 <- lm(leaf_length ~ as.factor(cluster), data = a)
library (ggfortify)
autoplot(model2)
anova(model2)
summary(model2)
