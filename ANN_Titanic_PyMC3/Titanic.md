# An introduction to probabilistic programming 
#### by Rogelio Cuevas


This fast-changing world demands that professionals keep up with the changes and new trends in their fields. This is clearly not an exception for data scientists. As many other data scientists, I have found MeetUps to be an invaluable resource to be on top of things. Only in the Greater Toronto Area there are over 40 data science and engineering related MeetUps that I find interesting. Needless to say it is practically impossible for me to attend all of them but there are few that keep me quite busy. One of the ones that keep me busy is the [Toronto Probabilistic Programming Meetup] (http://www.meetup.com/Toronto-Probabilistic-Programming-Meetup/).  

Probabilistic programming has gained a lot of attention due to its promise of making easier the task for a developer to define a probability model and then solve such models automatically. That is, from a universe of possible interactions between elements of a given system and data observed from it, one can learn which interactions are the most relevant to explain the observations. 

Putting this in context, if you think of data science as a spectrum that goes from statistics (simple modeling, simple computations and introspection focused to find a correct model) to machine learning (complex modeling, high computation, speed and quality prediction focused to find a performing model), one can think of probabilistic programming as the best of two words: define a customized probabilistic model that provides, based on the data observed, probability distributions of your model parameters instead of only point estimators. This feature makes the model interpretable and very powerful: one can get point estimators from probability distributions but not probability distributions from point estimators. 

There are several libraries that allow one to do probabilistic programming. Some of there are [PyMC3] (https://pymc-devs.github.io/pymc3/) (Python), [Stan] (http://mc-stan.org/) (Python and R) and [Emcee] (http://dan.iel.fm/emcee/current/) (Python). In what follows I will show a simple example of how to use PyMC3 for classification. This example is part of a small project we have working on in that Probabilistic Programming MeetUp I mentioned earlier (yes, we have coding sessions!). For this example I will use the famous [Kaggle Titanic dataset.] (https://www.kaggle.com/c/titanic)

As usual, we begin by importing the needed libraries for our project

```
import numpy as np
import pandas as pd
%matplotlib inline
import matplotlib.pylab as plt
import seaborn

import pymc3 as pm
import theano.tensor as T
import theano
```

I will assume you have already download the data, so we proceed right away to read them into a dataframe 

```
dfTrain = pd.read_csv(path_+'train.csv')
```

We now take a look at the number of missing data in our dataframe:

```
dfTrain.isnull().sum()
```


