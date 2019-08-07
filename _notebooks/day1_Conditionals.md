---
layout: post
title:  Conditionals
date:   2019-08-07
day: 1
---


# Conditionals

## If Statements

So far, the code we've written has been made up of a set of instructions that the computer works through and executes one-by-one. Sometimes when we're writing code, it's useful to have sections whose behaviour depends on the value of variables calculated earlier on in the program. Instead of the program executing all of the lines in the program in sequence, the program can branch so that if some statement is true it executes one set instructions, and if it's false it executes another set of instructions. 

Let's start by defining a variable `a`.


```python
a = 1
print(a)
```

    1


Let's add 1 to `a` and print out its new value:


```python
a = a + 1
print(a)
```

    2


Now that that cell is executed, let's look at the following piece of code:


```python
if a < 5:
    a = a + 1
print(a)
```

    3


The first time you run the above code, you should see the number 3 printed (assuming you've run the previous cells). This code does pretty much what you would expect. First, the computer checks to see if `a` is less than 5. If it is, then it adds 1 to `a`, and stores the result in `a`. Next, it prints `a`. Since `a` was 2, it met the condition of being less than 5, so the computer added 1 to `a`. Then the computer printed `a` (because of the way this is written, the computer will print `a` regardless of its value). `a` is now 3. 

If you select the cell above and hit `shift`+`enter`, it will run again. What do you think will happen? Try it out! Play with this cell until you understand what is happening. Eventually, `a` will equal 5, and the expression `a < 5` will be `False`. The condition in the if statement will no longer be satisfied, so the program will skip the instruction `a = a + 1` and head straight to the line below. 

Let's look more closely at that last piece of code. The *if* statement looks for a boolean (something that's either `True` or `False`). If that boolean is `True`, then the following code will run. If that boolean is `False`, then the following code will be skipped.

In our code, we used `a < 5`. This statement evaluates to a boolean. If we'd done something instead like `if a + 1`, then this would not have worked as `a + 1` would return an integer. 

With this knowledge, we can see why stuff like this works:


```python
if True:
    a = a * 3
print(a)
```

    9


Since the if statement expects a boolean, we could just put a boolean in there (instead of a statement that evaluates to a boolean). Unfortunately, this isn't particularly useful: `if True` will mean that section of code will always run (so we might as well not have the if statement there at all), and `if False` will never run (so we might as well not have that section of code there at all). 

Often, we want our if statement to apply to multiple instructions, and not just one. To do this, we indent all the lines that we want to include in the if statement block, like so:


```python
b = 3
if a < 10:
    a = a + 1
    b = b - 1
print("a is", a)
print("b is", b)
```

    a is 10
    b is 2


Note: from now on it will be very important to pay attention to indentation. Indentation is how Python detects what you want to be inside the if block. In the example above, the 3rd and 4th lines are inside the if block, so they will only run if the if statement succeeds. The print statements are outside the if block, so they will always run even if the if statement evaluates to `False`. 

As you will see later, indentation is used a lot in other Python features to indicate different blocks of code. In other languages, these code blocks are often indicated with brackets instead (e.g. C++, Java, R) or with additional statements indicating the end of the blocks (e.g. Fortran, Ruby). 

## The Else and Elif Keywords

If you want the computer to execute a different piece of code should the if condition fail, you use an `else` statement. Here's an example:


```python
if a < 5:
    a = a + 1
else:
    a = a - 4

print(a)
```

    6


The else statement is partnered with the preceding if statement. In the case that the if evaluates to `False`, the block following the else statement will run instead. Note that else statements are optional (e.g. in the above section we didn't have an else statement, which meant that the code did nothing if the if statement evaluated to `False`), but can be very useful.

A common mistake for beginners is to write a condition next to the `else` keyword, like this:


```python
if a < 5:
    a = a + 1
else a >= 5:
    a = a -4

print(a)
```


      File "<ipython-input-7-7a7c4efa53f3>", line 3
        else a >= 5:
             ^
    SyntaxError: invalid syntax



However, this gives an error. This is because the else keyword doesn't require a boolean expression to run. It *automatically* runs in all the cases that the if statement fails. 

What if we have a long list of conditions, and we want to do something different in each case? We can use the `elif` statement, which is short for *else if* (programmers love missing out letters to so that they can type faster). An example is below.


```python
if a < 5:
    a = a + 1
elif a == 5:
    a = a * 2
else:
    a = a - 10

print(a)
```

    -4


The `elif` statement will only run if none of the preceding statements ran (including the if statement with which it is paired and any other preceding elif statements). You can have as many elif statements as you want following an if statement. The computer will check each statement from top to bottom until one of three things happens:

1) a statement evaluates to `True` (thus running the indented code)  
2) it hits an else statement, thus running the indented code there  
3) It hits the bottom (in the case that there is no else statement)

Note that in this `if -> elif -> else` construction, only one set of indented code will ever run.

