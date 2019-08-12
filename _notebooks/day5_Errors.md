---
layout: post
title:  Errors
date:   2019-08-12
day: 5
---


# Errors

I'm sure by now you've encountered an error or two when trying to run your programs. Up until now, an error would generally cause Python to cease execution of the program and print some kind of complaint to the screen, which is sometimes what we want the program to do, and sometimes not. 
These error messages can themselves be used to find out what is wrong with your program. When you encounter an error, don't panic. The best thing to do is to read the text of the error message and see if you can find any clues as to what went wrong in your code. After that, if you can't find it, try searching the internet ([stackoverflow.com](https://stackoverflow.com/) in particular is very useful!). Nowadays, for just about every error you encounter, somebody else will encountered it before and written about it online.

However, sometimes the code we write will produce an error but we wish the program to continue running anyway. Sometimes your code will be broken in such a way that doesn't produce an error message (but it will give you the wrong answer). This can be particularly difficult to debug. 

Below we'll learn some ways to produce our own error messages, and describe ways we can work with errors so that our programs only break when we want them to. 

## Assert statements

Probably the simplest way for a programmer to generate an error on their own is through an *assert statement*. The `assert` keyword takes an expression and checks to see if that expression evaluates to `True`. If it does, then the program is allowed to continue. If not, it raises an *exception* (essentially an error) and terminates the program. 

Let's take a look at this simple function which takes two lists, multiplies them together element-by-element, and adds up the result.


```python
def dot(a, b):             # find out how long the list a is
    answer = 0             # initialize a variable to hold our answer
    for x, y in zip(a, b): # loop over the lists
        answer += x * y    # multiply each matching element of a and b, and add to answer
    return answer          # return the answer
```

Can you think of a reason this that function might behave unexpectedly? What would happen if the lists had different lengths? Well, if `a` is shorter than `b`, (or `b` shorter than `a`), this function will still give an answer without us ever knowing something is wrong. 


```python
def dot(a, b):
    assert len(a) == len(b) # Make sure the two lists have equal length
    answer = 0              # initialize a variable to hold our answer
    for x, y in zip(a, b):  # loop over the lists
        answer += x * y     # multiply each matching element of a and b, and add to answer
    return answer           # return the answer
```


```python
dot([1,2,3],[4,5,6])
```




    32




```python
dot([1,2,3,3,3,3,3],[4,5,6])
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    <ipython-input-4-f077d6d949c0> in <module>
    ----> 1 dot([1,2,3,3,3,3,3],[4,5,6])
    

    <ipython-input-2-16660ae540a0> in dot(a, b)
          1 def dot(a, b):
    ----> 2     assert len(a) == len(b) # Make sure the two lists have equal length
          3     answer = 0              # initialize a variable to hold our answer
          4     for x, y in zip(a, b):  # loop over the lists
          5         answer += x * y     # multiply each matching element of a and b, and add to answer


    AssertionError: 



```python
dot([1,2],[4,5,6])
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    <ipython-input-5-02c8af38ad61> in <module>
    ----> 1 dot([1,2],[4,5,6])
    

    <ipython-input-2-16660ae540a0> in dot(a, b)
          1 def dot(a, b):
    ----> 2     assert len(a) == len(b) # Make sure the two lists have equal length
          3     answer = 0              # initialize a variable to hold our answer
          4     for x, y in zip(a, b):  # loop over the lists
          5         answer += x * y     # multiply each matching element of a and b, and add to answer


    AssertionError: 


We can make our assert statement more useful by putting in a message that will be displayed if the assertion fails:


```python
def dot(a,b):
    assert len(a)==len(b) , "The lists given are not the same length."
    answer = 0
    for x, y in zip(a, b):
        answer += x * y
    return answer
```


```python
dot([1,2,3,3,3,3,3],[4,5,6])
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    <ipython-input-7-f077d6d949c0> in <module>
    ----> 1 dot([1,2,3,3,3,3,3],[4,5,6])
    

    <ipython-input-6-b7a3605a328f> in dot(a, b)
          1 def dot(a,b):
    ----> 2     assert len(a)==len(b) , "The lists given are not the same length."
          3     answer = 0
          4     for x, y in zip(a, b):
          5         answer += x * y


    AssertionError: The lists given are not the same length.



```python
dot([1,2,3],[4,5,6])
```




    32



## Try blocks

Sometimes you can predict what kind of errors your code might run into, and immediately know how to fix it. Remember when we tried to write a function that solves the quadratic equation? We ran into a problem that sometimes our quadratic would have complex solutions (solutions with an imaginary part). We could just define a function that always uses complex numbers, but using complex numbers where they're not needed isn't really optimal. While this can be solved using an if statement, for the sake of demonstration, let's use a *try block* to fix this problem. Here's the new version of our quadratic solver:


```python
import math
import cmath # "complex math"
```


```python
def solver(a,b,c):
    try:
        x1 = (-b + math.sqrt(b**2 - 4 * a * c)) / (2 * a)
        x2 = (-b - math.sqrt(b**2 - 4 * a * c)) / (2 * a)
    except ValueError:
        x1 = (-b + cmath.sqrt(b**2 - 4 * a * c)) / (2 * a)
        x2 = (-b - cmath.sqrt(b**2 - 4 * a * c)) / (2 * a)
    print(x1, x2)
```


```python
solver(2, 1, 1)
```

    (-0.25+0.6614378277661477j) (-0.25-0.6614378277661477j)


The above function will work for both real and complex answers! And if the answer is real, it won't use complex numbers (causing that unsightly `+0j` in the solution).

Let's go over the try block in detail. The code first tries to run the code under the `try` keyword. If it succeeds (i.e. no exceptions occur), then it continues on to the print statement. However, if an exception occurs (as would happen if `math.sqrt` was given a negative number), it looks to see if we've given it a fall-back option in case that exception should occur, in the form of an `except` statement. To do this we write `except` and then the name of the error we're expecting (`math.sqrt` issues a `ValueError` if it encounters a negative number). The actual naming of the error is optional. If you just write `except:`, then the code below it will be exectued if *any* exception occurs. You can even list multiple types of exceptions in a single except statement if you wish.

There are two more possible keywords that can be used to create blocks beneath a `try` block: the `else` keyword, and the `finally` keyword. They are not very common as they have very specific uses, but for any who are interested, I'll give a brief summary here. Anything in an `else` block of code will only be executed if the initial `try` block executed successfully (and not if the `except` block is what executed). Exceptions raised in the `else` block will *not* be caught by the `except` statement, which may be a good thing if you only want the `except` block to catch a very specific exception. 

The `finally` keyword is used to create a block of code that is executed whether or not an exception is raised. If an exception is raised that is caught by an `except` block, the `finally` block will run after the `except` block. If an exception is raised that is *not* caught by an `except` block, then the finally block will run *before* the exception is reported. In this way, it's sometimes used to 'sneak in' code between the generation of an exception and the termination of the code execution.


```python

```
