
# Central limit theorem statement - If X_hat is the mean of a random sample of size N taken
# from a population with mean ?? and finite variance ??^2, then the limiting form of
# the distribution of Z = (X_hat - ??)/(??/sqrt(N)) as N??????, 
# is the standard normal distribution with mean 0 and standard deviation 1.

# Since distribution doesn't matter for central limit theorem we will demonstrate central limit 
# theorem using uniform distribution with values ranging from -10 to 10.

d <- runif(10000, min = -10, max = 10)
hist(d, col="lightblue", main="Histrogram of the uniform distribution")
abline(v=mean(d), col="black")
mean(d)
# so the plot will resemble uniform distribution and the black line in the plot shows the mean
# which is close to 0. This is the true mean of the population. 

# Assumptions - 
# 1. Our data consists of 10,000 values randomly sampled from uniform distribution. a = -10, b = 10.
# 2. We will make 5000 samples, each with sample size 5, 10, 15, 30, 50, 100.
# 3. We are sampling with replacement.

# Note - If we dont take 10,000 samples and just randomly sample N elements from it, then also it works
# I just took 10,000 for the sake of demonstration. You can prove this with any data, take any 
# online data, take any one column with real values and you can prove Central limit theorem.

simulations <- 5000
samp_size5 <- c()
samp_size15 <- c()
samp_size30 <- c()
samp_size50 <- c()
samp_size100 <- c()
samp_size500 <- c()

# Explanation of the code below.
# we are taking 5 random samples from 10,000 elements, finding the
# mean of these 5 elements, storing in a vector and doing this process 5,000 times.

# we are doing similar operations, now we are taking 15, 30, 50, 100, 500 samples.
for(i in 1:simulations){
  samp_size5[i] <- mean(sample(d, 10, replace = TRUE))
  samp_size15[i] <- mean(sample(d, 15, replace = TRUE))
  samp_size30[i] <- mean(sample(d, 30, replace = TRUE))
  samp_size50[i] <- mean(sample(d, 50, replace = TRUE))
  samp_size100[i] <- mean(sample(d, 100, replace = TRUE))
  samp_size500[i] <- mean(sample(d, 500, replace = TRUE))
}

par(mfrow = c(1,1))
hist(samp_size5, col ="lightblue",main="Sample size=5", xlim=c(-6, 6))
abline(v = mean(samp_size5), col = "black")

hist(samp_size15, col ="lightgreen", main="Sample size=15", xlim=c(-6, 6))
abline(v = mean(samp_size15), col = "black")

hist(samp_size30, col ="red",main="Sample size=30", xlim=c(-6, 6))
abline(v = mean(samp_size30), col = "black")

hist(samp_size50, col ="orange",main="Sample size=50", xlim=c(-6, 6))
abline(v = mean(samp_size50), col = "black")

hist(samp_size100, col ="pink", main="Sample size=100", xlim=c(-6, 6))
abline(v = mean(samp_size100), col = "black")

hist(samp_size500, col ="yellow",main="Sample size=500", xlim=c(-6, 6))
abline(v = mean(samp_size500), col = "black")


# 1. All the plots are normal distributions. 
# 2. looking at the 6 plots we see that as we increase the sample size, the standard deviation decreases,
# as our plot shrinks. 
# 3. The shrinking of the plot, justifies the ??/sqrt(N) standard deviation as mentioned in Central
# limit theorem, as N increases standard deviation decreases. 
# 4. All the plots have mean which is close to the true mean of the 10,000 samples.


