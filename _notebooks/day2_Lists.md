---
layout: post
title:  Lists
date:   2019-08-05
day: 2
---


# Lists

We've learned how to assign names to variables and store things in them like numbers or strings. But sometimes, it's advantageous to use the same name to refer to a bunch of numbers or strings. For example, let's say you want to do some calculations with a some student test scores. Here's one way you could store those as variables:


```python
score1 = 89
score2 = 77
score3 = 100
score4 = 95
score5 = 88
```

This is only 5 test scores, and it took a lot of typing to store them into variables. Can you imagine what it would be like with a class of 30 students? And then what if you wanted to calculate the average of these scores? It would take longer to do that than simply not using variables at all. Fortunately there is a better, faster way. 

Instead of assigning each number to a single variable, we can combine each of the scores into a single *list* of numbers and assign this `list` to a single variable called `scores`. 


```python
scores = [89, 77, 100, 95, 88]
```

We can also print all of the test scores at once by printing this variable:


```python
print(scores)
```

You can put any kind of variable in a list, such as strings or booleans:


```python
names = ["Billy", "Matthew", "Shannon", "Kristen", "Taylor"]
print(names)
```


```python
key = [True, False, False, True, False]
print(key)
```

An important aspect of lists is that they are *ordered*. This means that the list `[1,2,3]` is different from the list `[2,1,3]`. This can work to our advantage, because each element of a list is uniquely identified by its position in the list.

Lists wouldn't be very useful if we couldn't access the individual components. To do this, we use square brackets `[ ]`. Inside the square brackets we put the position of the number (or string or boolean, etc.) that we want to use.


```python
print(scores[0])
print(scores[1])
print(scores[2])
print(scores[3])
print(scores[4])
```

*Note*: Python begins numbering the elements of the list from 0. The number used to access an element of a list (i.e. the number inside the square brackets) is called an *index*. So the first element of the list is indexed as the 0th element. What happens if we try to access scores with the index 5?


```python
print(scores[5])
```

We get an error. This is because we're trying to access an element of a list that doesn't exist.

While we can't access `scores[5]`, we *can* access `scores[-1]`. When Python encounters a negative index, it starts counting from the *end* of the list and returns the value it finds. So the last element in the list can be accessed with the index -1.


```python
scores[-1]
```

Note that this only works up until you reach the beginning of the list, so the most negative index that won't return an error is -(length of list). In our example, `scores[-5]` would return 89, the first entry of the list, but `scores[-6]` would give an error.

When we access an element of a list, it behaves just like the type that is stored in the list. For example, we can add two elements of a list (when that addition makes sense).


```python
print(scores[0] + scores[1])
```


```python
print(names[0] + names[1])
```

We can also make changes to a single element of a list (i.e. we can reassign what is stored at a certain position in the list). For example, let's say we made an error and need to change the third student's score to 79. We can do that like this:


```python
scores[2] = 79 # An index of 2 will give us the 3rd element of the list
print(scores)
```

In Python, the elements of a list don't have to be the same type. It's therefore possible for us to do something like this:


```python
randomlist = ["h", 67, True, 9, "masonry", [7, "moon", [3]], False, True]
print(randomlist)
```

From this example, we can see that we can even put lists inside of lists (and lists inside those). These are known as *nested lists*. We can access the elements of these nested lists by adding another set of brackets to the right containing the index of the element within the inner list. For example, if we want to print "moon" from the above nested list, we'd first access the nested list (which is the 6th element in the list so has index 5), then we'd access the second element (index 1) of *that* inner list:


```python
print(randomlist[5][1])
```

## Some functions we can call on lists

There are some useful built-in functions we can call on lists to help us manipulate them. A *function* is a named block of code that we can run by typing its name. We've already seen a few functions: `type` and `print` are functions that are built in to the main Python library. When we call a function, we often (but not always!) give it one or more inputs. These inputs are known as the function's *arguments*. Again, we've already seen this, as when we called the `print` function, we write its name followed by a set of parentheses containing what we want to the function to print for us (i.e. the `print` function's argument). 

