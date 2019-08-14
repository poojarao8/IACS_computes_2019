---
layout: post
title:  Advanced functions
date:   2019-08-14
day: 5
---


# Advanced Functions

This notebook covers a smattering of some of the advanced features of functions. These concepts and tools should help you write more robust and efficient functions.

## Scope

There are some things we need to know about when using functions. Recall the age function we wrote yesterday.


```python
def age(birth_year, birth_month, birth_day):
    today = 17
    this_month = 8
    this_year = 2019
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        return this_year - birth_year - 1
    else:
        return this_year - birth_year
```


```python
age(1990,11,1)
```




    28



 Note that in our age function, we have 6 variables. Their names are `birth_year`, `birth_month`, `birth_day`, `today`, `this_month`, and `this_year`. What's currently in those variables?


```python
today
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-3-beb90ce425b0> in <module>
    ----> 1 today
    

    NameError: name 'today' is not defined


Hmm. It says today is not defined. This is actually what should happen. At this moment in time, the 6 variables inside age() *do not exist* anywhere in the computer. The variables `birth_year`, `birth_month`, and `birth_day` are only created when `age()` is called, and these variables can only be used by `age(`). At the time they are created, they are given the values that we put in the parentheses. The variables `today`, `this_month`, and `this_year` are created *inside* `age()`. Here's the important part: when `age()` has finished executing, all 6 of these variables are destroyed.

The variables that a function are said to be within the function's *scope*. A variable can only be used if it is *within scope*. 

Why does python do this? Well one reason is to prevent naming conflicts. Often in programming you will be using functions that other people wrote. What happens if that person used a variable name that you also used? For a silly example, what if another piece of code had a variable called today but needed to call age? That code might look something like this:


```python
today = "Tuesday"   # Create a variable called today and give it a value
age(1986, 9, 20)    # age has a variable called today that it sets to a number
print(today)        # What's in today?
```

    Tuesday


Without the protective structure of scope, the variable today would have been overwritten by the function age, and our code might not have performed the way we anticipated down the road.

In Python, functions can also look outside themselves for variables that have been already defined. Let's test this using some variable `a`:


```python
a = 7.98
```


```python
def age(birth_year, birth_month, birth_day):
    today = 13
    this_month = 7
    this_year = 2016
    print("I can see a! It's", a) #This function can "see" a because it has been previously defined.
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        return this_year - birth_year - 1
    else:
        return this_year - birth_year
```


```python
age(1986, 9, 20)
```

    I can see a! It's 7.98





    29



When a function encounters a variable, it first looks within the variables defined within the function to see if it finds a match. If it can find one, it uses that one. If it can't, then it looks outside the function. If we had defined another variable `a` inside `age()`, then `age` would have printed that one instead (try it!)

So we've seen that a function can see a variable outside its scope, but what would happen if we tried to do this?


```python
def age(birth_year, birth_month, birth_day):
    today = 13
    this_month = 7
    this_year = 2016
    a = a + 1 # change the variable a
    print("I can see a! It's", a)
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        return this_year - birth_year - 1
    else:
        return this_year - birth_year
```


```python
age(1990, 11, 1)
```


    ---------------------------------------------------------------------------

    UnboundLocalError                         Traceback (most recent call last)

    <ipython-input-9-1e44a38b6a62> in <module>
    ----> 1 age(1990, 11, 1)
    

    <ipython-input-8-ee601757633c> in age(birth_year, birth_month, birth_day)
          3     this_month = 7
          4     this_year = 2016
    ----> 5     a = a + 1 # change the variable a
          6     print("I can see a! It's", a)
          7     if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):


    UnboundLocalError: local variable 'a' referenced before assignment


OK, so a function can *see* a variable outside its scope in Python, but isn't allowed to change it. This is probably a good idea (for the reasons stated above).

It actually is possible to change outside variables inside a function by using the `global` keyword. This is strongly discouraged unless you know what you're doing, but this is how we'd do it:


```python
def age(birth_year, birth_month, birth_day):
    global a #g ive age access to the global variable a. Generally not a good idea.
    today = 13
    this_month = 7
    this_year = 2016
    a = a + 1 # change the variable a
    print("I can see a! It's", a)
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        return this_year - birth_year - 1
    else:
        return this_year - birth_year
```


```python
age(1990, 11, 1)
```

    I can see a! It's 8.98





    25



While accessing outside variables in a function is a cool feature, it's not usually considered a good practice. One of the big advantages of using functions is that it *compartmentalizes* your code. Compartmentalization is a technique where large codes are split into smaller chunks and each coded separately. This affords us not only readable code, but each piece of the code can then be reused later on if necessary (as you continue coding, you'll find yourself reusing your old code a lot!). If a function that you wrote requires an outside variable to work, then it becomes more difficult for you (and others) to reuse later. And if your function changes an outside variable, it can very easily lead to unintended consequences when used as part of a larger code (and this becomes a real pain to debug). If your function needs information from outside, simply write that function to take that information in as an argument, and if your function needs to change something on the outside, write it as an output.

## Keyword Arguments

We've seen how to specify which inputs a function needs in order to operate, and how they are handled by the function. There are times, however, when we may want to specify a default value for one or more of the function inputs. A default value is simply a value for a variable that is automatically stored there in the event the user doesn't specify an input. In Python, we define default values by creating *keyword arguments*. I'll give some examples of when this is a good idea, but first, let's look at how we do this. 

Here's a function that creates a list of points between two numbers. A third input defines the number of points to be in the list.


```python
def linspace(a=0, b=1, n=11):  # create a list of n points starting at a and ending at b
    
    # The size of each step
    dx = (b - a) / (n - 1)
    
    # The answer to return
    answer = []
    
    # Our loop
    for i in range(n):
        
        # Append correct answer to the list
        answer.append(a + dx * i)
        
    # Return our answer
    return answer
```

We can see the definition of the keyword arguments in the first line. When we define the function arguments, `a`, `b`, and `n`, we also provide default values. If the user (the person calling the function) doesn't input one or more of these values, the function will still work, and simply use the default value. When defining a function, any number of variables can have default values. We can even have some arguments with default values and some without. The only rule is that the keyword arguments must appear *after* the arguments without default values. So 

```python
def linspace(a=0, b, n=11):
```
would not work, but 
```python
def linspace(a, b=1, n=11):
```
would be fine.

Because our `linspace` function has a default value for all of its parameters, we can acually call this function without inputs, and it will use all the default values provided:


```python
linspace()
```




    [0.0,
     0.1,
     0.2,
     0.30000000000000004,
     0.4,
     0.5,
     0.6000000000000001,
     0.7000000000000001,
     0.8,
     0.9,
     1.0]



We can specify only the first input, or the first two inputs, like this:


```python
linspace(-1) # Will give 11 points from -1 to 1
```




    [-1.0,
     -0.8,
     -0.6,
     -0.3999999999999999,
     -0.19999999999999996,
     0.0,
     0.20000000000000018,
     0.40000000000000013,
     0.6000000000000001,
     0.8,
     1.0]




```python
linspace(0, 100) # will give 11 points from 0 to 100
```




    [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]



So it's ok to specify `a` and `b`, and leave `n` unspecified, but what if we want to specify `n`, but not `b`. You might try this:


```python
linspace(0, , 21) # create a list of 21 numbers from 0 to 1?
```


      File "<ipython-input-16-b60c426e4ff3>", line 1
        linspace(0, , 21) # create a list of 21 numbers from 0 to 1?
                    ^
    SyntaxError: invalid syntax



Unfortunately, Python doesn't understand like this. Up to now, Python has been interpreting the arguments based on their position. But if we want to miss out one or more of the arguments, we can no longer do this. Instead, we must specify the arguments by name:


```python
linspace(a=0, n=21) # set linspace's a to 0 and n to 21, but use the default for b
```




    [0.0,
     0.05,
     0.1,
     0.15000000000000002,
     0.2,
     0.25,
     0.30000000000000004,
     0.35000000000000003,
     0.4,
     0.45,
     0.5,
     0.55,
     0.6000000000000001,
     0.65,
     0.7000000000000001,
     0.75,
     0.8,
     0.8500000000000001,
     0.9,
     0.9500000000000001,
     1.0]



This is pretty flexible, and we could even pass in the arguments in a completely different order if we feel like it:


```python
linspace(n=21, a=0, b=4) 
```




    [0.0,
     0.2,
     0.4,
     0.6000000000000001,
     0.8,
     1.0,
     1.2000000000000002,
     1.4000000000000001,
     1.6,
     1.8,
     2.0,
     2.2,
     2.4000000000000004,
     2.6,
     2.8000000000000003,
     3.0,
     3.2,
     3.4000000000000004,
     3.6,
     3.8000000000000003,
     4.0]



We can also mix up passing in arguments by position and by name:


```python
linspace(0, n=21) # pass in a and n, but use the default value for b
```




    [0.0,
     0.05,
     0.1,
     0.15000000000000002,
     0.2,
     0.25,
     0.30000000000000004,
     0.35000000000000003,
     0.4,
     0.45,
     0.5,
     0.55,
     0.6000000000000001,
     0.65,
     0.7000000000000001,
     0.75,
     0.8,
     0.8500000000000001,
     0.9,
     0.9500000000000001,
     1.0]



When is this useful? Maybe you're writing a code that is very technical, but you want everyday people to be able to use it. Maybe the average person doesn't need to be able to specify everything, but a more informed user would like the ability to be more specific. For example, you could have used a default parameter for the Caeser shift cypher code you wrote yesterday. If you put the default shift at 5, then most users could simply write encrypt('message') and decrypt('message'), but someone who wants more control over the function could specify their own shift.

A common use of default parameters is to define boolean arguments, and use these to control what the function does or doesn't do. For example, what if we wanted our linspace function to print its variable dx, but only sometimes? We could introduce a boolean keyword argument to do this. 


```python
def linspace(a=0, b=1, n=11, print_dx=False):
    
    # Make sure everything is the correct type
    a = float(a)
    b = float(b)
    n = int(n)
    
    # The size of each step
    dx = (b - a)/(n - 1)
    
    #print dx if the user wants to
    if print_dx:
        print("dx =", dx)
    
    # The answer to return
    answer = []
    
    # Our loop
    for i in range(n):
        
        # Append correct answer to the list
        answer.append(a + dx * i)
        
    # Return our answer
    return answer
```


```python
linspace(0, 1, 21) # the default behavior
```




    [0.0,
     0.05,
     0.1,
     0.15000000000000002,
     0.2,
     0.25,
     0.30000000000000004,
     0.35000000000000003,
     0.4,
     0.45,
     0.5,
     0.55,
     0.6000000000000001,
     0.65,
     0.7000000000000001,
     0.75,
     0.8,
     0.8500000000000001,
     0.9,
     0.9500000000000001,
     1.0]




```python
linspace(0, 1, 21, print_dx=True) # this time print dx
```

    dx = 0.05





    [0.0,
     0.05,
     0.1,
     0.15000000000000002,
     0.2,
     0.25,
     0.30000000000000004,
     0.35000000000000003,
     0.4,
     0.45,
     0.5,
     0.55,
     0.6000000000000001,
     0.65,
     0.7000000000000001,
     0.75,
     0.8,
     0.8500000000000001,
     0.9,
     0.9500000000000001,
     1.0]



## Recursion

We've already learned one way to repeat a piece of code over and over again: loops. Specifically while loops and for loops. Let's introduce another way of doing this called *recursion*. A recursive function is one that calls itself. 

Let's seee how that works by converting a function that uses a for loop into a recursive function.

The following function uses a for loop to print powers of 2. It takes a nonnegative integer n, which is the highest power of 2 that it will print.


```python
def powers(n):
    for i in range(n + 1):
        print(2**i)
```


```python
powers(6) # print the first 7 powers of 2 (including 2**0)
```

    1
    2
    4
    8
    16
    32
    64


Another way to do this is with recursion. Here's how this function would look with recursion:


```python
def powers(n):
    if n == 0 :
        print(1)      # Handle the n == 0 case EXPLICITLY
    else:
        powers(n - 1) # this is where the recursive magic happens
        print(2**n)
```


```python
powers(6)
```

    1
    2
    4
    8
    16
    32
    64


Let's take a look at how recursion works. The first step is identifying the *base-case* problem. This is the problem in our loop where we want to the recursion to stop, and often has a simple solution. For our problem, the base case is when $n = 0$. For this we print $2^0 = 1$.

Next is the tricky part. We need to work out how to go from the iterations of our loop to the base case. For our problem, we can see that if we start with $n$ and keep subtracting 1 from it, we will eventually reach 0, the base case. This is what we do in the `else` block when we call `powers(n-1)`. 

So what happens when we call `powers(6)`? When it's calls `powers(5)`, which calls `powers(4)`, and so on until `powers(1)` calls `powers(0)`. `powers(0)` now satisfies the condition `n == 0`, so instead of calling `powers(-1)`, it simply prints the number 1 then hands control back to `powers(1)`. `powers(1`) prints $2^1$, and then hands control back to `powers(2)`, and so on. Once control gets handed back to `powers(6)`, it prints $2^6$ and the function ends.


When writing recursive functions, it's easy to accidentally create infinite loops. This will happen if you forget to create a base case or if your code gets sidetracked somehow and never manages to reach the base case (e.g. imagine we accidentally wrote `powers(n+1)` in the code above - `n` would keep increasing and never reach 0, so the function would keep calling itself forever). 

Let's see what happens if we call our function with a negative number (thereby creating an infinite loop):


```python
powers(-2)
```


    ---------------------------------------------------------------------------

    RecursionError                            Traceback (most recent call last)

    <ipython-input-27-c3d515ee1ab6> in <module>
    ----> 1 powers(-2)
    

    <ipython-input-25-8c8e73c450a0> in powers(n)
          3         print(1)      # Handle the n == 0 case EXPLICITLY
          4     else:
    ----> 5         powers(n - 1) # this is where the recursive magic happens
          6         print(2**n)


    ... last 1 frames repeated, from the frame below ...


    <ipython-input-25-8c8e73c450a0> in powers(n)
          3         print(1)      # Handle the n == 0 case EXPLICITLY
          4     else:
    ----> 5         powers(n - 1) # this is where the recursive magic happens
          6         print(2**n)


    RecursionError: maximum recursion depth exceeded in comparison


You might have guessed that this would run forever. Fortunately Python helps prevent this from happening by limiting how far down into a recursive function you can go. If you exceed that number, it quits. If it did not do this, then this function would have kept running until our computer ran out of memory and crashed. 

When we ran powers(-2), it called powers(-3), which called powers(-4), and so on. It never reached the base case of 0, so it eventually reached the maximum recursion depth, and printed an error.

Almost any loop can be written using recursion instead. In fact, there's a whole branch of programming (*functional programming*) based around recursion. Examples of functional programming languages include Haskell, Scala, OCaml and Lisp.


```python
def sillystring(mystring):
    # we actually have two base cases: when the length of the string is 1 or 0.
    # Luckily we can cover both of these cases with a single condition
    if len(mystring) < 2:
        return mystring # If the length of the string is 1 or 0, do nothing
    else:
        # in this block we're guaranteed to be working with a string of 2 or more characters
        # Let's just look at the first 2 characters of our string and make the
        # necessary modification
        
        # We leave the first character intact, attach an underscore,
        # and then call sillystring on the rest of mystring
        return mystring[0] + "_" + sillystring(mystring[2:])
    
```


```python
sillystring("I like potatoes.")
```




    'I_l_k_ _o_a_o_s_'



## Practice Problems

Write a function called `factorial` with an argument `n` as input, which returns the production of the first `n` positive integers starting from 1. Use a for loop to implement the function.

**Example:** $5! = 5*4*3*2*1 = 120$, $2! = 2*1 = 2$


```python

```

Now implement a recursive version of the factorial function


```python

```

Implement a recursive function to calculate $f(x) = 3x$.


```python

```

Implement a recursive function to calculate the sum of the first `n` positive integers.


```python

```

The Fibonacci sequence is given by: 

$0,1,1,2,3,5,8,13,21,34,55,89, \dots$ 

The Fibonacci sequence is defined by the following formula: 
$$F_{n} = F_{n-1} + F_{n-2}$$
with $F_{0} = 0$ and $F_{1} = 1$.

Implement a recursive function to generate the $n$th number in the Fibonacci sequence, then use this to print the first $n$ numbers in the sequence.


```python

```

## Advanced Problems

Write a recursive function which implements Pascal's triangle: (http://mathforum.org/dr.math/faq/faq.pascal.triangle.html)


```python

```


```python

```


```python

```
