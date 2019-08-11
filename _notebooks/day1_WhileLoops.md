---
layout: post
title:  While loops
date:   2019-08-11
day: 1
---


# While Loops

In programming and computing (maybe even life in general), there are times where we need to do the same thing multiple times sequentially. For example, lets say we needed to know the first 10 perfect square numbers. How would we do that? There's always the brute force method, calculating them all individually:


```python
1**2
```




    1




```python
2**2
```




    4




```python
3**2
```




    9




```python
4**2
```




    16




```python
5**2
```




    25




```python
6**2
```




    36




```python
7**2
```




    49




```python
8**2
```




    64




```python
9**2
```




    81




```python
10**2
```




    100



Very cumbersome, right? Surely there's a better way to do this! Maybe we could use a variable?


```python
a = 1        # Start our variable at 1
print(a**2)  # print the square of our variable
a += 1       # add 1 to our variable (so it's now 2) and store the change
print(a**2)  # print the square of our variable again, and so on...
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)
a += 1
print(a**2)   # by this time, a should be 10, so we can print this last number and quit
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


That was actually worse. But looking at what we just did, we did the same thing 10 seperate times. We started with variable `a`, assigned to it the value 1, printed `a` squared, added 1 to it and then repeated. Once we had written the first 3 lines of code, we could have copied and pasted the second and third lines 8 more times rather than typing them out by hand. 

But thankfully there's a better way to do this: using a *loop*. 

What is a loop? A loop is a block of code that will be executed multiple times, assuming the correct conditions have been met. There are two main categories of loops: `for` loops and `while` loops. Anything you can do with a for loop, you can do with a while loop. And anything you can do with a while loop, you can do with a for loop. As we shall see, for some problems it's easier to use for loops, and for others it's easier to use while loops.

As an example, lets reprint the first 10 perfect squares using a while loop:


```python
a = 1           # start a at 1
while a < 11:   # Keep repeating while a is less than 11
    print(a**2) # print a squared
    a = a + 1   # add 1 to a and store the result. This is called *incrementing* a
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


