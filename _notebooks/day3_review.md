---
layout: post
title:  Review
date:   2019-08-11
day: 3
---


# Day 2 Review

Yesterday we looked at lists and for loops.

## Lists


```python
# define a list 
my_list = ["unicorn", "fairy", "hippogriff", "centaur", "dragon"]
print(my_list)
```

    ['unicorn', 'fairy', 'hippogriff', 'centaur', 'dragon']



```python
# access an element 
my_element = my_list[2]
print(my_element)
```

    hippogriff



```python
# access a slice 
my_slice = my_list[1:4]
print(my_slice)
```

    ['fairy', 'hippogriff', 'centaur']



```python
# a slice with steps. This accesses every other element in the list
step_slice = my_list[::2]
print(step_slice)
```

    ['unicorn', 'hippogriff', 'dragon']



```python
# change an element
my_list[1] = "goblin"
print(my_list)
```

    ['unicorn', 'goblin', 'hippogriff', 'centaur', 'dragon']



```python
# add an element 
my_list.append("elf")
print(my_list)
```

    ['unicorn', 'goblin', 'hippogriff', 'centaur', 'dragon', 'elf']


## For loops


```python
# iterate over numbers 
for i in range(10):
    print(i)
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9



```python
# iterate over lists 
for creature in my_list:
    print("Ahhh! It's a {}!".format(creature))
```

    Ahhh! It's a unicorn!
    Ahhh! It's a goblin!
    Ahhh! It's a hippogriff!
    Ahhh! It's a centaur!
    Ahhh! It's a dragon!
    Ahhh! It's a elf!



```python
# iterate over multiple lists at the same time
colors = ["green", "blue", "silver", "gold", "purple", "yellow"]
for color, creature in zip(colors, my_list):
    print("Look! It's a {} {}!".format(color, creature))
```

    Look! It's a green unicorn!
    Look! It's a blue goblin!
    Look! It's a silver hippogriff!
    Look! It's a gold centaur!
    Look! It's a purple dragon!
    Look! It's a yellow elf!



```python
# iterate over elements while keeping track of their indicies
for i, creature in enumerate(my_list):
    print("{} is element number {}".format(creature, i))
```

    unicorn is element number 0
    goblin is element number 1
    hippogriff is element number 2
    centaur is element number 3
    dragon is element number 4
    elf is element number 5

