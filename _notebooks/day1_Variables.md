---
layout: post
title:  Variables
date:   2019-08-08
day: 1
---


# Variables

In Python, we can assign names to values. For example, here we assign the name `my_number` to a number. We can then refer to this number by our new name rather than by the value - we do this here by calling `print` using this new name. 


```python
my_number = 5
print(my_number)
```

    5


Assigning names to quantities in a code is called *defining variables*. You can think of a *variable* as a human-readable label (i.e. a nickname) for a bit of data in the computer's memory. When we use the variable name in our code, the program knows that we are really referring the data. 

In Python, variable names can be made up of lower case letters, UPPER CASE LETTERS, numbers and `_underscores_`. They cannot start with numbers or contain spaces. Although there are not really any other rules for variable names, there are certain *conventions* that Python programmers tend to follow to keep their code readable and organized. It's standard practice to start variable names with a lower case letter and to seperate words with underscores, e.g. `my_awesome_variable_name`. 

A slightly more complex example is calculating the area of a rectangle:


```python
length = 7
width = 12
length * width
```




    84



There are several advantages of using variables in our code.

The first is readability. As you continue to code, you'll soon be reading programs written by other people (or your past self). It's way more useful to know what each number is if the person gave that number a (sensible) name. The example written above is a fair example. Anyone reading that code will know that 7 is the length of something and 12 is the width. To be even more informative, we could even write it like this:


```python
length = 7
width = 12
area = length * width
print(area)
```

    84


Now anyone reading our code knows that we wanted to calculate an area. Also note here that we've defined the variable `area` using two other variables. Because we've already told the computer what `length` and `area` mean, it knows that when we use them to calculate the area, we really mean `area = 7 * 12`. 

When choosing our variable names, it's important to choose names that are descriptive, so that someone reading our code can work out what it is doing. For example, let's look at the above example again with some different variable names:


```python
a = 7
aa = 12
aaa = a * aa
print(aaa)
```

    84


Someone reading our code wouldn't have any idea that `a`, `aa` or `aaa` correspond to the length, width and area of a rectangle. This isn't such a big deal for a short program such as this, but for larger programs with 10s or even 100s of different variables, choosing sensible variable names becomes increasingly important to keep a track of what the code is doing!

Another advantage of variables is that they allow us to use the same quantity in more than one place. Let's think back to algebra, when we were try to solve a quadratic equation such as:

$$2x^2+x-1=0.$$

This is a generalization of the quadratic equation

$$ax^2+bx+c=0,$$

which has solutions found using the well-known formula

$$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}.$$

Let's write some code that can find x for us.


```python
from math import sqrt #This allows us to do square roots using sqrt( )
a = 2
b = 1
c = -1

x1 = (-b + sqrt(b**2 - 4 * a * c)) / (2 * a)
x2 = (-b - sqrt(b**2 - 4 * a * c)) / (2 * a)

print(x1, x2)
```

    0.5 -1.0


In the above example, if we wanted to solve a different equation, perhaps the following:

$$x^2+6x-27=0$$

then we can easily just change the values of `a`, `b`, and `c`, and then hit `shift`+`enter`. Python does the rest for us! Without variables, we would have to retype those long formulas all over again, or go through and change all of the values by hand!

Now let's take a closer look at some of the things we just did. We've been using `=` to assign values to the variables. This is called the *assignment operator*, and the way it's used is pretty important. 

In math, the the equals sign states that two quantities are the same. However, in programming this is not the case. The assignment operator `=` is used to tell the computer to *do* something. When we use the assignment operator, we're telling the computer to *assign* the label on the left-hand side of the equals sign to is on the right-hand side. 

Therefore, the left- and right-hand sides of the equals sign are *not* the same in programming! In the quadratic example above, the computer created a variable called `a`, and then stored the value of 2 in `a`. It then did similarly for `b`, `c`, `x1`, and `x2`. Let's look at some more examples:


```python
price = 1.50
print(price)
```

    1.5



