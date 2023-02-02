# data
data <- read.csv('t3.csv')

sample_s <- 1e5

# uniform prior
prior_p <- runif(sample_s)

sample_ind <- sample(length(data$hit), sample_s, replace=TRUE)
#prior_size <- sample(data$hit, sample_s, replace=TRUE)
#prior_n <- sample(data$rtp, sample_s, replace=TRUE)
prior_size <- data$hit[sample_ind]
prior_n <- data$rtp[sample_ind]

# generative model
# binomial distribution
likelihood <- rbinom(sample_s, prior_size, prior_p)
#hist(likelihood)

post <- prior_p[likelihood==prior_n]
#post <- likelihood / prior_size

hist(post, breaks=30)

mean(post)

