---
layout: post
title:  Simulation
date:   2019-08-05
day: 8
---


# Simulation


```python
# Importing random that helps use generate random values and choices
import random

# Using the random.choice function to draw a random value from a given list
l = ['H','T']
random.choice(l)
```

## Coin Toss - Fair coin


```python
# Initializing the count of heads
count_h = 0
count_t = 0

# Outcomes of a trial
l = ['H','T']

# Number of trails
n = 10000

# Repeating the experiment n times
for i in range(n):
    if random.choice(l) == 'H':
        count_h += 1
    else:
        count_t += 1

print("Heads appears: ",count_h*100/n, "%")
print("Tails appears: ",count_t*100/n, "%")

```

    Heads appears:  50.02 %
    Tails appears:  49.98 %


## Monty Hall Problem


```python
# Initializing the counts for staying and switching
count_switch = 0
count_stay = 0

# Number of trails
n = 10000

# Assiging doors with names
doors = ["A", "B", "C"]

# Repeating the game n number of times
for i in range(n):
    car_door = random.choice(doors)
    user_choice = random.choice(doors)
    open_door = random.choice([i for i in doors if i not in [car_door, user_choice]])
    if user_choice != car_door:
        count_switch += 1
    else:
        count_stay += 1

print("switching wins: ",count_switch*100/n,"%")
print("staying wins: ",count_stay*100/n,"%")
```

    switching wins:  65.65 %
    staying wins:  34.35 %

