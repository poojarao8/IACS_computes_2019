---
layout: post
title:  Dictionaries
date:   2019-08-04
day: 5
next:
prev:
---


# Dictionaries

What is a *dictionary*? In computer science, a dictionary is a type of data structure (like a list or tuple) that allows you to access elements using a *key* (e.g. instead of accessing them by their index). 

In Python, dictionaries are defined using curly braces `{ }`. (Remember we defined lists with square brackets `[ ]` and tuples with parenthesis `( )`).

We can define a dictionary as follows:


```python
oxford_dict = {'person' : 'a human being',
               'marathon' : 'a running race that is about 26 miles',
               'resist' : 'to remain strong against the force',
               'run' : 'to move with haste; act quickly'}
```

Like a list, a dictionary is a collection of many values. But unlike indices for lists, dictionary keys can take the form of many different data types, not just integers. Each dictionary key is associated with a particular *value* in the dictionary, and together they make up a *key-value pair*.

The dictionary above, `oxford_dict`, used strings as keys, but dictionary keys can be any **immutable** data type. You may remember from before that tuples and strings are both instances of immutable data types, which means that they  can't be changed after they have been created. _Mutable_ data types are the opposite - you can modify them whenever you want to. 

You may be surprised to hear that numbers (integers, floats...) are also classed as immutable data types. Why is that?? If we assign some number to a variable, then try to change that number, we are not in fact changing the original number - we are effectively replacing it with a new number. The original number has not been changed, but overwritten. This is pretty subtle stuff, and at this point we don't really need to understand *why* numbers are classed as immutable. The important bit is that they are and therefore we can use them as keys in dictionaries!

### Back to dictionaries

Dictionary values can be just about anything (integers, lists, functions, strings, etc.).

For example, the dictionary below, `switch_dict`, has integerss as keys and strings as values:


```python
# Define a dictionary
switch_dict = {1 : 'off',
               0 : 'on'}
```


```python
switch_dict[0]
```




    'on'



On the other hand, `age_dict` has strings as keys and integers as values:


```python
age_dict = {'John' : 22, 
            'Bob' : 47,
            'Susan' : 63,
            'Timmy' : 15}
```

What about lists? Can I use a list as a key?


```python
bootleg_dict = {2.0 : 'floats can be keys',
                1 : 'ints can be keys',
                'run' : 'strings can be keys',
                ['a', 'list']: 'but can lists be keys?'}

print(bootleg_dict)
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-7-9fe13a886d13> in <module>
          2                 1 : 'ints can be keys',
          3                 'run' : 'strings can be keys',
    ----> 4                 ['a', 'list']: 'but can lists be keys?'}
          5 
          6 print(bootleg_dict)


    TypeError: unhashable type: 'list'


Nope! Lists are mutable. However, we could use a tuple instead, as they are immutable (I promised you we'd find a use for them)!


```python
bootleg_dict = {2.0 : 'floats can be keys',
                1 : 'ints can be keys',
                'run' : 'strings can be keys',
                ('a', 'tuple') : 'tuples can be keys'}

print(bootleg_dict)
```

    {2.0: 'floats can be keys', 1: 'ints can be keys', 'run': 'strings can be keys', ('a', 'tuple'): 'tuples can be keys'}



```python
# One more example using attributes
myCat = {'size': 'huge', 'color': 'gray', 'disposition': 'loud'}
print('My cat is so ' + myCat['disposition'] + "!")
```

    My cat is so loud!


## Dictionaries vs. Lists

Unlike lists, items in dictionaries are unordered. The first item in a list named `spam` would be `spam[0]`. But there is no “first” item in a dictionary. While the order of items matters for determining whether two lists are the same, it does not matter in what order the key-value pairs are typed in a dictionary. Try running this cell:


```python
spam = ['cats', 'dogs', 'moose']
bacon = ['dogs', 'moose', 'cats']

eggs = {'name': 'Mr. Bigglesworth', 'species': 'cat', 'age': '8'}
ham = {'species': 'cat', 'age': '8', 'name': 'Mr. Bigglesworth'}