The `len` function (short for length) tells us how many items are in a list.


```python
len(scores)
```

This is useful if you want to use a loop to perform the same action for all the items in a list.

Say we decided to add 5 points to the score of every student. We can do so like this:


```python
print(scores) # For reference, let's see what scores is right now
```


```python
i = 0
while i < len(scores):
    scores[i] = scores[i] + 5  # add 5 to the ith element of scores
    i = i + 1                  # don't forget to increment i
```


```python
print(scores)
```

We can use the append function to add another student's score to the list.


```python
print(scores)      # again, print beforehand for reference
scores.append(85)  # This is a special function that uses a period to act on something. Note the syntax.
print(scores)
```

The append function is very useful for building up a list from scratch (e.g. inside a loop). One very useful technique is starting an empty list and appending to it later. Accumulating elements of a list in a loop like this is very common.

*Note*: if you are working with very large loops and very long lists, then appending items to the end of the list can be very slow and should be avoided. Instead, you should create a list with the required number of elements before you enter the loop, then in the body of the loop update the elements to their correct values. Of course, this means that you need to have some idea of what the final length of the list should be, which is not always possible. In these cases, `append` can still be necessary.


```python
mylist = [] # Make an empty list 
```

The code below will now put the first 8 even numbers into `mylist`.


```python
i = 0
while i < 8:
    mylist.append(2*i)  #i runs from 0 to 7, so 2*i for each i will give us the first 8 evens
    i = i + 1
print(mylist)
```

The `del` function removes the element of the list at the index specified. For example, this code deletes the last element of scores.


```python
print(scores)
del scores[-1]
print(scores)
```

A note of caution: be careful using the `del` function in loops, as it's easy to lose track of how long your list is. This can understandably cause many errors.

So far we have seen how to add single elements to a list. But how can we append another list to a given list?


```python
a = [1,2,3,4,5]
b = [6,7,8,9,10]

i = 0
while(i < len(b)):
    a.append(b[i])
    i = i + 1
print(a)
```

There is much simpler way to append a list into another list by using the in built Python function `extend`.


```python
a = [1,2,3,4,5]
b = [6,7,8,9,10]

a.extend(b)
print(a)
```

We can test to see if a list contains some element using the keyword `in`. This will return a boolean (`True` or `False`).


```python
print(1 in a)
print(13 in a)
```

We can use the function `sorted` to sort a list.


```python
a = [98, 43, 56, 38, 99, 17, 22]
sorted_a = sorted(a)
print("a :", a)
print("sorted a:", sorted_a)
```

## Slicing

What if we want to select more than one element in our list? For this, we can use *slicing*. Let's first define a list `a`.


```python
a = [98, 43, 56, 38, 99, 17, 22]
```

To define a slice from elements between indexes `1` and `5`, we would write `[1:5]`:


```python
print(a[1:5])
```

But that only printed 4 numbers??!! In Python, a slice will return you the elements starting with the first index in the slice, up to *but not including* the last element. So `a[1:5]` returned the elements with indices 1, 2, 3, 4 but *not* 5. 

If we leave out the index before the colon, then Python will start the slice with the 0th element:


```python
print(a[:2])
```

Similarly, if we leave out the index after the colon, then the slice will go from the first index up to the end of the list:


```python
print(a[3:])
```

As you may have guessed, if we leave out both indices, then we will get the full list. In this case, `a[:]` is just the same as writing `a`.


```python
print(a[:])
```

We can use the negative indices we saw before to access elements at the end of the list. For example, we can get the last two elements of the list by writing


```python
print(a[-2:])
```

What if we want to miss out elements? We can define a *step* size, that will allow us to access every $n$th element. For example, if we want to access the 1st, 3rd and 5th elements in our list, we would define a slice with step size 2:


