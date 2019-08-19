---
layout: post
title:  Practice
date:   2019-08-19
day: 5
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
len(gettysburg_address.split())
```




    278



Now, the next problem is that some of these still have punctuation. In particular, we see ".", ",", and "--".
When considering a word, we can get rid of these by using the `replace()` method. Try this here:


```python
punctuation = [".", ",", "--"]
for p in punctuation:
    gettysburg_address = gettysburg_address.replace(p, "")
```

Another problem is case—we want to count 'but' and 'But' as the same. Use the `lower()` method that can be used to covert this string:


```python
gettysburg_address = gettysburg_address.lower()
```


```python
gettysburg_address
```




    '\nfour score and seven years ago our fathers brought forth on this continent \na new nation conceived in liberty and dedicated to the proposition that \nall men are created equal\n\nnow we are engaged in a great civil war testing whether that nation or \nany nation so conceived and so dedicated can long endure we are met on\na great battle-field of that war we have come to dedicate a portion of\nthat field as a final resting place for those who here gave their lives\nthat that nation might live it is altogether fitting and proper that we\nshould do this\n\nbut in a larger sense we can not dedicate  we can not consecrate  we\ncan not hallow  this ground the brave men living and dead who struggled\nhere have consecrated it far above our poor power to add or detract  the\nworld will little note nor long remember what we say here but it can never\nforget what they did here it is for us the living rather to be dedicated\nhere to the unfinished work which they who fought here have thus far so nobly\nadvanced it is rather for us to be here dedicated to the great task remaining\nbefore us  that from these honored dead we take increased devotion to that\ncause for which they gave the last full measure of devotion  that we here\nhighly resolve that these dead shall not have died in vain  that this\nnation under god shall have a new birth of freedom  and that government\nof the people by the people for the people shall not perish from the earth\n'



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
words_dict = {}

for word in gettysburg_address.split():
    if word in words_dict:
        words_dict[word] += 1
    else:
        words_dict[word] = 1
        
print(words_dict)
```

    {'four': 1, 'score': 1, 'and': 6, 'seven': 1, 'years': 1, 'ago': 1, 'our': 2, 'fathers': 1, 'brought': 1, 'forth': 1, 'on': 2, 'this': 4, 'continent': 1, 'a': 7, 'new': 2, 'nation': 5, 'conceived': 2, 'in': 4, 'liberty': 1, 'dedicated': 4, 'to': 8, 'the': 11, 'proposition': 1, 'that': 13, 'all': 1, 'men': 2, 'are': 3, 'created': 1, 'equal': 1, 'now': 1, 'we': 10, 'engaged': 1, 'great': 3, 'civil': 1, 'war': 2, 'testing': 1, 'whether': 1, 'or': 2, 'any': 1, 'so': 3, 'can': 5, 'long': 2, 'endure': 1, 'met': 1, 'battle-field': 1, 'of': 5, 'have': 5, 'come': 1, 'dedicate': 2, 'portion': 1, 'field': 1, 'as': 1, 'final': 1, 'resting': 1, 'place': 1, 'for': 5, 'those': 1, 'who': 3, 'here': 8, 'gave': 2, 'their': 1, 'lives': 1, 'might': 1, 'live': 1, 'it': 5, 'is': 3, 'altogether': 1, 'fitting': 1, 'proper': 1, 'should': 1, 'do': 1, 'but': 2, 'larger': 1, 'sense': 1, 'not': 5, 'consecrate': 1, 'hallow': 1, 'ground': 1, 'brave': 1, 'living': 2, 'dead': 3, 'struggled': 1, 'consecrated': 1, 'far': 2, 'above': 1, 'poor': 1, 'power': 1, 'add': 1, 'detract': 1, 'world': 1, 'will': 1, 'little': 1, 'note': 1, 'nor': 1, 'remember': 1, 'what': 2, 'say': 1, 'never': 1, 'forget': 1, 'they': 3, 'did': 1, 'us': 3, 'rather': 2, 'be': 2, 'unfinished': 1, 'work': 1, 'which': 2, 'fought': 1, 'thus': 1, 'nobly': 1, 'advanced': 1, 'task': 1, 'remaining': 1, 'before': 1, 'from': 2, 'these': 2, 'honored': 1, 'take': 1, 'increased': 1, 'devotion': 2, 'cause': 1, 'last': 1, 'full': 1, 'measure': 1, 'highly': 1, 'resolve': 1, 'shall': 3, 'died': 1, 'vain': 1, 'under': 1, 'god': 1, 'birth': 1, 'freedom': 1, 'government': 1, 'people': 3, 'by': 1, 'perish': 1, 'earth': 1}


