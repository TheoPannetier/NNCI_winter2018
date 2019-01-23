setwd("~/nnci3")

weights <- read.table("NNCI3_final_weights_2500.txt", sep = " ")[,-51]

for(n in (1:10)*2-1){
  
  W1 <- c()
  W2 <- c()
  for(i in 1:50){
    W1[i] <- weights[n,i]
    W2[i] <- weights[n+1,i]
  }
  
  barplot(
    rbind( 
      abs(c(W1, rep(0,5))), 
      abs(c(W2, rep(0,5)))
    ), 
    beside = T,
    col = c("sienna3","skyblue3"), 
    border = NA,
    las = 1
  )
  legend("right", legend = c(expression(w[1]),expression(w[2])), fill = c("sienna3","skyblue3"), bty = "n")
  
  
}

#png(filename = "weightVector2500.png", width= 1440, height = 560, pointsize = 24)
par(mar = c(1,2,1,1))


#dev.off()

