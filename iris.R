iris1 <- read.csv(file.choose(), header=TRUE)

dim(iris1)


colSums(is.na(iris1))

summary(iris1)

### As the Dataset Features similar weights, no need to scale the features


dd <- dist(iris1[,2:5], method ="euclidean")
res.hclust <- hclust(dd, method = "complete")

plot(res.hclust)

cluster.height<-res.hclust$height
cluster.height<- sort(cluster.height, decreasing = TRUE)
plot(cluster.height)



plot(res.hclust)
rect.hclust(res.hclust, k=3, border="red")

Clusters<-cutree(res.hclust, k=3)
iris1_New<-cbind(iris1,Clusters)

names(iris1_New)

attach(iris1)
group1<- subset(iris1_New, Clusters==1)
group2<- subset(iris1_New, Clusters==2)
group3<- subset(iris1_New,Clusters==3)
#group4<- subset(iris1_New,Clusters==4)



## plotting the clusters


library(cluster)

#clusplot(iris1_New[,-6], iris1_New$Clusters, 
       #  color=TRUE, shade=TRUE, labels=2, lines=1)





#Profiling

aggr = aggregate(iris1_New[,-c(6)],list(iris1_New$Clusters),mean)


# Silhouette coefficient of observations

sil <- silhouette(iris1_New$Clusters ,dist(iris1_New))
head(sil[, 1:3], 10)

aggr


write.csv(iris1_New,file="iris1_New.csv")
getwd()