We can actually do this a lot more compactly by using another python datatype called a set. A set is a group of items, where each item is unique (e.g., no repetitions).


Using the `set()` function, turn the list of words into a set, removing any duplicates:


```python
set(gettysburg_address.split())
```




    {'a',
     'above',
     'add',
     'advanced',
     'ago',
     'all',
     'altogether',
     'and',
     'any',
     'are',
     'as',
     'battle-field',
     'be',
     'before',
     'birth',
     'brave',
     'brought',
     'but',
     'by',
     'can',
     'cause',
     'civil',
     'come',
     'conceived',
     'consecrate',
     'consecrated',
     'continent',
     'created',
     'dead',
     'dedicate',
     'dedicated',
     'detract',
     'devotion',
     'did',
     'died',
     'do',
     'earth',
     'endure',
     'engaged',
     'equal',
     'far',
     'fathers',
     'field',
     'final',
     'fitting',
     'for',
     'forget',
     'forth',
     'fought',
     'four',
     'freedom',
     'from',
     'full',
     'gave',
     'god',
     'government',
     'great',
     'ground',
     'hallow',
     'have',
     'here',
     'highly',
     'honored',
     'in',
     'increased',
     'is',
     'it',
     'larger',
     'last',
     'liberty',
     'little',
     'live',
     'lives',
     'living',
     'long',
     'measure',
     'men',
     'met',
     'might',
     'nation',
     'never',
     'new',
     'nobly',
     'nor',
     'not',
     'note',
     'now',
     'of',
     'on',
     'or',
     'our',
     'people',
     'perish',
     'place',
     'poor',
     'portion',
     'power',
     'proper',
     'proposition',
     'rather',
     'remaining',
     'remember',
     'resolve',
     'resting',
     'say',
     'score',
     'sense',
     'seven',
     'shall',
     'should',
     'so',
     'struggled',
     'take',
     'task',
     'testing',
     'that',
     'the',
     'their',
     'these',
     'they',
     'this',
     'those',
     'thus',
     'to',
     'under',
     'unfinished',
     'us',
     'vain',
     'war',
     'we',
     'what',
     'whether',
     'which',
     'who',
     'will',
     'work',
     'world',
     'years'}



Now loop over the unique words and use the `count` method of a list to find how many there are:


```python
for word in set(gettysburg_address.split()):
    num = gettysburg_address.count(word)
    
    print(f"{word}, {num}")
```

    engaged, 1
    hallow, 1
    endure, 1
    full, 1
    proper, 1
    task, 1
    detract, 1
    sense, 1
    from, 2
    devotion, 2
    remember, 1
    nation, 5
    forth, 1
    never, 1
    civil, 1
    that, 13
    proposition, 1
    for, 8
    equal, 1
    who, 3
    honored, 1
    dedicated, 4
    struggled, 1
    field, 2
    now, 1
    these, 2
    fathers, 1
    unfinished, 1
    final, 1
    freedom, 1
    will, 1
    earth, 1
    work, 1
    the, 22
    liberty, 1
    have, 5
    died, 1
    gave, 2
    our, 3
    a, 102
    years, 1
    under, 1
    before, 1
    four, 1
    not, 6
    living, 2
    little, 1
    place, 1
    score, 1
    we, 11
    testing, 1
    portion, 1
    brave, 1
    brought, 1
    highly, 1
    did, 1
    which, 2
    power, 1
    great, 3
    larger, 1
    live, 2
    world, 1
    resolve, 1
    met, 1
    whether, 1
    ago, 1
    any, 1
    those, 1
    to, 9
    cause, 1
    nobly, 1
    remaining, 1
    conceived, 2
    increased, 1
    battle-field, 1
    might, 1
    add, 1
    measure, 1
    perish, 1
    dead, 3
    they, 3
    it, 8
    new, 2
    poor, 1
    above, 1
    can, 5
    advanced, 1
    be, 5
    created, 1
    their, 1
    note, 1
    come, 1
    are, 3
    and, 6
    all, 5
    ground, 1
    fought, 1
    as, 5
    last, 1
    continent, 1
    vain, 1
    seven, 1
    government, 1
    people, 3
    us, 5
    do, 2
    nor, 2
    take, 1
    what, 2
    but, 2
    lives, 1
    dedicate, 6
    is, 9
    far, 2
    by, 1
    long, 2
    say, 1
    fitting, 1
    consecrate, 2
    so, 4
    forget, 1
    here, 8
    of, 5
    shall, 3
    on, 19
    in, 16
    rather, 2
    should, 1
    thus, 1
    or, 17
    consecrated, 1
    resting, 1
    altogether, 1
    this, 4
    men, 3
    god, 1
    birth, 1
    war, 2