Loops in python have a very specific structure. The first line defines the condition for continuation followed by a colon, then they are followed by an indented body that defines what should be done each time the loop is executed. Each line in the body must be indented under the condition line (this indentation is how Python knows what is inside the loop and what isn't). 

Another way to understand a while loop is to compare it to an if statement (from our last lesson). An if statement checks some condition (for example, is `a < 11`), and if it is true, it executes the block of indented code underneath it. A while loop starts out the same. It checks some condition, and if it is true, it executes the block of code underneath. However, once that block is done, a while loop goes back and checks the condition again. If the condition is still true, it repeats the block of code underneath, and continues this cycle until the expression evaluates to false.

Notice that it took us only 4 lines of code to do what we did in 20 lines of code above. 

## A Common Problem

While loops afford us a lot of utility, they also give us new ways to make mistakes. Due to the nature of loops, however, some of these mistakes can be especially disastrous. As an example, in the example below, we've 'accidentally' forgotten to increment the variable `i` at the end of the loop.

*__IMPORTANT: DO NOT__* actually run the next cell
of code. We have run it for you, and the output should already be displayed below. Read the cell, and the given output. Then keep reading the text below.


```python
i = 1
while i < 10:
    print(i)
```

What we created here is called an *infinite loop*. This is a loop that will keep running forever (it will never terminate). Unfortunately, they're pretty easy to create accidentally and can be rather annoying as they can cause your computer to drastically slow down and maybe even become unresponsive. However, if you get caught in an infinite loop, **don't panic**! Hit the button with the square (stop) icon located at the top of this window to force the computer to stop running the code. If this doesn't work, try going to the `Kernel` menu at the top of the notebook and selecting `Interrupt`.

What happened here? This code keeps repeating because the end condition is never met. We created a variable named `i` and assigned 1 to it. Then we told the computer to keep printing `i` as long as `i` is less than 10. However, over the course of the loop, we never changed the value of `i`. Therefore `i` was *always* 1, and `i` was *always* less than 10. Without interrupting it, this program would run forever (or until your computer crashed).

What can we do to make it work? We can remember to increment `i`, as in the cell below, so that at some point the end condition is met and the while loop terminates.


```python
i = 1
while i < 10:
    print(i)
    i = i + 1
```

    1
    2
    3
    4
    5
    6
    7
    8
    9


Do note that the last line printed was a 9, and not a 10. That is because the conditional in the header of the while loop must be true for the body to be executed. This code requires that `i < 10` for the body to be executed, so we will never print the number 10 since 10 is not less than 10. Thus when `i` equals 10, the loop's condition is false and the print statement inside the body of the loop will not be executed.

## Worked Examples

Write a loop that prints the numbers 3 to 17.


```python
a = 3          # start a at 3 (this works because we print a before we increment. See below.)
while a < 18:  # We could also have written a <= 17 here if we wanted. The result would be the same.
    print(a)   # I want to print a each time.
    a = a + 1  # After printing, increment a so that the loop will eventually terminate (infinite loops are bad)
```

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


Write a loop to print the even numbers between 20 and 50


```python
# SOLUTION 1:

a = 20         # we want 20 to be the first number we print
while a < 51:  # we want to stop at 50, so put 'less than 51' here
    print(a)   # just like previous examples
    a = a + 2  # Here, I can increment by 2 instead of 1 so that a stays even
```

    20
    22
    24
    26
    28
    30
    32
    34
    36
    38
    40
    42
    44
    46
    48
    50



```python
# SOLUTION 2:
# An alternative solution that shows a slightly different way of thinking about the problem

a = 20
while a < 51:           #so far the same as above
    if a % 2 == 0:      # Use a condition to check if a is even
        print(a)        # If a is even, then print it
    a = a + 1           # increment a by 1 whether we print or not
```

    20
    22
    24
    26
    28
    30
    32
    34
    36
    38
    40
    42
    44
    46
    48
    50


Write a loop to sum all perfect squares less than 1000.


```python
# First we create a variable to store our sum.
my_sum = 0

a = 1                       # This will be the first number we square and add to my_sum
while a**2 < 1000:          # We want to stop once a**2 is greater than 1000
    my_sum = my_sum + a**2  # Add a**2 to my_sum, then store the answer back in my_sum
    a = a + 1               # Move on to the next value to be squared (increment a)

print(my_sum)               # at the very end (outside the loop) print the result (my_sum)
```

    10416


## Practice Problems 

Write a loop to print the first 10 natural numbers in descending order. (Print 10, then 9, then 8...down to 1)


```python

```

Write a loop to print the odd numbers between 17 and 67.


```python

```

Write a loop to print the first 11 multiples of the number 3 (start with 0). So your loop should print 0, 3, 6, ...


```python

```

Write a loop to calculate the product of the first 5 numbers. (Hint: The answer is 120. This is also known as the factorial function. This code should be very similar to the loop that sums the first 10 numbers.)


```python

```

## Advanced Practice Problems

**Divisors**  
Write some code to print out each pair of divisors of an integer variable `n` that you create.


```python

```

**Growing Numbers**  
Write a cell that when executed prints the numbers from 1 to n (a variable that you create), but prints each number that number of times (i.e. the number 1 gets printed once, the number 2 gets printed twice, the number 3 get printed 3 times, and so on).


```python

```

**Series**  

One cool thing that loops will let you do is quickly calculate very long sums, especially if there's some pattern that you can follow to find each term in the sum. For example, here's a simple sum:

$$ 1 + 2 + 3 + \dots + n$$

This sum simply adds up all of the natural numbers from 1 to $n$. A worked example evaluates this sum for $n = 10$. Generalize this code so that it works for any positive integer $n$.


```python

```

Once you have that sum working, modify your code to try these sums:

$$1 + \frac{1}{2} + \frac{1}{4} + \frac{1}{8} + \dots + \frac{1}{2^n}$$


```python

```

$$1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} + \frac{1}{5} - \dots + \frac{(-1)^{n+1}}{n} $$


```python

```


```python

```
