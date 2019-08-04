---
layout: post
title:  Review
date:   2019-08-04
day: 2
next:
prev:
---


# Review

Yesterday we introduced to you the following basics:

1. **Data types** : `int`, `float`, `str`, `bool`
2. **Arithmetic Operators** : +, -, *, /, //, %, ***
3. **Logical Operators** : `and`, `or`, `not`
3. **Conditionals** : `if`, `elif`, `else`
4. **While loops**

## 1. Data Types


```python
# int
print(type(1))

# float
print(type(1.0))

# string
print(type("a"))

# boolean
print(type(True))

# complex
print(type(1 + 2j))
```

## 2. Arithmetics


```python
a = 21
b = 10

# Add
print(a + b)

# Subtract
print(a - b)

# Multiplication
print(a * b)

# Divide
print(a / b)

# Modulus
print(a % b)

# Floor division
print(a // b)

# Exponent
a = 2
b = 3
print(a ** b)
print(a ** (0.5))
```

## 3. Logical Operators


```python
True and False
```


```python
True or False
```


```python
not True
```


```python
1 == 2
```


```python
1 > 2
```


```python
2 < 1
```

#### And Operator

| Condition 1 | Condition 2 | Output |
|-------------|-------------|--------|
| True | True | True |
| True | False | False |
| False | True | False |
| False | False | False |

#### Or Operator

| Condition 1 | Condition 2 | Output |
|-------------|-------------|--------|
| True | True | True |
| True | False | True |
| False | True | True |
| False | False | False |

## 4. Conditionals

**Example 1:** If we want to identify if a given number is odd or even then the control flow is as follows:


```python
n = int(input())

if n % 2 == 0:
    print("n is even")
else:
    print("n is odd")
```

**Example 2:** Identify if a given number if positive, negative or 0


```python
n = float(input())

if n > 0:
    print("n is positive")
elif n < 0:
    print("n is negative")
else:
    print("n is 0")
```

## 5. While Loop

The syntax of a while loop is as follows:
```
while <condition> :

    statements
```

The while loop will run as long as the `<condition>` is satisfied, therefore it is a good practice to make sure the condition is not satisfied at some point in finite time. If the breaking condition is not met then the code will never end (at least in theory. In practice your computer will probably give up and crash!)

**Example :** Print the first 10 even numbers


```python
i = 1
while i <= 10:
    print(2 * i)
    i += 1
```
