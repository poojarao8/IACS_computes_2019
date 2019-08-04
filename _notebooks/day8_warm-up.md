---
layout: post
title:  Warm-up
date:   2019-08-04
day: 8
next:
prev:
---


# Practice


#### Problem 1: warm-up
Write a function `leap` that determines whether a given year is a normal year or a leap year.

Leap years occur mostly every 4 years, but every 100 years we skip a leap year unless the year is divisible by 400.


```python
def leap(year):
    if year % 4 == 0:
        if not year % 100 == 0 or year % 400 == 0:
            return True
    return False

leap(2100)
```




    False



Next, write a function `leap_years` that tells you which years out of the next `n` years are going to be leap years.


```python
def leap_years(n):
    
    l = []
    cy = 2018
    
    for i in range(1, n):
        check = leap(cy + i)
        if check:
            l.append(cy + i)
            
    return l

leap_years(20)
```




    [2020, 2024, 2028, 2032, 2036]




```python
def fancy_leap_years(n):
    return [i for i in range(2018, 2018 + n) if leap(i)]

fancy_leap_years(50)
```




    [2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048, 2052, 2056, 2060, 2064]



#### Problem 2: advanced

Write a function which implements [Pascal's triangle](http://mathforum.org/dr.math/faq/faq.pascal.triangle.html).


```python
def pascal(n):
    
    if n == 1:
        print([1])
        return [1]
    if n == 2:
        print([1])
        print([1,1])
        return [1,1]
    
    prev_level = pascal(n - 1)
    new = [1]
    for i in range(len(prev_level) - 1):
        new.append(prev_level[i] + prev_level[i + 1])
    new.append(1)
    print(new)
    return new
```


```python
pascal(7)
```

    [1]
    [1, 1]
    [1, 2, 1]
    [1, 3, 3, 1]
    [1, 4, 6, 4, 1]
    [1, 5, 10, 10, 5, 1]
    [1, 6, 15, 20, 15, 6, 1]





    [1, 6, 15, 20, 15, 6, 1]




```python

```
