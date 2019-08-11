---
layout: post
title:  Advanced lists
date:   2019-08-11
day: 6
---


# Advanced Lists

Having a built-in list type is one of the many strengths of Python. In this notebook we'll talk about some of the more advanced features of lists.

## List Comprehension

We have seen several different ways of creating lists in Python. Many of these can be found in most modern programming languages. However, Python has its own unique way of quickly creating lists: *list comprehension*.

Though you don't need to be familiar with mathematical set notation to understand list comprehension, those who are familiar will benefit from the comparison. For this reason, we've included a little bit below. The list we'll be making can be written in set notation as the following:  
$$ S = \{ 2n \; \mbox{|} \; n \in \{0,1,2,...,20\} \} $$

This is read as '2n such that n is in the set of integers from 0 to 20'. Ultimately this is the set of even numbers from 0 to 40. How would we make this list in Python using the tools we already have?


```python
the_list = []

# There are many ways to do this, but we've chosen one below.
for i in range(41):        # Loop from 0 to 40
    if i % 2 == 0:         # if i is even,...
        the_list.append(i) # ...append it to our list
        
print(the_list)
```

    [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]


List comprehension provides a more succinct way to do this. What took us `4` or `5` lines of code above can actually be done in a single line. Below we create the same list using list comprehension:


```python
the_new_list = []
for i in range(21):
    the_new_list.append(2*i)
print(the_new_list)
```

    [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]



```python
the_new_list = [2 * x for x in range(21)] # compare this line to the set notation written above
print(the_new_list)
```

    [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]


The basic syntax of a list comprehension is 

 \[*`modified_iter_item`* **`for`** *`iter_item`* **`in`** *`iterable`*\]

What will the following codes do?


```python
print([i for i in "Hello!"])
```

    ['H', 'e', 'l', 'l', 'o', '!']



```python
print([len(i) for i in ["Hello", "Hey there!", "How are you?"]])
```

    [5, 10, 12]



```python
print([8 for i in range(8)])
```

    [8, 8, 8, 8, 8, 8, 8, 8]



```python
print([1 for i in range(8)])
```

    [1, 1, 1, 1, 1, 1, 1, 1]


What else can we do with list comprehensions? The above could be extended to multiples of any number.


```python
print([3 * x for x in range(21)])
```

    [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60]



```python
for i in range(21):
    print(i)
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20


We can add an if statement to the end of our list comprehension as a sort of *filter* to further control which values get added to our list. Here we will print the odd members of `range(21)`. First we tell Python to make a list of all integers from 0 to 20, but tell it to only include numbers that satisfy the condition of being odd.


```python
print([x for x in range(21) if x % 2 != 0])
       # make list            # but only if odd
```

    [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]


We can do some fairly intricate things by combining the basic commands `for x in` and `if`. For example:


```python
print([x for x in range(1001) if x % 11 == 0 and x % 13 == 0 ])
```

    [0, 143, 286, 429, 572, 715, 858]


What did this do? We printed all the numbers less than 1001 that are multiples of both 11 and 13.

Here's another more intricate example that uses a list comprehension to replace nested for loops.


```python
a = [x + y for x in range(5) for y in range(5)]

b = []
for x in range(5):
    for y in range(5):
        b.append(x + y)
        
print("list a:", a)
print("list b:", b)
print(a == b)
```

    list a: [0, 1, 2, 3, 4, 1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 3, 4, 5, 6, 7, 4, 5, 6, 7, 8]
    list b: [0, 1, 2, 3, 4, 1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 3, 4, 5, 6, 7, 4, 5, 6, 7, 8]
    True


In summary, list comprehension is a technique that allows you to quickly make lists on the fly, using fewer temporary variables and fewer lines of code. If the structure isn't intuitive for you now, that's OK. Everything we did using list comprehensions you can also do using regular loops. However for those who code often, list comprehensions can be a neat trick that can in some cases can significanly speed up your code (as they tend to be more computationally efficient).


## Practice Problems

Create a list of strings that say `n is even`, where `n` is every even number in a given range. For example:
* Input: `10`
* Output: \[`0 is even`, `2 is even`, `4 is even`, `6 is even`, `8 is even`, `10 is even`\]


```python

```

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get \[3, 5 ,6 , 9\]. The sum of these multiples is `23`. Using a list comprehension, find the sum of all the multiples of 3 or 5 below 1000. (The problem is from [projecteuler.net](projecteuler.net)). *Hint*: we can find the sum of a list using the function `sum`. 


```python

```

Using a list comprehension, create a new list made up of words from word from a given list that either start with a capital letter, or start with `a` and have exactly `5` characters. For example:

* Input: \[`jess`, `Ayla`, `Sanket`, `alena`, `jimmy`\]
* Output: \[`Ayla`, `Sanket`, `alena`\]


```python

```


```python

```