```python
price = 1.75
print(price)
```

    1.75


The assignment operator is telling the computer: "Create a variable with this name, and store this value in that variable". 

What if we want to *check* the equality of two things? The way we do this in Python is with *two* equals signs, like in the examples below:


```python
price == 1.75
```




    True




```python
price == 1.50
```




    False



Play around with the above examples using the price variable until you understand the difference between using a single equals sign and using two equals signs.

Note that the equals sign treats its left and right sides differently. Let's illustrate this with an example:


```python
1.50 = price
```


      File "<ipython-input-10-407f9b60ad94>", line 1
        1.50 = price
                    ^
    SyntaxError: can't assign to literal



What happened above? Python thinks we are trying to assign the value of `price` to a variable called `1.50`. As mentioned above, variables names in Python are not allowed to start with a number and the only punctuation they're allowed to contain are underscores, so when we run this we get a `SyntaxError`. 

Let's look at some more ways that the assignment operator in Python is different from the equals sign in math:


```python
a = 6
print(a)
```

    6



```python
a = a + 1
print(a)
```

    7



```python
a = a*2
print(a)
```

    14


In math, if someone writes

$$a = a + 1$$

you might be tempted to try to solve for $a$ and then find out that the above statement is impossible! But in programming, we're not interested in solving for $a$, and that's not what the code above does. When Python sees this, it looks at the right hand side and evaluates it. At the time, `a` was 6, so it did `6 + 1` and got 7. It then saw that we wanted to assign that to `a`, so it *reassigned* `a` to be 7 instead of 6. When we printed `a`, it told us `a` was now 7. 

Variables can be set to be any of the data types we've already talked about. Numbers, strings, and booleans can all be assigned to a variable and then used later. Here are some examples:


```python
name = "Elizabeth"
print(name)

birthyear = 1926
print(birthyear)

likes_corgies = True
print(likes_corgies)
```

    Elizabeth
    1926
    True


A quick word of warning before we move on: although it's *possible* to give your variables all sorts of names, be careful not to use the same name as an existing Python function. For example:


```python
print = 67
```

It worked... Now let us try to use the print function.


```python
print("Hi!")
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-16-753269468413> in <module>
    ----> 1 print("Hi!")
    

    TypeError: 'int' object is not callable


## Practice Problems

Write some code that creates an integer variable with value between 10 and 99. 
Add 10 to that variable, then print it.


```python

```

Write some code that creates an integer variable with value between 10 and 99. Print the quotient and remainder of that integer resulting from division by 7.


```python

```

Write some code that creates a variable and assign to it a string containing your name (e.g. "Liz"). Print this string twice. (Guess how to print a string a couple of times!)


```python

```

Write some code that creates two variables, and assign each variable to a string containing an animal (e.g. "cat" or "dog"). Add these two strings together and print the result.


```python

```

## Advanced Problems 

Create two variables, `A` and `B` (booleans). Write a print statement that returns the *exclusive or* for these two variables. Use as many additional variables as necessary.

An *exclusive or* returns `True` if only one of `A` and `B` is true, and `False` if `A` and `B` are either both true and both false. The following table summarizes this.

$$
\begin{array}{c | c | c}
   A & B & Answer \\
   \hline
   T & T & F \\
   T & F & T \\
   F & T & T \\
   F & F & F
\end{array}
$$


```python

```

Write some code that saves a number to the variable `num_minutes`. Convert that number to be read in days:hours:minutes and print this to the screen. Use as many additional variables as necessary. The following table gives you some inputs with the correct outputs so you can test your code's accuracy.

$$
\begin{array}{c | c}
   Input & Answer \\
   \hline
   43 & 0 : 0 : 43 \\
   432 & 0 : 7 : 12 \\
   4321 & 3 : 0 : 1 \\
   43219 & 30 : 0 : 19
\end{array}
$$

Hint: the function `print` can be called with more that one *argument* by separating them with commas:


```python

```


```python

```
