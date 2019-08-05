---
layout: post
title:  Functions
date:   2019-08-05
day: 4
---


# Practice

Write some code that deletes all consonants from the word *omnipotent*.


```python
vowels = ["a", "o", "i", "u", "e"]
word = "omnipotent"
new_string = ""

for l in word:
    if l in vowels:
        new_string += l
        
print(new_string)
```

    oioe


Now, write some code that deletes all vowels from the word *longitude*.


```python
word = "longitude"
new_string = ""
for l in word:
    if l not in vowels:
        new_string += l

print(new_string)
```

    lngtd


As you may have spotted, the above two blocks of code looked more than a little similar.

To avoid repeating blocks of similar code, we can create **functions**.

# Functions

Up until now, we've simply been writing code in cells of our notebooks and executing them. This is great if you want to perhaps change one thing and run a sequence of lines of code again with that one thing changed. But what if we want to run the same cell a many times? Or what if we want one cell to be able to run the code that's in another cell? Functions allow us to do these things and really help with the organization (and therefore readability) of our code.

We've been using several built-in functions up to now, such as `print`, `range`, `lower`, but now it's time for us to write our own functions!

Let's begin by writing a function that prints a string a given number of times. To define a function in Python, we use the keyword `def` (short for *define*). 


```python
def print_string(my_string, n):
    for i in range(n):
        print(my_string)
        
def another_print_string(my_string, n):
    print((my_string + "\n") * n)
```

**Questions:** What will be the difference in the behavior of these two functions? How would we make them both behave the same?

To run the function, we just call it with the necessary arguments.


```python
print_string("Hello world!", 4)
another_print_string("Hello!", 3)
```

    Hello world!
    Hello world!
    Hello world!
    Hello world!
    Hello!
    Hello!
    Hello!
    


*Note*: we can use variable names as the arguments of the functions.


```python
strings_to_use = ["Hello!", "How are you?"]

for string in strings_to_use:
    print_string(string, 3)
```

    Hello!
    Hello!
    Hello!
    How are you?
    How are you?
    How are you?


We can also define functions without any arguments. For example:


```python
def complain():
    print("I used to be an adventurer like you, then I took an arrow in the knee.")
    
def walk_around():
    print("I guess I will just go to the market...")

complain()
```

    I used to be an adventurer like you, then I took an arrow in the knee.


You can call your previously defined functions from within new functions:


```python
def dialogue(player_coming):
    if player_coming == True:
        complain()
    elif player_coming == False:
        walk_around()
        
dialogue(True)
```

    I used to be an adventurer like you, then I took an arrow in the knee.


Let's recall our ealier example. We used variables to solve it like this:


```python
from math import sqrt
```


```python
a = 2
b = 1
c = -1

x1 = (-b + sqrt(b**2 - 4 * a * c)) / (2 * a)
x2 = (-b - sqrt(b**2 - 4 * a * c)) / (2 * a)

print(x1, x2)
```

    0.5 -1.0


If we wish to change `a`, `b` and/or `c`, we could just change the variables and re-run the cell again. However, a better way would be to define a function to do this instead:


```python
def quadratic_solver(a, b, c):
    x1 = (-b + sqrt(b**2 - 4 * a * c)) / (2 * a)
    x2 = (-b - sqrt(b**2 - 4 * a * c)) / (2 * a)
    print(x1, x2)
    
quadratic_solver(2, 1, -1)
quadratic_solver(1, -3, 0)
```

    0.5 -1.0
    3.0 0.0


Here's another example of a function. This one takes a birth year, month, and day, and prints out the persons age:


```python
def age(birth_year, birth_month, birth_day):
    today = 16
    this_month = 8
    this_year = 2019
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        print(this_year - birth_year - 1)
    else:
        print(this_year - birth_year)
```


```python
age(2012, 1, 7)
```

    7


## Return statements

Until now we've had our cells and functions simply *print* output to the screen, but what if we want to do something else with this output (e.g. store it in a list)? It's not very useful to us if it's only printed to the screen. This is where *return statements* come in. With return statements, we can actually use the result of a function in another piece of code. Here's our age function written with a return statement:


```python
def new_age(birth_year, birth_month, birth_day):
    today = 16
    this_month = 8
    this_year = 2019
    if (birth_month > this_month) or ((birth_month == this_month) and (birth_day >= today)):
        return this_year - birth_year - 1
    else:
        return this_year - birth_year
```

Now let's try calling it.


```python
new_age(2012, 1, 7)
```




    7



Thanks to the way Jupyter notebooks work, calling `new_age` doesn't look all that different from when we called `age`. Although we didn't tell it to, Jupyter has handily printed out the value returned by the `new_age` function for us. However, we can start to see the advantage of return statements if we assign the output of the `new_age` function to a variable:


```python
blue_ivy = new_age(2012, 1, 7)
```

