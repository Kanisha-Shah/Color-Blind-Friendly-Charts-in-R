library(colorBlindness)
mat <- matrix(1:225, nrow = 15, ncol = 15)
library(ggplot2)
library(reshape2)

mat1 <- melt(t(mat[15:1, ]))
len <- length(Blue2DarkRed12Steps)-1
mat1$v2 <- cut(mat1$value,
               breaks = seq(0,ceiling(225/len)*len, 
                            length.out = len+1))
ht <- ggplot(mat1) + 
  geom_tile(aes(x=Var1, y=Var2, fill=v2)) + 
  scale_fill_manual(values=Blue2DarkRed12Steps) + 
  theme_bw()
cvdPlot(ht)

