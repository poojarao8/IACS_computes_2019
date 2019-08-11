---
layout: post
title:  Practice
date:   2019-08-08
day: 6
---


## Practice problems (on everything)

Disclaimer: problems `2`, `3` are taken from https://www.hackerrank.com/. Problem `4` is just slightly inspired by it. :)

#### Problem 1.

Here, we are given a list of programming languages used in different projects. There are repetitions, of course -- same language might have been used somewhere else! Our task is to analyze the list and print the following information:
* The most popular programming language (or languages, if more than one);
* The least popular programming language(s).

For example:
* Input: \[Java, Python, C, Lisp, Python, Java, Python, C, Java\]
* Statements printed:

`Python and Java are the most popular languages for those projects.`

`Lisp is the least popular one.`


```python

```


```python

```

#### Problem 2.

Julius Caesar protected his confidential information by encrypting it using a cipher. [Caesar's cipher](https://en.wikipedia.org/wiki/Caesar_cipher) shifts each letter by a number of letters. If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet. In the case of a rotation by *3*, `w`, `x`, `y` and `z` would map to `z`, `a`, `b` and `c`. 

* Original alphabet: `abcdefghijklmnopqrstuvwxyz`
* Rotated alphabet: `defghijklmnopqrstuvwxyzabc`

For example, given the rotation by *3*:

* Input: `python`
* Output: `sbwkrq`

Write a function that decyphers the encoded words. Start by creating a dictionary that gives a correspondence of original vs. encoded letters.


```python

```


```python

```


```python

```

#### Problem 3.

Here, our task is to count the number of words in the input string. Alice wrote a sequence of words in [CamelCase](https://en.wikipedia.org/wiki/Camel_case) as a string of letters that has the following properties:

* It is a concatenation of one or more words consisting of English letters.
* All letters in the first word are lowercase.
* For each of the subsequent words, the first letter is uppercase and rest of the letters are lowercase.

For example, `helloThere` and `helloBeautifulWorld` are camel case, but `HelloThere` or `hellothere` are not. Your task is to write a function to count the number of words in the camel case string.


```python

```

#### Problem 4.

This problem will have two parts. First, we will ask input from the user in order to fill the phonebook. Second, we will write a look-up function in order to retrieve the needed phone numbers.

##### Sub-problem 4.1
Create a dictionary and save phone numbers in it. Keep asking user for the input until they print `stop`.


```python

```

##### Sub-problem 4.2
Now that you have a dictionary, write a function that takes that dictionary and a name as input, and returns the corresponding phone number. Handle the case if the phone number is not found in the dictionary.


```python

```
