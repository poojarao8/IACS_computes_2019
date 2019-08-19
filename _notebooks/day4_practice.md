---
layout: post
title:  Practice
date:   2019-08-19
day: 4
---


# Day 4 practice

## Longest word

Write a simple function that takes a sentence (as a string) and returns an integer equal to the length of the longest word in the sentence. The `len()` function and the `.split()` methods will be useful here.


```python
def longest_word(sentence):
    # define a variable to hold the length of the longest word
    # found so far
    longest_length = -1
    
    # iterate over elements of list of words
    for word in sentence.split():
        # if length of this word is longer than any found so far,
        # update the variable
        if len(word) > longest_length:
            longest_length = len(word)
            
    return longest_length
```


```python
text = "Golpalott's Third law states that the antidote for a blended poison will be equal to more than the sum of the antidotes for each of the separate components"

longest_word(text)
```




    11



## Count the words

Let's practice functions. Here's a simple function that takes a string and returns a list of all the 4 letter words:


```python
def four_letter_words(message):
    words = message.split()
    four_letters = []
    for w in words:
        if len(w) == 4:
            four_letters.append(w)
    return four_letters
```


```python
message = "The quick brown fox jumps over the lazy dog"
print(four_letter_words(message))
```

    ['over', 'lazy']


Write a version of this function that takes a second argument, `n`, that is the word length we want to search for


```python
def num_letter_words(message, n):
    words = message.split()
    num_letters = []
    for w in words:
        if len(w) == n:
            num_letters.append(w)
    return num_letters
```


```python
num_letter_words(message, 3)
```




    ['The', 'fox', 'the', 'dog']



*Bonus*: what if we wanted to just return the *unique* n-letter words? In the above example, we can see that we have both 'The' and 'the'. How can we modify our function so that it doesn't repeat words like this? 

To do this, we can use the data structure `set`. This is very similar to a list of a tuple, however it does not contain any repetitions.


```python
# create a list
my_list = [4,7,1,4,6,1,4,7]
print(my_list)
print(len(my_list))
```

    [4, 7, 1, 4, 6, 1, 4, 7]
    8



```python
# cast this list as a set
my_set = set(my_list)
print(my_set)
print(len(my_set))
```

    {1, 4, 6, 7}
    4


We can see that the set has removed all repeated entries in our list. 

An important difference between sets and list/tuples is that lists are *unordered*. So while when we printed the set out above it printed the entries in ascending order, if we ran this on a different system (or using a different version of python), this may not happen. This also means we cannot access individual elements of a set:


```python
my_set[0]
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-16-158c424478a1> in <module>
    ----> 1 my_set[0]
    

    TypeError: 'set' object does not support indexing


Just like with lists, we can see if a set contains an element using the keyword `in`:


```python
4 in my_set
```




    True



We can add elements to sets using the function `add`:


```python
my_set.add(9)
my_set
```




    {1, 4, 6, 7, 9}



So how does this help for this question? Instead of adding the words to a list, we can add them to a set. The set will automatically prevent any duplications of words that already exist.


```python
def num_letter_words(message, n):
    words = message.lower().split()
    num_letters = set() # create an empty set
    for w in words:
        if len(w) == n:
            num_letters.add(w)
    return num_letters
```


```python
num_letter_words(message, 3)
```




    {'dog', 'fox', 'the'}




```python

```
