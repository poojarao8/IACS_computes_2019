---
layout: post
title:  Review
date:   2019-08-12
day: 6
---


# Day 5 Review

On day 5, we looked at dictionaries, errors & exceptions and advanced functions.

## Dictionaries


```python
# Define an empty dictionary 
empty_dict = dict()
# Can also do it this way
another_empty_dict = {}
print(empty_dict)
print(another_empty_dict)
```

    {}
    {}



```python
# Define a dictionary from a list of keys and values
house_dict = {'Gryffindor': 'red',
              'Ravenclaw': 'blue',
              'Slytherin': 'green',
              'Hufflepuff': 'yellow'}
house_dict
```




    {'Gryffindor': 'red',
     'Ravenclaw': 'blue',
     'Slytherin': 'green',
     'Hufflepuff': 'yellow'}




```python
# access an element
house_dict['Gryffindor']
```




    'red'




```python
# add an element
house_dict['Thunderbird'] = 'purple'
house_dict
```




    {'Gryffindor': 'red',
     'Ravenclaw': 'blue',
     'Slytherin': 'green',
     'Hufflepuff': 'yellow',
     'Thunderbird': 'purple'}




```python
# iterate over keys
for k in house_dict.keys():
    print(k)
```

    Gryffindor
    Ravenclaw
    Slytherin
    Hufflepuff
    Thunderbird



```python
# iterate over values
for v in house_dict.values():
    print(v)
```

    red
    blue
    green
    yellow
    purple



```python
# iterate over items
for k, v in house_dict.items():
    print(k, v)
```

    Gryffindor red
    Ravenclaw blue
    Slytherin green
    Hufflepuff yellow
    Thunderbird purple



```python
# test if something is in a dictionary
print('Gryffindor' in house_dict)
print('red' in house_dict) # note this checks the keys, not the values!
print('green' in house_dict.values())
```

    True
    False
    True


## Errors & exceptions


```python
# use an assert statement to check before things go wrong 
import math

def sqrt(n):
    assert n >=0, 'n must be greater than 0!' # make sure to provide a helpful message!
    
    return math.sqrt(n)
```


```python
sqrt(4)
```




    2.0




```python
sqrt(-3)
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    <ipython-input-11-8be5c01c52c0> in <module>
    ----> 1 sqrt(-3)
    

    <ipython-input-9-3bf80b3516d1> in sqrt(n)
          3 
          4 def sqrt(n):
    ----> 5     assert n >=0, 'n must be greater than 0!' # make sure to provide a helpful message!
          6 
          7     return math.sqrt(n)


    AssertionError: n must be greater than 0!



```python
# use a try block to smoothly handle when things go wrong

def sqrt_or_zero(n):
    try:
        return math.sqrt(n)
    except ValueError: # if math.sqrt is given a negative number, it will raise this
        return 0
```


```python
sqrt_or_zero(845)
```




    29.068883707497267




```python
sqrt_or_zero(-12.2356)
```




    0



## Advanced functions

This silly example shows that you should always remember about **scope** within your code and be particularly careful with naming conflicts.


```python
b = 23

print('At the start, b is {}'.format(b))

# the b that this function takes as an argument is not the same as the variable 
# b which I just defined, but its own private variable that shall exist within 
# the body of the function
def all_the_bs(b):
    print('b is {}'.format(b))
    
    # by using b in this for loop, I'm essentially reassigning 
    # this variable. It now has lost all memory of its value before 
    # the for loop. 
    for b in range(4):
        print('and now b is {}'.format(b))
    
    # here I'm defining a function within a function(!)
    # the b it takes as its argument is its own private variable
    # and is not the same as the variable b used in the outer functon
    def nested_b(b):
        print('b in the nest is {}'.format(b))
    
    nested_b(5)
    
    # this is the value it had at the end of the for loop
    print('b is now {}'.format(b))
    
    b = 6
    
    # I've now redefined b so it takes this value
    print('at the end of the function b is {}'.format(b))
    
all_the_bs(17)

# this is the value of b that I assigned right at the start
print('and finally b is {}'.format(b))
```

    At the start, b is 23
    b is 17
    and now b is 0
    and now b is 1
    and now b is 2
    and now b is 3
    b in the nest is 5
    b is now 3
    at the end of the function b is 6
    and finally b is 23



```python
# if I want to give some inputs default values, I can use keyword arguments
def pow(a, n=2):
    # calculate a to the power of n
    return a**n
```


```python
# this uses the default value of n
pow(2)
```




    4




```python
pow(2,2)
```




    4




```python
pow(2,6)
```




    64




```python
# problems can be solved using recursion by calling functions from themselves
def am_i_prime(n, divisor=2):
    assert type(n) == int, 'This only works for integers!'
    if divisor > n/2:
        print('I am prime!')
        return True
    elif n / divisor % 1 == 0:
        print('I can be divided by {} so am not prime'.format(divisor))
        return False
    else:
        return am_i_prime(n, divisor+1)
```


```python

```
