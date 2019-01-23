setwd("~/nnci3")
library(pspline)
library(scales)

plot_error = function(P, eta){
  data = read.table(paste0("NNCI3_error_output_", P, "_", eta,"0000.txt"), header = T)
  
  plot(data[,1:2], 
       type = "l",
       #log = "y",
       main = paste("eta = ", eta),
       pch = 3,
       col = "black",
       xlim = c(0,500),
       ylim = c(0,0.6),
       xlab = "t", 
       ylab = "Error",
       las = 1
  )
  
  lines(data[,3], col = alpha("black", 0.4))
  
  legend(x = 350,
         y = 0.5, 
         bty = 'n', cex = 0.6,
         lwd = 1,
         col = c("black", "gray"), 
         c("Training set","Generalization")
         )
}

png(filename = "Error_through_time_eta.png", width= 1120, height = 1920, pointsize = 48)

par(mar = c(2,4,2,1))
layout(mat = matrix( c(1, 1, 1,2, 2, 2,3, 3, 3), nrow = 3, byrow = T))

plot_error(500, "0.05")
plot_error(500, "1.00")
plot_error(500, "2.00")
#plot_error(500, )

dev.off()
