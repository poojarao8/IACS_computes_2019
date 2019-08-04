---
layout: post
title:  Review
date:   2019-08-04
day: 4
next:
prev:
---


# Day 3 Review

Yesterday we looked at strings and turtles.

(Note: if you're wondering why we looked at turtles, this was mainly to illustrate how libraries work. Many people write their own Python code and package it up as libraries, available for people to download using [PyPI](https://pypi.org) (the Python Package Index) and/or [conda](https://conda.io/en/latest/). So now you've seen how to use the turtles library, you should be able to download other libaries and use them in your own code!)

## Strings


```python
# Define a string
my_string = "Hi! I'm a string!"
print(my_string)
```

    Hi! I'm a string!



```python
# Access an element
an_element = my_string[4]
print(an_element)
```

    I



```python
# Slice it up 
a_slice = my_string[:3]
print(a_slice)
```

    Hi!



```python
# Reverse it
reversed_string = my_string[::-1]
print(reversed_string)
```

    !gnirts a m'I !iH



```python
# add strings 
added_string = my_string + " Who are you?"
print(added_string)
```

    Hi! I'm a string! Who are you?



```python
# find the length
len(my_string)
```




    17




```python
# make it lower case
my_string.lower()
```




    "hi! i'm a string!"




```python
# make it upper case
my_string.upper()
```




    "HI! I'M A STRING!"




```python
# split it into a list of strings
my_string.split()
```




    ['Hi!', "I'm", 'a', 'string!']




```python
# replace some characters 
my_string.replace("i", "z")
```




    "Hz! I'm a strzng!"



## Turtles


```python
# import a module 
import turtle
```


```python
# access a module function 
# here we shall create a window 
window = turtle.Screen()
```


```python
# make a turtle and get it to draw a circle
ned = turtle.Turtle()
ned.circle(4)
```


```python
# say goodbye to ned
window.bye()
```


```python

```