```

Because dictionaries are not ordered, they also can’t be sliced like lists.

Trying to access a key that does not exist in a dictionary will result in a `KeyError` error message, much like a list’s “out-of-range” `IndexError` error message. Run the next cell, and notice the error message that shows up because there is no `'color'` key:


```python
eggs['color']
```

Actually, the ability to have arbitrary values for the keys allows you to organize your data in powerful ways. 

Say you wanted your program to store data about your friends’ birthdays. You can use a dictionary with the names as keys and the birthdays as values:


```python
birthdays = {'Alice': 'Apr 1', 'Bob': 'Dec 12', 'Carol': 'Mar 4'}

while True:
    print('Enter a name: (blank to quit)')
    name = input()
    if name == '':
        break

    if name in birthdays:
        print(birthdays[name] + ' is the birthday of ' + name)
    else:
        print('I do not have birthday information for ' + name)
        print('What is their birthday?')
        bday = input()
        birthdays[name] = bday
        print('Birthday database updated.')
```

## Practice tiiiime!
Given this dictionary, try to do the following:
- Add a key to inventory called `pocket`.
- Set the value of `pocket` to be a list consisting of the strings `seashell`, `strange berry`, and `lint`.
- Sort the items in the list stored under the `backpack` key. (Hint: you can sort a list `a` using the function `a.sort()`)
- Remove `dagger` from the list of items stored under the `backpack` key. 
- Give yourself 50 `gold` from the sale of this `dagger`. 


```python
inventory = {
    'gold' : 500,
    'pouch' : ['flint', 'twine', 'gemstone'],
    'backpack' : ['xylophone','dagger', 'bedroll','bread loaf']
}
```


```python

```

## Fixing Fibonacci

When we learnt about recursion on Friday, we saw how to compute Fibonacci numbers *recursively*.

This can be a a very efficient way of calculating one-off Fibonacci numbers (especially in non-Python, functional languages), however it becomes very costly if we are calculating many numbers in the Fibonacci series.

### Memoization

Think of what it means to write a memo. Usually this is done in businesses, where someone will write a memo to get information across to others in the same organization. If you write a memo to yourself, you're writing a reminder to yourself so that you don't have to keep thinking about it, and can refer back to it when needed. 

In Python, we can write a memo within our code so that it doesn't have to recalculate operations, but rather store them in memory. We can do this using dictionaries! This is a wonderful solution to our recursion problem, as we can store the values of the nth Fibonacci number. Rather than having to reculate all the Fibonacci numbers $< n$ every time we want to calculate the $n$th Fibonacci number, we will instead first check to see if we've already calculated the number and return that. 


```python
# Before memoization
def fib(n):
    if n <= 2:
        return 1
    else:
        return fib(n-1) + fib(n-2)
    
for n in range(1,101):
    print(n, ":", fib(n))
```


```python
# Create a list to store Fibonacci numbers
fib_list = {}

def fib(n):
    # if we find nth number in our list keys, we return the value stored for that n
    if n in fib_list:
        return fib_list[n]
    
    if n <= 2:
        value = 1
    else:
        value = fib(n-1) + fib(n-2)
    
    # finally we return the value of the nth Fibonacci number we looked for 
    fib_list[n] = value
    return value

for n in range(1,101):
    fib(n)
```

## What _else_ can we do with dictionaries?


```python
age_dict = {'John' : 22, 
          'Bob' : 47,
          'Susan' : 63,
          'Timmy' : 15}
```


```python
len(age_dict)
```


```python
print(age_dict)
age_dict['Timmy'] = 14
print(ageDict)
```

There are three dictionary methods that will return list-like values of the dictionary's keys, values, or both keys and values: `keys()`, `values()`, and `items()`. 

The values returned by these methods are not true lists: they cannot be modified and do not have an append() method. But these data types (`dict_keys`, `dict_values`, and `dict_items`, respectively) can be used in for loops. 

To begin seeing how these methods work, run the next cell.

Here, a `for` loop iterates over each of the **values** in the `cheese` dictionary:


```python
cheese = {'color': 'yellow', 'age': 42}

for v in cheese.values():
    print(v)
```

A `for` loop can also iterate over the **keys**...:


```python
for k in cheese.keys():
        print(k)
```

OR **both** keys **and** values:


```python
for k in cheese.items():
        print(k)
```

If you want one of these methods to return a list, then it's necessary to use the `list()` function to cast it was a list. For example:


```python
print(cheese.keys())

