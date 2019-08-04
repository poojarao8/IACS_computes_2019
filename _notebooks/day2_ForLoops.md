---
layout: post
title:  For loops
date:   2019-08-04
day: 2
next:
prev:
---


# For Loops

We've already talked about one kind of loop, the while loop. These common programming structures allow us to repeat the same instructions over and over again.

Now that we've talked about lists and strings, this is a good time to introduce *for loops*. For many coding problems, it's more natural and convenient to use a for loop. This is particularly true in Python, where for loops have some particularly powerful features.

Let's review the first while loop we did, which was to print the squares of a sequence of numbers:


```python
i = 1
while i < 11:
    print(i**2)
    i = i + 1
```

To demonstrate a for loop, let's write one that does the same thing as this while loop. First, let's make a list of the numbers that we want to find the squares of.


```python
numlist = [1,2,3,4,5,6,7,8,9,10]
```

Now, let's make the for loop:


```python
for a in numlist:
    print(a**2)
```

And we get the same result! Let's take a look at the syntax. When we write `for a in numlist:` we're creating a new variable called `a`, and inside `a`, we store the first element of `numlist` (which is 1). We then execute the indented code in the for loop. At the next iteration of the loop, the value of `a` will be changed to be the next element of `numlist` (in this case, 2). This will continue until `a` takes the value of the last element in `numlist`. Note that the variable name `a` is arbitrary. We could name this variable whatever we want, as long as we're consistent inside the loop. A common convention (and good coding practice to make your code understandable!) is to use a variable name that describes what is inside the list. For this loop, we could have used the variable name `number` since each thing inside `numlist` is a number.

In the code above, we made the list of numbers we wanted to square before we made the loop. This wasn't actually necessary: instead, we could have defined the list in the definition of the for loop itself like this:


```python
for number in [1,2,3,4,5,6,7,8,9,10]:
    print(number**2)
```

An alternative to the above is the handy `range` function. Repeating the same action for the numbers 1 through $n$ is so common that Python has a built-in way of creating a list containing just those numbers. So instead of having to type out the numbers 1 to 10 ourselves, we can just use `range(1,11)`: 


```python
for number in range(1,11):
    print(number**2)
```

Note that just like the slices we saw when we looked at lists, `range(1,11)` will return us the numbers from 1 up to *but not including* 11. 

The `range` function is a very useful tool for making a quick list of integers. If I write `range(n,m)`, the computer will give me the integers from `n` to `m-1`. If I write `range(m)`, the computer will assume that I want to start at 0 and will give me a list of integers from 0 to `m-1`.

Because Python treats strings as "lists of characters," we can use the same for loop syntax to loop over the characters in a string. For example, here's a while loop that looks at a string, and prints each character in the string individually.


```python
mystring = "bulldozer"
for c in mystring:
    print(c)
```

So far, the main difference we've seen between while loops and for loops is that for loops eliminate the need for us to create and update our own counter. However, they're much more powerful than that. Using a for loop, we can easily iterate over multiple things at once. Let's define two lists:


```python
colors = ["red", "blue", "yellow", "green"]
prices = [76, 27, 18, 34]
```

We can iterate over these two lists at the same time using the `zip` function:


```python
for color, price in zip(colors, prices):
    print(color, "fabric costs $", price, "per yard.")
```

    red fabric costs $ 76 per yard.
    blue fabric costs $ 2 per yard.
    yellow fabric costs $ 8 per yard.
    green fabric costs $ 2 per yard.


What if we want to iterate over the elements of a list but also need to access the index of the list element? For this we can use `enumerate`:


```python
for i, color in enumerate(colors):
    print(color, "has index", i)
```

    red has index 0
    blue has index 1
    yellow has index 2
    green has index 3


## Worked Examples 

Write a for loop that prints out the integers from 3 to 16


```python
for i in range(3,17):   # i is the variable that we'll use, and the range function makes this easy
    print(i)            # i is our variable, so print it
                        # note: no need to increment i here, because the for loop
                        # takes care of this for us
```

Write a for loop that 'flips' a list of boolean variables (changes True to False and changes False to True) by creating a new list containing the 'flipped' booleans.