```python
print(a[1:6:2])
```

We can also use negative step sizes in order to print the list backwards:


```python
print(a[::-1])
```

The indexing can get a little tricky here. For example, what would we write if we wanted to print the list backwards without the last element? You may think that it would be `a[:-1:-1]`, but that just gives us an empty list:


```python
print(a[:-1:-1])
```

In fact, to do this we'd write 


```python
print(a[-2::-1])
```

What's going on here??? We can understand this by imagining that Python starts of by reversing our list, but keeping the indices of the elements the same. The second-to-last element which we wish to begin our new reversed list therefore still has the index -2. We therefore use this index as the starting point for our slice. As we haven't provided an index to the right of the first colon, Python will then print the rest of the elements after this one in the reversed list. 

## Tuples

Before we move on to some examples, let's briefly look at *tuples*. Tuples are very similar to lists, however they are computer scientists call *immutable* (un-changeable). This means that once we have defined a tuple, we cannot go back and change its elements (as we did with lists). We define a tuple in Python by using parentheses instead of square brackets. 


```python
my_tuple = (5, 7, 1, 8, 2)
```

As you can see, elements of this tuple can be accessed in the same way as the element of a list:


```python
print(my_tuple[0])
print(my_tuple[2:])
```

However, if we try to change one of the elements of the tuple, Python gives us an error:


```python
my_tuple[1] = 3
```

Due to their limitations, tuples may appear to be just a less useful type of list. However, you will often see them used to pass in arguments to functions and more complex data structures where their unchangeable nature (their immutability) can be very useful. 

## Worked Examples 

Given the list below, what is the average of the first, third, and fifth entries?


```python
# The list holding the entries we want to look at
the_list = [98, 43, 56, 38, 99, 17, 22]

# Remember, Python starts indexing at 0. So to access
# the first entry, we need index 0, to access the
# the third entry, we need index 2, and the fifth entry 
# would be index 4. We want the average, so we need to
# add the entries together and divide by the number
# of entries. So lets add the entries together.
the_average = the_list[0] + the_list[2] + the_list[4]

# We have the sum, now we need to divide by the number
# of entries.
the_average = the_average / 3

# We've calculated the average. Now we need to display 
# it
print(the_average)
```

Here's the above code without comments:


```python
the_list = [98, 43, 56, 38, 99, 17, 22]

the_average = the_list[0] + the_list[2] + the_list[4]

the_average = the_average / 3

print(the_average)
```

## Practice Problems

Write some code that creates a list that contains 5 seperate entries with value 1. (That is, the list has length 5 and every entry has value 1)


```python

```

Write some code that creates a list containing the first 17 odd numbers.


```python

```

Write some code that creates a list of all multiples of 5 less than 100.


```python

```

Write some code that sums all the entries of a list.


```python

```

Write some code that calculates the average of a list of numbers.


```python

```

Write some code that copies all numbers from the given list below that are not multiples of 2 and puts them in a new list. (Hint: This can be done using a loop with a conditional).


```python
first_list = [ 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]


```

## Advanced Problems

*Standard Deviation*: Write some code that calculates the standard deviation of a list of numbers. The formula for the standard deviation is  
  
$$ \sigma = \sqrt{\frac{1}{N-1} \sum_{i = 1}^N(x_i - \bar{x})^2}$$  
  
where $N$ is the number of elements in the list, $x_i$ is a particular element of the list, and $\bar{x}$ is the average of the list of numbers. (Hint: you will need to calculate the average first).

Test your code on the given list. The answer is approximately 31.23.


```python
test_list = [7, 39, 2, 56, 98, 74, 34, 17, 56, 88, 66, 0, 56, 34]


```

*Median*: Write some code that calculates the median of a list of numbers. The answer for test_list is 47.5.


```python

```

*Mode*: Write some code that calculates the mode of a list of numbers. The answer for test_list is 56.


```python

```
