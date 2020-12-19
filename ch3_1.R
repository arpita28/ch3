www <- "http://www.stat.columbia.edu/%7Egelman/arm/examples/pyth/exercise2.1.dat"
mydata = read.table(www, header=TRUE)
mydata.train = mydata[0:40, ]
mydata.test = mydata[-1:-40,]
mydata %>% head(40)
mydata %>% tail(20)

# a) 
fit.1 = lm(y ~ x1+x2, mydata.train)
summary(fit.1)
# residual standard error = 0.9 is small, and fraction of explained variance is large
# indicating a good fit for the training data

#b)
beta.hat = coef(fit.1)
par (mfrow = c(1,2))
plot(mydata.train$x1, mydata.train$y, xlab="x1", ylab="y")
curve(cbind(1, x, mean(mydata.train$x2)) %*% beta.hat, col="black", add=TRUE)
plot(mydata.train$x2, mydata.train$y, xlab="x2", ylab="y")
curve(cbind(1, mean(mydata.train$x1), x) %*% beta.hat, col="black",add=TRUE)


