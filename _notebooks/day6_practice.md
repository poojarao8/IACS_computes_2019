---
layout: post
title:  Practice
date:   2019-08-04
day: 6
next:
prev:
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
lang = ["Java", "Python", "C", "Lisp", "Python", "Java", "Python", "C", "Java"]

d = {}
for l in lang:
    if l not in d:
        d[l] = 1
    else:
        d[l] += 1
        
mp = [i for i in d if d[i] == max(d.values())]
lp = [i for i in d if d[i] == min(d.values())]

if len(mp) > 1:
    print(" and ".join(mp), "are the most popular.")
else:
    print(mp[0], "is the most popular.")
    
if len(lp) > 1:
    print(" and ".join(lp), "are the least popular.")
else:
    print(lp[0], "is the least popular.")
```


```python
a = ["a", "b"]
print(" and ".join(a))
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
orig = "abcdefghijklmnopqrstuvwxyz"
rot = "defghijklmnopqrstuvwxyzabc"

d = {}
for i in range(len(orig)):
    d[rot[i]] = orig[i]

def caesar(code):
    word = ""
    for i in code:
        word += d[i]
    return word

caesar("sbwkrq")
```


```python
alphabet = "abcdefghijklmnopqrstuvwxyz"
org_text = "sbwkrq"
changed = {}

def caesarCipher(cypher, rotation):
    stringFinal = ""
    for i in cypher:
        if i not in list(changed.keys()):
            changed[i] = alphabet[alphabet.index(i) - rotation]
        stringFinal += changed[i]
    print("Cypher: " + cypher)
    print("Decoded: " + stringFinal)
    
caesarCipher(org_text, 3)
```


```python
orig = "abcdefghijklmnopqrstuvwxyz"
rot = "defghijklmnopqrstuvwxyzabc"

a = ''
b = "sbwkrq"

for letter in b:
    a += orig[rot.index(letter)]
    
print(a)
```

#### Problem 3.

Here, our task is to count the number of words in the input string. Alice wrote a sequence of words in [CamelCase](https://en.wikipedia.org/wiki/Camel_case) as a string of letters that has the following properties:

* It is a concatenation of one or more words consisting of English letters.
* All letters in the first word are lowercase.
* For each of the subsequent words, the first letter is uppercase and rest of the letters are lowercase.

For example, `helloThere` and `helloBeautifulWorld` are camel case, but `HelloThere` or `hellothere` are not. Your task is to write a function to count the number of words in the camel case string.


```python
def camel(s):
    if s[0].isupper():
        print("Not a camel case!")
        return None
    count = 0
    for i in s:
        if i.isupper():
            count+=1
    return count+1

# s = "helloThereHey"
# print(sum([1 for i in s if i.isupper()])+1)


camel("HelloThere")
```

#### Problem 4.

This problem will have two parts. First, we will ask input from the user in order to fill the phonebook. Second, we will write a look-up function in order to retrieve the needed phone numbers.

##### Sub-problem 4.1
Create a dictionary and save phone numbers in it. Keep asking user for the input until they print `stop`.


```python
phonebook = {}
repeat = True

while repeat:
    
    # we create a phonebook entry
    name = input("Name: ")
    number = input("Number: ")
    phonebook[name] = number
    
    # here we ask user continue or not
    decision = input("Stop or no? ")
    if decision == "stop":
        repeat = False

print(phonebook)
```

##### Sub-problem 4.2
Now that you have a dictionary, write a function that takes that dictionary and a name as input, and returns the corresponding phone number. Handle the case if the phone number is not found in the dictionary.


```python
def lookup(d, name):
    if name in d:
        print("The number of", name, "is", d[name])
        return d[name]
    print("I don't know", name, ":(")
    return None
    
lookup(phonebook, "Jimmy")
```

### Extras: turtles

Draw sunglasses in turtles. Any shape, color, or configuration as you want!

In order to instantiate the `window` and the turtle `bob`, run the following cell.


```python
import turtle
window = turtle.Screen()
bob = turtle.Turtle()
```

Now, draw sunglasses.


```python
# your code could have been here
```

When you're done, don't forget to close the window.


```python
window.bye()
```

If you don't want to start from scratch, you can take the code that I prepared. :)


```python
import turtle
window = turtle.Screen()
ted = turtle.Turtle()

# clean up just in case
ted.home()
ted.clear()

ted.pensize(3)
ted.pencolor('black')
ted.fillcolor((0.6, 0.8, 0.9))

ted.begin_fill()
ted.circle(25)
ted.end_fill()

ted.penup()
ted.goto((70,0))
ted.pendown()
ted.begin_fill()
ted.circle(25)
ted.end_fill()

ted.penup()
ted.goto((25,25))
ted.pendown()
ted.goto((45,25))

ted.penup()
ted.goto((-25,25))
ted.pendown()
ted.left(50)
ted.forward(75)
ted.right(50)
ted.forward(20)

ted.penup()
ted.goto((95,25))
ted.pendown()
ted.left(50)
ted.forward(75)
ted.right(50)
ted.forward(20)

ted.hideturtle()
```

Again, after we're done, we should close the window.


```python
window.bye()
```
