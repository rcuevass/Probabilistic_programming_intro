# An introduction to probabilistic programming 
#### by Rogelio Cuevas


This fast-changing world demands that professionals keep up with the changes and new trends in their fields. This is clearly not an exception for data scientists. As many other data scientists, I have found MeetUps to be an invaluable resource to be on top of things. Only in the Greater Toronto Area there are over 40 data science and engineering related MeetUps that I find interesting. Needless to say it is practically impossible for me to attend all of them but there are few that keep me quite busy. One of them is the one focused on Probabilistic Programming.  

Probabilistic programming has gained a lot of attention due to its promise of making easier the task for a developer to define a probability model and then solve such models automatically. That is, from a universe of possible interactions between elements of a given system and data observed from it, one can learn which interactions are the most relevant to explain the observations. 

Putting this in context, if you think of data science as a spectrum that goes from statistics (simple modeling, simple computations and introspection focused to find a correct model) to machine learning (complex modeling, high computation, speed and quality prediction focused to find a performing model), one can think of probabilistic programming as the best of two words: define a custom probabilistic model that provides, based on the data observed, probability distributions of your model parameters instead of only point estimators. This feature makes the model interpretable and very powerful: one can get point estimators from probability distributions but not the other way around. 

There are several libraries that allow one to do probabilistic programming. The ones I am aware of are PyMC3 (Python), Stan (Python and R) and emcee (Python). In what follows I will show a simple example of how to use PyMC3 for classification. This is part of that Probabilistic Programming MeetUp I mentioned earlier (yes, we have coding sessions!). For this example I will use the famous Kaggle Titanic dataset.

 
```
import os
```
