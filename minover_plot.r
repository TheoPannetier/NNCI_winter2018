library(pspline)

mydata = read.table("output.txt", header = T)
mydata

low_dimension <- which(mydata$N == 10)
medium_dimension <- which(mydata$N == 20)
high_dimension <- which(mydata$N == 100)

#####
# N = 10
avg_10 <- mydata[which(mydata$N == 10),"MeanGenError"]
names(avg_10) = mydata[which(mydata$N == 10),"Alpha"]

avg_20 <- mydata[which(mydata$N == 20),"MeanGenError"]
names(avg_20) = mydata[which(mydata$N == 20),"Alpha"]

avg_100 <- mydata[which(mydata$N == 100),"MeanGenError"]
names(avg_100) = mydata[which(mydata$N == 100),"Alpha"]

#sdev <- mydata[low_dimension,"SdGenError"]
#names(sdev) = mydata[low_dimension,"Alpha"]
png(filename = "Minover_genError.png", 480, 480)
x = as.numeric(levels(as.factor(mydata$Alpha)))
{
plot(x, avg_10,
     pch = 3, 
     cex = 0.5,
     col = "red",
     xlim = c(0,5),
     ylim = c(0,0.5),
     xlab = expression(alpha), 
     ylab = paste('Generalization error')
     )

curve_10 <-  sm.spline(x, avg_10, df = 4)
lines(curve_10, col = "red")

points(x, avg_20, col = "blue", pch = 3, cex = 0.5)
curve_20 <-  sm.spline(x, avg_20, df = 4)
lines(curve_20, col = "blue")

points(x, avg_100, col = "green", pch = 3, cex = 0.5)
curve_100 <-  sm.spline(x, avg_100, df = 4)
lines(curve_100, col = "green")
}
legend('topright', bty = 'n', cex = 1,
       pch = 3,
       lwd = 1,
       merge = T,
       col = c("red", "blue", "green"), 
       c("N = 10", "N = 20", "N = 100"),
       y.intersp = 0.8
       )
dev.off()
