Marketing Analytics
final project


```{r}
project.df = read.csv('~/desktop/finalproject.csv', header = T)  # download the data
str(project.df)
```


```{r}
# first, compute the distance between points in the dataset
distancematrix = dist(project.df, method = "euclidean")
class(distancematrix)
```


```{r}
# second, compute the hierarchical clusters, based on the previous matrix
tree = hclust(distancematrix, method = "ward.D2")
plot(tree)
```

```{r}
# cut the dendrogram tree into k segments/ clusters
clusternumber = cutree(tree, k = 3)
clusternumber
```


```{r}
# get clusters of data
cluster1 = subset(project.df, clusternumber == 1)
cluster2 = subset(project.df, clusternumber == 2)
cluster3 = subset(project.df, clusternumber == 3)

# build matrix of means for each cluster
meanmatrix = matrix(c(mean(cluster1$No.of.Visits), mean(cluster1$Spend.per.visit),     
                      mean(cluster1$Denny.s.Preference),mean(cluster1$Priced_Menu), mean(cluster1$X24.7.DINING),        
                      mean(cluster1$Food_Quality), mean(cluster1$CONVINENT_Location), mean(cluster1$Dining_Experience),
                      mean(cluster2$No.of.Visits), mean(cluster2$Spend.per.visit),     
                      mean(cluster2$Denny.s.Preference),mean(cluster2$Priced_Menu), mean(cluster2$X24.7.DINING),        
                      mean(cluster2$Food_Quality), mean(cluster2$CONVINENT_Location), mean(cluster2$Dining_Experience),
                      mean(cluster3$No.of.Visits), mean(cluster3$Spend.per.visit),     
                      mean(cluster3$Denny.s.Preference),mean(cluster3$Priced_Menu), mean(cluster3$X24.7.DINING),        
                      mean(cluster3$Food_Quality), mean(cluster3$CONVINENT_Location), mean(cluster3$Dining_Experience)), 
                      ncol = 8, byrow = TRUE)
meanmatrix
```

```{r}
install.packages("corrplot")
install.packages("gplots")
library(corrplot)
library(gplots)
```


```{r}
corrplot.mixed(corr = cor(project.df[ , ], use = "complete.obs"),
               upper = "ellipse", tl.pos = "lt",
               upper.col = colorpanel(50, "red", "gray60", "blue4"))
```

```{r}
cluster1
```
```{r}
cluster2
```

```{r}
cluster3
```








