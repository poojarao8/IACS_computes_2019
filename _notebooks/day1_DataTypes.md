---
layout: post
title:  Data types
date:   2019-08-05
day: 1
---


# Data Types 

## Numbers

Python has two main ways to represent numbers (with some more advanced variations of those that we won't talk about): integers (called `int`s) and floating point numbers (called `float`s). Here are some examples of integers:


```python
5  
-8  
17849  
-10000  
0  
1
```




    1



Notice that integers are just the positive and negative whole numbers, and zero. Below are some examples of floating point numbers:


```python
1.5  
17.0  
2.0008  
376.1  
-10000.2  
```

One interesting example here is 17.0. Although to us this may look the same as 17, to Python the two are different as one is an integer (17) and the other a float (17.0). Why are they called *floating point numbers*? This refers to how they are stored by the computer. We won't confuse/bore you with the details here, but essentially floating **point** numbers in Python are numbers with a decimal **point** in them. 


```python
type(17.0)
```

The function `type` shows you the type on any object in python. The function `print` prints the value. You can embed them into each other!


```python
print(type(3))
print(type(3.2))
```

You used numbers in the last lesson to do some basic arithmetic. For the most part, you won't have to worry about whether your number is an integer or a floating point number, as Python detects the kind of number appropriate for what you want. However, it's important to know that there is a difference, as other programming languages (and, in fact, older versions of Python) require closer attention to the type of a number.

There are two other types that can be used to represent numbers in Python, though they are less common. These types are *long* and *complex.* The long type allows you to use larger numbers, and is usually used automatically by Python as necessary. The complex type allows you to use complex numbers (numbers with an imaginary component), however it requires some extra code to use, and you won't be required to use it in this course.

## Strings

A string is a set of characters contained inside quotation marks (""). For example, the string below:


```python
"Hello World!"
```

Strings are always enclosed in either single or double quotes, like in the example above. It doesn't matter whether you use single or double quotes, as long as you close a string with the same one you used to start it.

Strings are made up of a series of individual characters. Python actually thinks of strings as *lists of characters* and just like any list (more to come later on lists), we can only look at a single piece of it if we want to:


```python
"Hello World!"[4] # gives us the 4th character of "Hello World!"
```

Most normal people would say that the 4th character of "Hello World!" is an "l", but according to Python, it's actually the "o". This is because Python starts counting at 0, rather than 1. The 0th character of "Hello World!" is "H", the 1st character is "e", and so on...

Strings allow us to manipulate more than just numbers, and a lot of the operations we have for numbers also work on strings (albeit a little differently). Here's what addition looks like with strings:


```python
"Hello" + "World!"
```


```python
"I" + " ate" + " pizza."
```


```python
"3" + "7"
```

The last example is one to take note of. Because the 3 and 7 above are interpreted as strings, the addition behaves as if they were strings. If this is what you wanted to happen, then great! Most of the time though, this probably is not what you wanted to happen. Make sure you're working with the right types when programming!

## Booleans

The last data type we'll talk about is booleans. Whereas there are infinitely many possibilities for what a string or number can be, a boolean is only ever one of two things: either `True` or `False`


```python
True
```


```python
False
```

Booleans are the type that get returned when you do comparisons, for example:


```python
6 > 3
```


```python
6 > 8
```


```python
6 <= 6 #Less than or equal to
```


```python
6 >= 17 #Greater than or equal to
```


```python
7 == 9 #Two equals signs checks for equality
```


```python
7 != 9 #not equal to
```

### Logic

Because we've introduced booleans, now is a good time to talk about some special operators that are associated with booleans. Of these special operators, the most common ones you'll see are `and`, `or`, and `not`

The `and` operator checks whether two booleans are both simultaneously True


```python
True and True
```


```python
True and False
```


```python
False and False
```

The `or` operator checks to see if AT LEAST ONE of the inputs is True.


```python
True or False
```


```python
False or True
```


```python
False or False
```


```python
True or True #This case is not always intuitive, so be careful!
```

Also note that the in programming, the meaning of `or` is a little different from the 'or' we use in everyday English speech. Often, when we say 'or' in everyday speech, we mean one or the other, but not both. When programming, the 'or' will evaluate also to True if both inputs are True, unlike in common English usage.

Finally, the `not` operator simply switches a True to a False, and a False to a True


```python
not True
```


```python
not False
```