print(list(cheese.keys()))
```

You can also use the multiple assignment trick in a `for` loop to assign the key and value to separate variables, like so:


```python
for k, v in cheese.items():
        print('Key: ' + k + ' Value: ' + str(v))
```

Remember how the `in` and `not in` operators can check whether a value exists in a list? So far, we have used these when looking at strings, however you can also use them to see whether a certain key or value exists in a dictionary:


```python
cat = {'name': 'Mr.Bigglesworth', 'age': 8}
print('name' in cat.keys())
print('Mr.Bigglesworth' in cat.values())
print('color' in cat.keys())
print('color' not in cat.keys())
print('color' in cat)
```

Notice that `'color' in cat` is essentially equivalent to `'color' in cat.keys()`. This is always the case: if you ever want to check whether a value is (or isn’t) a key in the dictionary, you can simply use the `in` (or `not in`) keyword with the dictionary value itself.

#### get()

It's tedious to check whether a key exists in a dictionary before accessing that key's value. Fortunately, dictionaries have a `get()` method that takes two arguments: the key of the value to retrieve, and a fallback value to return if that key does not exist.


```python
picnic_items = {'apples': 1, 
               'cups': 2,
               'bread' : 7}
print('I am bringing ' + str(picnic_items.get('cups', 0)) + ' cups.')
print('I am bringing ' + str(picnic_items.get('eggs', 0)) + ' eggs.')
```

    I am bringing 2 cups.
    I am bringing 0 eggs.


Because there is no `'eggs'` key in the `picnic_items` dictionary, the default value 0 is returned by the `get()` method. What happens if I don't want to use `get()`?


```python
print('I am bringing ' + str(picnic_items['eggs']) + ' eggs.')
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-3-48aeb831060d> in <module>
    ----> 1 print('I am bringing ' + str(picnic_items['eggs']) + ' eggs.')
    

    KeyError: 'eggs'


### Pretty printing

If you import the `pprint` module into your programs, you’ll have access to the `pprint()` and `pformat()` functions that will 'pretty print' a dictionary’s values. This is helpful when you want a cleaner display of the items in a dictionary than what `print()` provides.


```python
import pprint
pprint.pprint(inventory)
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-4-d11e485ecd85> in <module>
          1 import pprint
    ----> 2 pprint.pprint(inventory)
    

    NameError: name 'inventory' is not defined



```python
import pprint
pp = pprint.PrettyPrinter(indent=0,width=20)
pp.pprint(picnic_items)
```

    {'apples': 1,
    'bread': 7,
    'cups': 2}


# Practice Problems

### Exercise 1

There are 36 possible combinations of two dice. A simple pair of loops over each die's number of sides will enumerate all combinations. The sum of the two dice is more interesting than the actual combination. Create a dict of all combinations, using the sum of the two dice as the key.

Each value in the dict should be a list of tuples; each tuple has the value of two dice. The general outline is something like the following:
d = {}
Loop with d1 from 1 to 6
    Loop with d2 from 1 to 6
        newTuple ← ( d1, d2 ) # create the tuple
        oldList ← dictionary entry for sum d1+d2
        newList ← oldList + newTuple
        replace entry in dictionary with newList

Loop over all values in the dictionary
    print the key and the length of the list

```python
# your code here
```

### Exercise 2

You work at a frozen yogurt shop, and your boss is making you grab some bananas, oranges, and apples. Make a grocery list. Then, using the following information from the supermarket, define a function called `compute_bill` that takes `food` as an input.
stock = {
    "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}

prices = {
    "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}
For each item in your grocery list, add that item's price to your bill total. At the end, return the total. Your function should be able to work for any grocery list that contains the items in the store.

After you have this working, modify your function to only add the price of the item to your total if the item is in stock. Then, subtract one of the items from the store's stock.


```python
# your code here
```

### Exercise 3

Let `num_ways(n)` be the number of ways to write a nonnegative integer `n` as the sum of positive integers.  For example, there are 8 ways of writing 4:  
- 1 + 1 + 1 + 1
- 2 + 1 + 1
- 1 + 2 + 1
- 1 + 1 + 2
- 2 + 2
- 1 + 3
- 3 + 1
- 4

One can show by induction that `num_ways(n)` = $2^{n−1}$, but let’s see how to calculate it using recursion and memoization. Below is a recursive implementation without memoization:


```python
def num_ways(n):
    if n == 0:
        return 1
    ans = 0
    for i in range(1, n+1):
        ans += num_ways(n-i)
    return ans