Play with the above cell. Try to guess what number the computer will print before you run the cell each time. Think about how the computer goes about choosing which piece of code to run.

*Note*: in Python, we can also use `else if` instead of `elif`. There is really no difference other than 3 extra characters, so which you use in your code is simply personal preference. 

## Worked Examples 

1) Write some code that checks if a number is less than 10, and if it is, print `my_number is less than 10`.


```python
my_number = 5   # This is the number we are checking the value of

# Now to check if my_number is less than 10. if statements always
# end with a colon
if my_number < 10:   
    
    # Here we are indented underneath the if statement. All code
    # indented here will be executed if the if statement is true
    print("my_number is less than 10")
```

    my_number is less than 10


In the above code, we used the pound sign (#) to write comments. Python will ignore any text we write on the rest of the line following this sign. This is useful because we can write notes to other programmers (and our future selves) without the computer thinking we're trying to code something (which would result in a ton of errors).

Here's the above code without comments:


```python
my_number = 5  

if my_number < 10:   
    print("my_number is less than 10")
```

    my_number is less than 10


2) Write some code that checks if a number is less than 10 or less than 20. If it's less than 10, print `my_number is less than 10`. If it's less than 20 but greater than 10, print `my_number is greater than 10 but less than 20`.


```python
my_number = 17    # This is the number we are checking the value of

# Now to check if my_number is less than 10. if statements always
# end with a colon
if my_number < 10:
    
    # Here we are indented underneath the if statement. All code
    # indented here will be executed if the if statement is true
    print("my_number is less than 10")
    
# Next we are also checking if my_number is less than 20. Note: we
# only check if my_number is less than 20 AFTER checking if its less than 10.
# If my_number = 7, then the first if (line 4) would be true, and Python
# would not check if this elif statement were true. If we had more elif
# statements, they are checked sequentially from top to bottom.
elif my_number < 20:
    # Here we are indented underneath the elif statement. All code
    # indented here will be executed if the elif statement is true
    print("my_number is greater than 10 but less than 20")
```

    my_number is greater than 10 but less than 20


Here's the above code without comments:


```python
my_number = 17    

if my_number < 10:
    print("my_number is less than 10")
elif my_number < 20:
    print("my_number is greater than 10 but less than 20")
```

    my_number is greater than 10 but less than 20


3) Write some code that checks if a number is less than 10 or less than 20. If it's less than 10, print `my_number is less than 10`. If it's less than 20 but greater than 10, print `my_number is greater than 10 but less than 20`. If the number is neither of these, print `my_number is greater than 20`.


```python
my_number = 17    # This is the number we are checking the value of

# Now to check if my_number is less than 10. if statements always
# end with a colon
if my_number < 10:
    
    # Here we are indented underneath the if statement. All code
    # indented here will be executed if the if statement is true
    print("my_number is less than 10")
    
# Next we are also checking if my_number is less than 20. Note: we
# only check if my_number is less than 20 AFTER checking if its less than 10.
# If my_number = 7, then the first if (line 4) would be true, and Python
# would not check if this elif statement were true. If we had more elif
# statements, they are checked sequentially from top to bottom.
elif my_number < 20:
    # Here we are indented underneath the elif statement. All code
    # indented here will be executed if the elif statement is true
    print("my_number is greater than 10 but less than 20")

# Next we have an else statement. This captures ALL other cases.
# If all of the above if and elif statements are false, then
# the else is found to be true and the code indented below is 
# executed.
else:
    # Here we are indented underneath the else statement. All code
    # indented here will be executed if the else statement is true
    print("my_number is greater than 20")
```

    my_number is greater than 10 but less than 20


Here's the above code without comments:


```python
my_number = 34

if my_number < 10:
    print("my_number is less than 10")
elif my_number < 20:
    print("my_number is greater than 10 but less than 20")
else:
    print("my number is greater than 20")
```

    my number is greater than 20


## Practice Problems 

Write some code that creates an variable containing an integer between 10 and 99. If it's less than 50, add 25 to it and print the result. Otherwise, just print the number.


```python

```

Write some code that creates a variable containing an integer that's either 1, 2, or 3. Write an `if -> elif -> else` statement that will print the word corresponding to that integer. For example, if that integer is 1, this cell should print the word `one`.


```python

```

Write some code that creates a variable and stores an integer there. Use an if statement to print `Even` if the number is even or `Odd` if the number is odd. (If you want to make your program more robust, you can have it print an error message if it receives a non-integer). 

*Hint*: If a number is even, it will give a remainder of 0 when divided by 2. Recall how the modulus ( % ) is used to give the remainder.


```python

```

## Advanced Problem

Recall the `type` function. Create a variable that contains a string, an integer, or a float. Check the type of this variable. If it's a string, print `This is a string!`. Otherwise print `This is a number!`. If this is an integer and it is bigger than `10`, print `A large number!`.


```python

```
