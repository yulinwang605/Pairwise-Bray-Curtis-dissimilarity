library("vegan")
library("ggplot2")

####real data
data <- read.table("MAGs-relative-abundance.txt",sep = "\t",header = TRUE,row.names=1)

####filter rare populations, genome that cannot be identified in at 20 samples were removed.
table<-data
table[table>0]<-1
table.generalist<-data[which(rowSums(table)>=20),]
data<-table.generalist
data <- t(data)

#Bray-Curtis analysis
vare.dist <- vegdist(data,method="bray", binary=FALSE, diag=FALSE, upper=FALSE,na.rm = FALSE)
mydf<-as.data.frame(as.matrix(vare.dist))
write.table(mydf,file = "bray-dissimilarity-atleast-20-samples.txt",sep = "\t")
