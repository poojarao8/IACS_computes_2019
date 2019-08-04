---
layout: post
title:  Practice
date:   2019-08-04
day: 5
next:
prev:
---


# Day 5 practice

## Counting Gettysburg

Here's some text (the Gettysburg Address). Our goal is to count how many times each word repeats.


```python
gettysburg_address = """
Four score and seven years ago our fathers brought forth on this continent, 
a new nation, conceived in Liberty, and dedicated to the proposition that 
all men are created equal.

Now we are engaged in a great civil war, testing whether that nation, or 
any nation so conceived and so dedicated, can long endure. We are met on
a great battle-field of that war. We have come to dedicate a portion of
that field, as a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and proper that we
should do this.

But, in a larger sense, we can not dedicate -- we can not consecrate -- we
can not hallow -- this ground. The brave men, living and dead, who struggled
here, have consecrated it, far above our poor power to add or detract.  The
world will little note, nor long remember what we say here, but it can never
forget what they did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought here have thus far so nobly
advanced. It is rather for us to be here dedicated to the great task remaining
before us -- that from these honored dead we take increased devotion to that
cause for which they gave the last full measure of devotion -- that we here
highly resolve that these dead shall not have died in vain -- that this
nation, under God, shall have a new birth of freedom -- and that government
of the people, by the people, for the people, shall not perish from the earth.
"""
```

We've already seen the `.split()` method will, by default, split by spaces. Try this to count the number of words:


```python
ga = gettysburg_address.split()
#ga
```

Now, the next problem is that some of these still have punctuation. In particular, we see ".", ",", and "--".
When considering a word, we can get rid of these by using the `replace()` method. Try this here:


```python
ga = gettysburg_address.replace(".", "").replace(",", "").replace("--", "").split()
```

Another problem is case—we want to count 'but' and 'But' as the same. Use the `lower()` method that can be used to covert this string:


```python
ga = gettysburg_address.lower().replace(".", "").replace(",", "").replace("--", "").split()
```

Create a dictionary that uses the unique words as keys and has as a value the number of times that word appears.
Write a loop over the words in the string (using our split version) and do the following:
- remove any punctuation
- convert to lowercase
- test if the word is already a key in the dictionary (using the in operator)
    * if the key exists, increment the word count for that key
    * otherwise, add it to the dictionary with the appropiate count of 1.
    
At the end, print out the words and a count of how many times they appear


```python
# Your code here
```

We can actually do this a lot more compactly by using another python datatype called a set. A set is a group of items, where each item is unique (e.g., no repetitions).


Using the `set()` function, turn the list of words into a set, removing any duplicates:


```python
ga_set = set(ga)
```

Now loop over the unique words and use the `count` method of a list to find how many there are:


```python
count = {}
for uw in ga_set:
    count[uw] = ga.count(uw)
    
# count
```

## Dictionary sorting 

The python `sorted` method can be used to lists, dictionaries, tuples etc. For example, if we sort a list of words:


```python
sorted(['hippo', 'aadvark', 'elephant', 'zebra', 'buffalo'])
```




    ['aadvark', 'buffalo', 'elephant', 'hippo', 'zebra']



If we try running sorted on a dictionary, then its default behavior is to sort the keys:


```python
fruit_dict = {'banana': 0.65, 'apple': 0.3, 'watermelon': 2.1, 'kiwi':0.5, 'grape':0.05}
sorted(fruit_dict)
```




    ['apple', 'banana', 'grape', 'kiwi', 'watermelon']



What if we want to sort this dictionary instead by the values? We can do this by passing in a function to `sorted` function which takes an item (a key, value tuple) as an argument and returns the value to be used in the comparison. So if we want to sort this list by value, we'd do:


```python
def compare(i):
    k, v = i
    return v

sorted(fruit_dict.items(), key=compare)
```




    [('grape', 0.05),
     ('apple', 0.3),
     ('kiwi', 0.5),
     ('banana', 0.65),
     ('watermelon', 2.1)]



Try this on the dictionary of words you created for the previous exercise to find the 5 most common words. 

Hint: you can reverse the sorting order so it goes from high to low by passing in the keyword argument `reverse=True` to the `sorted` function.


```python
# Your code here
```


```python

```
