---
layout: post
title:  Review
date:   2019-08-08
day: 5
---


# Day 4 Review

Yesterday we looked at functions and I/O.

## Functions


```python
# define a function that prints greetings
def greetings(name):
    print("Hi {}! How are you today?".format(name))
```


```python
# call this function 
greetings("Dora")
```

    Hi Dora! How are you today?



```python
# define a function that returns something 
def am_i_odd(number):
    if number % 2 == 0:
        return False
    else:
        return True
```


```python
print(am_i_odd(5))
print(am_i_odd(81726))
```

    True
    False


## Input/output


```python
# get input from a user
name = input("Hi! What is your name? ")
```

    Hi! What is your name?  Luna



```python
# read from a file 
with open('secret_message.txt', 'r') as my_file:
    print(my_file.read())
```

    TOP SECRET BROWNIES RECIPE
    
    Yield: 25-30 brownies 
    
    Ingredients
    
    1 cup + 2 tbsp milk 
    1/2 cup + 3 tbsp oil
    1 tbsp pure vanilla extract
    1 cup all purpose flour
    1 cup unsweetened cacao or cocoa powder
    1/4 tsp + 1/8 tsp salt
    1/2 tsp baking powder
    1/2 cup brown sugar
    1/3 cup white sugar
    2 tbsp cornstarch 
    
    Instructions
    
    Whisk together the first 3 ingredients, then set aside. Preheat oven to 330F. 
    Grease a 9×13 pan (or 8×8 for thick brownies), or line with parchment paper, 
    and set aside. In a large mixing bowl,thoroughly combine all dry ingredients. 
    Stir wet into dry. Pour into the prepared pan. Smooth down. Bake 16 minutes, 
    or 24 if using an 8×8. The brownies will look a little underdone when they 
    come out, but that’s okay! Refrigerate – they start to firm up after a few 
    hours and are nice and cut-able by the next day, and the taste is much better 
    the next day as well. Store in the refrigerator for up to 4 days, or freeze.
    
    https://bit.ly/2k9AGI9
    



```python
# Write to a file
message = """
Hi Gran!

Thanks for the brownies recipe. I'm sure that these are 
going to sell great at the bake sale this weekend!

Love,
Tess
"""

with open("my_reply.txt", 'w') as output_file:
    output_file.write(message)
```


```python

```
