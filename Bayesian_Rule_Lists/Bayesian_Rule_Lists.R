# Script to show a simple model with STAN
#load libraries


# Important reference:
# http://stackoverflow.com/questions/32979292/own-data-in-the-arules-package-for-ruleinduction

install.packages('sbrl')
library('sbrl')

install.packages('arules')
library('arules')

######
# TOY MODEL...
data1 <- sample(1:30,100,replace = T)
data1
res <- discretize(data1,categories = 3)
res
class(data1)

############

df<-read.csv("train_easy.csv",header = TRUE)
head(df,5)
df$X<-NULL
head(df,5)


# Train on two-thirds of the data
b = round(2*nrow(df)/3, digit=0)
data_train <- df[1:b, ]

head(data_train,5)

# Test on the remaining one third of the data
data_test <- df[(b+1):nrow(df), ]


# data_train, data_test are dataframes with factor columns
# The class column is "label"
data_train_factors <- sapply(data_train,as.factor)
head(data_train_factors,5)
# Run the sbrl algorithm on the training set
sbrl_model <- sbrl(data_train, iters=20000, pos_sign="1",
                   neg_sign="0", rule_minlen=1, rule_maxlen=3,
                   minsupport_pos=0.10, minsupport_neg=0.10,
                   lambda=10.0, eta=1.0, nchain=25)
print(sbrl_model)

# Content of sbrl_model
names(sbrl_model)
sbrl_model$rulenames

sbrl_model$rs

sbrl_model$featurenames

sbrl_model$mat_feature_rule

# Make predictions on the test set
yhat <- predict(sbrl_model, data_test)
yhat




