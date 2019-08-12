---
layout: post
title:  Practice
date:   2019-08-12
day: 1
---


# Day 1 Practice

## Exercise 1
Let's use Python to do our math homework for us! Solve the following problems by defining some variables and using Python's arithmetic operations:

1. How much will my suitcase hold? It's a cuboid with length 81.2 cm, width 46.8 cm and height 14.89 cm - what is its volume?
1. I have a strange cubic glass that can hold 783 cm$^3$ of water. How long are its sides?
1. I am standing 15.7 m away from a building that is 4.3 m tall. Perched on top of the building directly in front of me I can see a cat, peering over the edge of the roof. How far away is that cat away from me? (Hint: think right angled triangles!)


```python
volume = 81.2 * 46.8 * 14.89
print("my suitcase has a volume of ", volume)
```

    my suitcase has a volume of  56584.3824



```python
side_length = 783**(1/3)

print("Glass side length = ", side_length)
```

    Glass side length =  9.21695047705754



```python
from math import sqrt

hypotenuse = sqrt(15.7**2 + 4.3**2)

print("My cat is {}m away from me".format(hypotenuse))
```

    My cat is 16.27820628939196m away from me


## Exercise 2

Let's have some fun with while loops and if statements!

### Square numbers 
Use a while loop to print out the first 10 square numbers (i.e. 1, 4, 9...)


```python
counter = 1

while counter <= 10:
    print(counter**2)
    counter += 1
```

    1
    4
    9
    16
    25
    36
    49
    64
    81
    100


### Triangular numbers 
From wikipedia:

> A triangular number or triangle number counts objects arranged in an equilateral triangle. The $n$th triangular number is the number of dots in the triangular arrangement with $n$ dots on a side, and is equal to the sum of the $n$ natural numbers from 1 to $n$.


1. Use a while loop to print out the first 15 triangular numbers. Hint: you may want to keep a variable that contains a running total so that you don't have to repeat calculations!


```python
counter = 1
triangular_number = 0

while counter <= 15:
    triangular_number += counter
    counter += 1
    
    print(triangular_number)
```

    1
    3
    6
    10
    15
    21
    28
    36
    45
    55
    66
    78
    91
    105
    120


2. It turns out that there's a formula for summing up the first $n$ natural numbers:

$$ \sum_n n = \frac{n (n+1)}{2} $$

   Write a second while loop that uses this formula to print the first 15 triangular numbers.


```python
counter = 1

while counter <= 15:
    print(counter * (counter + 1) / 2)
    counter += 1
```

    1.0
    3.0
    6.0
    10.0
    15.0
    21.0
    28.0
    36.0
    45.0
    55.0
    66.0
    78.0
    91.0
    105.0
    120.0


### Last divisor standing

The following numbers are all powers of 2 that have been multiplied by some prime number (i.e. their unique factors are 2 and the prime number). Use a while loop to find out what that prime number is.

*Bonus*: use your while loop to also find out what power of 2 was multiplied by that prime number.

- 98304
- 212992
- 17825792
- 2864


```python
# number = 98304
# number = 212992
# number = 17825792
number = 2864

while number % 1 == 0:
    number /= 2
    
print("The prime number is", number * 2) # We multiply by 2 here to undo the last division
```

    The prime number is 179.0



```python
# number = 98304
# number = 212992
# number = 17825792
number = 2864

counter = 0

while number % 1 == 0:
    number /= 2
    counter += 1
    
# here we subtract 1 from the counter to undo the last loop
print("The prime number is", number * 2, 'and the power of 2 is', counter - 1) 
```

    The prime number is 179.0 and the power of 2 is 4


### Alliteration is awesome

I'm writing a poem about a snake and want to include lots of alliteration for *dramatic effect*. In particular, I'm looking for words that start with the letter 's' (you know, to represent the snake's hissing). Use an if statement to test whether the following words begin with the letter s. If so, print out `<word> begins with an s!`. 

*Bonus*: I'm really looking to maximize the number of 's's in my poem, so can you think of a way to write a loop to count the number of 's's in a word and print out `<word> contains <n> s's!` if it contains 1 or more 's's?

- sand
- grass
- soil
- gravel
- swishes
- walk
- running
- slithers


```python
# word = 'sand'
# word = 'grass'
# word = 'soil'
# word = 'gravel'
# word = 'swishes'
# word = 'walk'
# word = 'running'
word = 'slithers'

if word[0] == 's':
    print(word, 'begins with an s!')
```

    slithers begins with an s!



```python
# word = 'sand'
# word = 'grass'
# word = 'soil'
# word = 'gravel'
word = 'swishes'
# word = 'walk'
# word = 'running'
# word = 'slithers'

counter = 0 # counter over the letters
s_counter = 0 # count the number s's

while counter < len(word):
    if word[counter] == 's':
        s_counter += 1
    counter += 1
        
if s_counter >= 1:
    print(word, 'contains', s_counter, "s's!")
```

    swishes contains 3 s's!



```python

```
