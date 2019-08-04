---
layout: post
title:  Review
date:   2019-08-04
day: 7
next:
prev:
---


# Day 6 Review

On day 6, we looked at advanced lists and classes.

## Advanced lists


```python
# list comprehensions are fast, compact ways of making lists of things
slow_list = []

for i in range(10):
    slow_list.append(i**(1/3))
    
print(slow_list)

fast_list = [i**(1/3) for i in range(10)]
print(fast_list)
```

    [0.0, 1.0, 1.2599210498948732, 1.4422495703074083, 1.5874010519681994, 1.7099759466766968, 1.8171205928321397, 1.912931182772389, 2.0, 2.080083823051904]
    [0.0, 1.0, 1.2599210498948732, 1.4422495703074083, 1.5874010519681994, 1.7099759466766968, 1.8171205928321397, 1.912931182772389, 2.0, 2.080083823051904]



```python
# we can be fancy and include if statements and even multiple loops
print([i*2 for i in range(20) if i % 3 == 0 and i > 5])

lst = []
for i in range(20):
    if i % 3 == 0 and i > 5:
        lst.append(i * 2)
print(lst)
```

    [12, 18, 24, 30, 36]
    [12, 18, 24, 30, 36]



```python
print([a + b for a in range(4) for b in range(6) if b % 2 == 0])

lst = []
for a in range(4):
    for b in range(6):
        if b % 2 == 0:
            lst.append(a + b)
print(lst)
```

    [0, 2, 4, 1, 3, 5, 2, 4, 6, 3, 5, 7]
    [0, 2, 4, 1, 3, 5, 2, 4, 6, 3, 5, 7]


## Classes


```python
# define a class 
class Tree(object):
    
    # constructor
    def __init__(self, species, age):
        # member variables
        self.species = species
        self.age = age
        self.leaf_color = 'green'
        
    # define a member function 
    def update_leaf_color(self, color):
        self.leaf_color = color
        
    # define a string representation
    def __str__(self):
        return "{} Tree, age = {}".format(self.species, self.age)
```


```python
# make a Tree object
my_tree = Tree('oak', 5)

print(my_tree)
```

    oak Tree, age = 5



```python
# access the member variables
my_tree.species
```




    'oak'




```python
my_tree.age
```




    5




```python
my_tree.leaf_color
```




    'green'




```python
# call a member function
my_tree.update_leaf_color('orange')
my_tree.leaf_color
```




    'orange'




```python

```