## Dictionary sorting 

The python `sorted` method can be used to sort lists, dictionaries, tuples etc. For example, if we sort a list of words:


```python
sorted(['hippo', 'aadvark', 'elephant', 'zebra', 'buffalo'])
```




    ['aadvark', 'buffalo', 'elephant', 'hippo', 'zebra']



If we try running `sorted` on a dictionary, then its default behavior is to sort the keys:


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
sorted(words_dict.items(), key=compare, reverse=True)[:5]
```




    [('that', 13), ('the', 11), ('we', 10), ('to', 8), ('here', 8)]



## Houston, we have a problem

Below I have a function that takes a city name (a string) and a dictionary of different cities and their populations, and returns a string describing the city.


```python
def city_pop(city, cities_dict):
    return "{} has a population of {}".format(city, cities_dict[city])
```

This works fine if the city is in the dictionary, however if it is not we get a `KeyError`:


```python
cities = {'London': 8787892, 'New York': 8.623e6, 'Paris': 2.141e6, 'Los Angeles': 4e6}
```


```python
city_pop('London', cities)
```




    'London has a population of 8787892'




```python
city_pop('Houston', cities)
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    <ipython-input-8-9fe6da459e6a> in <module>
    ----> 1 city_pop('Houston', cities)
    

    <ipython-input-2-dd117ddc914e> in city_pop(city, cities_dict)
          1 def city_pop(city, cities_dict):
    ----> 2     return "{} has a population of {}".format(city, cities_dict[city])
    

    KeyError: 'Houston'


Your task is to make a new version of the function `city_pop` that behaves more intelligently than simply raising a `KeyError` if it cannot find the city. Here are a few suggestions for things you could try adding, but feel free to come up with your own improvements:
- check that the city is a string (what happens if you tried giving the function a number instead of a real city name?)
- if the function cannot find the city in the dictionary, print a (helpful!) message to the user that the city cannot be found
- even better: if the city cannot be found, ask the user if they'd like to add a new city to the dictionary. If so, make sure to ask for the population.


```python
def city_pop(city, cities_dict):
    # first check that the city is a string
    assert city.isalpha(), "City must be a string!"
    
    try:
        return "{} has a population of {}".format(city, cities_dict[city])
    except KeyError:
        print("Could not find that city. Would you like to input a new one?")
        y_or_n = input("yes (y) or no (n)? ")
        if y_or_n == 'y':
            new_city = input("What is the new city name?")
            new_pop = input("What is its population?")
            
            # check that the new population is actually a digit
            assert new_pop.isdigit(), "New population must be a number!"
            
            cities_dict[new_city] = int(new_pop)
            
            return
        else:
            return
```


```python
city_pop('Houston', cities)
```

    Could not find that city. Would you like to input a new one?


    yes (y) or no (n)?  y
    What is the new city name? Houston
    What is its population? 2313000



```python
city_pop('Houston', cities)
```




    'Houston has a population of 2313000'




```python

```
