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
length(data1)
col_names = c("class","label")
dfToy<-data.frame("classes" = data1,"label" = sample(0:1,100,replace=T))
dfToy


res <- discretize(data1,categories = 3)
dfToy<-data.frame("classes" = res,"label" = sample(0:1,100,replace=T))
dfToy
class(data1)


# Train on two-thirds of the data
b = round(2*nrow(dfToy)/3, digit=0)
data_train <- dfToy[1:b, ]

# Test on the remaining one third of the data
data_test <- df[(b+1):nrow(dfToy), ]

head(data_train,5)

sbrl_model <- sbrl(data_train, iters=20000, pos_sign="1",
                   neg_sign="0", rule_minlen=1, rule_maxlen=3,
                   minsupport_pos=0.10, minsupport_neg=0.10,
                   lambda=10.0, eta=1.0, nchain=25)
print(sbrl_model)

############