```

Try to implement this using memoization:


```python
d = {0:1}

def nw(n):
    if n in d:
        return d[n]
    else:
        val = nw(n-1) + 1
```

### Exercise 4

Compute the number of times each word occurs. 

For the text below,

a) Clean punctuation and transform all words to lower case.

b) Output a list of word count pairs sorted from highest to lowest count.


```python
beemoviescript = """
According to all known laws of aviation, there is no way a bee should be able to fly. Its wings are too small to get its fat little body off the ground. The bee, of course, flies anyway because bees don't care what humans think is impossible. Yellow, black. Yellow, black. Yellow, black. Yellow, black. Ooh, black and yellow! Let's shake it up a little. Barry! Breakfast is ready! Ooming! Hang on a second. Hello? - Barry? - Adam? - Oan you believe this is happening? - I can't. I'll pick you up. Looking sharp. Use the stairs. Your father paid good money for those. Sorry. I'm excited. Here's the graduate. We're very proud of you, son. A perfect report card, all B's. Very proud. Ma! I got a thing going here. - You got lint on your fuzz. - Ow! That's me! - Wave to us! We'll be in row 118,000. - Bye! Barry, I told you, stop flying in the house! - Hey, Adam. - Hey, Barry. - Is that fuzz gel? - A little. Special day, graduation. Never thought I'd make it. Three days grade school, three days high school. Those were awkward. Three days college. I'm glad I took a day and hitchhiked around the hive. You did come back different. - Hi, Barry. - Artie, growing a mustache? Looks good. - Hear about Frankie? - Yeah. - You going to the funeral? - No, I'm not going. Everybody knows, sting someone, you die. Don't waste it on a squirrel. Such a hothead. I guess he could have just gotten out of the way. I love this incorporating an amusement park into our day. That's why we don't need vacations. Boy, quite a bit of pomp... under the circumstances. - Well, Adam, today we are men. - We are! - Bee-men. - Amen! Hallelujah! Students, faculty, distinguished bees, please welcome Dean Buzzwell. Welcome, New Hive Oity graduating class of... ...9:15. That concludes our ceremonies. And begins your career at Honex Industries! Will we pick ourjob today? I heard it's just orientation. Heads up! Here we go. Keep your hands and antennas inside the tram at all times. - Wonder what it'll be like? - A little scary. Welcome to Honex, a division of Honesco and a part of the Hexagon Group. This is it! Wow. Wow. We know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life. Honey begins when our valiant Pollen Jocks bring the nectar to the hive. Our top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey! - That girl was hot. - She's my cousin! - She is? - Yes, we're all cousins. - Right. You're right. - At Honex, we constantly strive to improve every aspect of bee existence. These bees are stress-testing a new helmet technology. - What do you think he makes? - Not enough. Here we have our latest advancement, the Krelman. - What does that do? - Oatches that little strand of honey that hangs after you pour it. Saves us millions. Oan anyone work on the Krelman? Of course. Most bee jobs are small ones. But bees know that every small job, if it's done well, means a lot. But choose carefully because you'll stay in the job you pick for the rest of your life. The same job the rest of your life? I didn't know that. What's the difference? You'll be happy to know that bees, as a species, haven't had one day off in 27 million years. So you'll just work us to death? We'll sure try. Wow! That blew my mind! "What's the difference?" How can you say that? One job forever? That's an insane choice to have to make. I'm relieved. Now we only have to make one decision in life. But, Adam, how could they never have told us that? Why would you question anything? We're bees. We're the most perfectly functioning society on Earth. You ever think maybe things work a little too well here? Like what? Give me one example. I don't know. But you know what I'm talking about. Please clear the gate. Royal Nectar Force on approach. Wait a second. Check it out. - Hey, those are Pollen Jocks! - Wow. I've never seen them this close. They know what it's like outside the hive. Yeah, but some don't come back. - Hey, Jocks! - Hi, Jocks! You guys did great! You're monsters! You're sky freaks! I love it! I love it! - I wonder where they were. - I don't know. Their day's not planned. Outside the hive, flying who knows where, doing who knows what. You can't just decide to be a Pollen Jock. You have to be bred for that. Right. Look. That's more pollen than you and I will see in a lifetime. """
```


```python
# your code
```