```python
bool_list = [True, True, False, True, False, False, True] #example list of booleans

# We need to create a new list which will be our answer. However, to create a list, we
# need to give it an initial value that won't affect the final answer. Fortunately
# Python allows us to create 'empty' lists and then put things into them later.
newlist = []

for a in bool_list:        # loop over our list of booleans
    newlist.append(not a)  # "not a" accomplished the 'flipping' of the boolean, then
                           # we appended it to our new list
print(newlist)             # print our result so we can see if it's correct
```

Write a for loop that loops through a string and converts every other character in the string to an underscore, starting with the second letter.


```python
mystring = "I like potatoes."

newstring = ""  # an empty string that we can add to later. This is analogous to when
                # we initialized a number to 0, or initialized a list to []


# Because of the nature of the problem, we need to keep track of the *index* of
# the letter in the string that we're currently looking at. This will also come
# in handy when we try to edit the characters of the string. The effect of this
# style is that we are writing a for loop that behaves very much like a while
# loop. This turns out to be quite common. It looks like this:
for i in range(len(mystring)):
    # len(mystring) tells us how long mystring is. The range function then
    # creates a list of integers that we can use to index into mylist. Our
    # variable i will automatically move through these index values.
    
    # We only want to make a change every other letter, so we need to check
    # whether our index is even or odd. Because the first letter we want to
    # change is the second letter of the string (which has index 1), we want
    # to check that our index is odd.
    if i % 2 == 1:
        # if i is odd, then we need to add an underscore to our new string
        newstring = newstring + "_"
    else:
        # otherwise, we need to simply add the next letter to our new string
        newstring = newstring + mystring[i]
        
print(newstring)
```


```python
# Here's the same solution to the above problem, without comments:
mystring = "I like potatoes."
newstring = ""
for i in range(len(mystring)):
    if i % 2 == 1:
        newstring = newstring + "_"
    else:
        newstring = newstring + mystring[i]
print(newstring)
```

## Practice Problems

Write some code that takes a list of names (as strings), and prints "Hello \_\_\_\_\_\_!" for each name in the list.


```python
namelist = ["Billy", "Matthew", "Shannon", "Kristen", "Taylor"]

# Your code here

```

Write some code that takes creates three variables: a string of any length (named `mystring`, for example), and two more strings, each of length one (named `first_letter` and `second_letter`, for example). Have that cell create a new string that is like the first string, but with each instance of `first_letter` replaced by `second_letter`.

For example, using 'peter piper', 'p', and 'g' the cell should print `geter giger`.


```python
mystring = "peter piper"
first_letter = "p"
second_letter = "g"

# Your code here
    
```

In the practice problems for the Lists module, we wrote some code that added together all of the numbers in a list of numbers. You probably used a while loop to do this. Write some code that does it with a for loop instead.


```python

```

Write some code that takes a string and prints `True` if the string is a palindrome (a word that reads the same backwards as it does forwards, e.g. 'level') and `False` if it is not. Use a for loop. (*Hint*: use both positive and negative indices to look at both ends of the string)


```python
    
```

## Advanced Problems

*Minimum*: Write some code that takes a list of numbers as input and returns the index of the smallest (most negative) number in the list. For example, given the list [4,7,-5,9,1,-2,6,4], the code would print 2. (*Hint*: If you're having trouble, try first writing some code that finds the minimum *number* itself. For the given example, the answer would be -5. Then modify your solution to instead find the index.)


```python
numlist = [4,7,-5,9,1,-2,6,4]
    
```

*Sorting*: Write some code that takes a list of numbers as input and returns a new list that contains the same numbers, but in increasing order (from least to greatest). If you did the problem above, then you can use that function in your solution to this problem. Otherwise, you can use the `.index()` and `min()` functions, as demonstrated in the example below:


```python
mylist = [4,7,-5,9,1,-2,6,4]
mylist.index(min(mylist))       # min finds the lowest number, and mylist.index() finds 
                                # the first index of that number
```


```python
# You can write your solution to the Sorting problem here:


```