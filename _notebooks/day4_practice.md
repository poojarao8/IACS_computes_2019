---
layout: post
title:  Practice
date:   2019-08-05
day: 4
---


# Day 4 practice

## Longest word

Write a simple function that takes a sentence (as a string) and returns an integer equal to the length of the longest word in the sentence. The `len()` function and the `.split()` methods will be useful here.


```python
# Your code goes here
```

## Count the words

Let's practice functions. Here's a simple function that takes a string and returns a list of all the 4 letter words:


```python
def four_letter_words(message):
    words = message.split()
    four_letters = [w for w in words if len(w) == 4]
    return four_letters
```


```python
message = "The quick brown fox jumps over the lazy dog"
print(four_letter_words(message))
```

    ['over', 'lazy']


Write a version of this function that takes a second argument, `n`, that is the word length we want to search for


```python
# Your code here
```

## Primes

A prime number is divisible only by 1 and itself. We want to write a function that takes a positive integer, `n`, and finds all of the primes up to that number.

A simple (although not very fast) way to find the primes is to start at 1, and build a list of primes by checking if the current number is divisible by any of the previously found primes. If it is not divisible by any earlier primes, then it is a prime.

The modulus operator, %, could be helpful here.


```python
# Your code here
```


```python

```