This time it didn't print out the result, as assigning something to a variable does not provide any output. If we try printing our new variable however, we can see that the number returned by our function is now stored in that variable:


```python
print(blue_ivy)
```

    7


Let's use our function to create a list:


```python
ages = []

ages.append(new_age(1999,9,9))
ages.append(new_age(2000,12,1))

# Now use those variables to do something
print("Jean is", ages[0],"years old.")
print("Jacob is", ages[1],"years old.")
```

    Jean is 19 years old.
    Jacob is 18 years old.


What will happen if we use the `age` function instead of `new_age`?

## Worked Example

Let's use our newly learned function writing skills to build a chatbot. This chatbot is not going to be all that smart (for now), but will return some 'opinions' based on the inputs it is given.


```python
def chatbot(name, animal, state):
    print("Hello, " + name + "!\n")
    
    print("Oh, I see you like " + animal+ "s...")
    if animal in ["cat", "dog"]:
        print("That choice is pretty usual.\n")
    elif animal in ["spider", "salamander"]:
        print("I didn't expect that!\n")
    else:
        print("How is it even possible?!\n")
        
    print("Wow, you're from " + state + ".")
    if state in ["Connecticut", "Massachusetts", "Rhode Island", "New Hampshire", "Maine", "Vermont",
                 "New York", "Michigan", "Wisconsin", "Iowa", "Minnesota", "South Dakota", "North Dakota",
                 "Montana", "Idaho", "Oregon", "Washington"]:
        print("Pretty cold there, right?")
    else:
        print("That's good.")
        
    return name + " from " + state + " likes " + animal + "s!"
```


```python
jimmy = chatbot("Jimmy", "cat", "Oregon")
```

    Hello, Jimmy!
    
    Oh, I see you like cats...
    That choice is pretty usual.
    
    Wow, you're from Oregon.
    Pretty cold there, right?



```python
print(jimmy)
```

    Jimmy from Oregon likes cats!


What happens if we put `return` before some other code in our function?


```python
def bad_chatbot(name, animal, state):
    
    return name + " from " + state + " likes " + animal + "s!"

    print("Hello, " + name + "!\n")
```


```python
bad_chatbot("Alena", "cat", "New York")
```




    'Alena from New York likes cats!'



The function exits and returns the result *as soon as* it hits the return statement, so it never gets to the last line in our function. 

**Question**: how can we have two `return` statements within the same function definition?


```python
def weird_thing(n):
    if n < 0:
        return "Hey"
    else:
        return "Hi"
    
weird_thing(-5)
```




    'Hey'



## Practice Problems

Write a function that takes an integer `n` and prints the first `n` natural numbers.


```python

```

    1
    2
    3


Write a function that takes a string and counts how many vowels (a,e,i,o,u) are there in the string. Return the result.


```python

```




    4



Now, remember the first thing we did today. Write a function that takes two arguments: `string` and `t`, and returns the version of the string without consonants if the value of `t` is `c`, and removes vowels if the value of the `t` is `v`. Otherwise it returns `False`.


```python

```




    'oou'



Write a function that takes 4 arguments: `name`, `year`, `month`, and `day`. It then greets the user and happliy tells them how old they are, before returning ther age.


```python

```

    Hi, Blue Ivy!
    Wow, you're 7 years old!





    7



Write a function that takes a list of strings and concatenates every string to the strings in front of it in the list. For example, the list ["cat", "dog", "fox","pig"] would return ["cat","catdog","catdogfox","catdogfoxpig"]


```python

```




    ['cat', 'catdog', 'catdogfox', 'catdogfoxpig']



Write a function that takes an integer and returns `True` if that number is prime, and `False` if it isn't. Recall that a positive integer greater than 1 is prime if it can only be divided by 1 and itself.


```python

```




    True



Write a function that takes an integer and returns a list of all the factors of the input number.


```python

```




    [1, 2, 11, 22]



## Advanced Problems

Create a function that analyzes a password. A good password must contain a lowercase letter, an uppercase letter, a number, and one of the following characters: `.`, `,`, `!`, `?`, `$`, `&`, `^`, `:`, `;`. Also, it must be not shorter than *9* characters.

Return `True` if the password is good, and `False` if it is not.

Test the following strings:
* password_is_strong
* myNumberis99:
* NuMbErSaReFuN
* l33Tn3rd!
    


```python

```

By the way, **this advice is wrong**: read [this article](https://www.usatoday.com/story/news/nation-now/2017/08/09/password-expert-says-he-wrong-numbers-capital-letters-and-symbols-useless/552013001/) from *USA today*. People still tend to choose very predictable sequences of numbers, words, and special symbols. A much more secure option is to choose a longer password made up of several random words, e.g. purple tortoise silence cobras -> `purpletortoisesilencecobras`.

Find all prime factors of an integer `n`.


```python

```




    [1, 7]




```python

```
