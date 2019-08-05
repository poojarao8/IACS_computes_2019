---
layout: post
title:  Arithmetic
date:   2019-08-05
day: 1
---


# Arithmetic 

This is the first actual programming lesson. We highly encourage you to create a new Python notebook and follow along. You can refer to the Anaconda Installation guide if you need to recall how to create a new notebook.

Python can do basic arithmetic. (Make sure you are in code mode for the next box, and hit `shift`+`enter` to run the cell).


```python
6 + 4
```




    10



Notice we have two lines now: the input line and the output line. Also note the above command was the first one I entered, and has a [1] in both the input and output lines. If I entered it again, it would change to two.


```python
6 + 4;
```

We can suppress (get rid of) output with a semicolon. This is useful sometimes when we don't care about the result of a line of code.

Python can do everything your calculator can do. Basic arithmetic examples are here.


```python
5 + 9
```




    14




```python
14 - 9
```




    5




```python
24 / 3
```




    8.0




```python
1999 * 109294
```




    218478706




```python
10**2
```




    100



The exponential (power) operator isn't the caret (hat) symbol ^, but two asterisks \*\*. In the example above, we put spaces between the numbers and the operators. This isn't necessary, but it's a common programming practice (which we strongly encourage!) to make the code more readable.

Finally, there are two more operators you should be aware of: floor division, and modulus. Remember when you learned how to divide whole numbers in elementary school? If the number didn't divide evenly, you had a remainder at the end. For example, 7 divided by 3 was 2 with remainder 1. Here, 2 is called the quotient, and 1 is the remainder. In Python we use the floor division operator (//) and modulus operator (%) to calculate these.


```python
7 // 3
```




    2




```python
7 % 3 
```




    1



### PEMDAS

Remember PEMDAS? You may have learned the mnemonic "Please excuse my dear aunt sally." As a reminder, PEMDAS stands for "Parentheses, Exponents, Multiplication/Division, Addition/Subtraction." This is the order in which operations will be carried out when they are present in the same expression. Some examples follow.


```python
10 + 3 * 3 - 6 / 2
```




    16.0




```python
10 + (3 ** 2) ** 3 / 9 - 6
```




    85.0




```python
1 ** 2 * 3 - 4 + 5
```




    4



Fun fact: in the UK we call this *BODMAS*, standing for 'Brackets, Order, Division, Multiplication, Addition and Subtraction', as parentheses are called brackets in British English!


```python

```
