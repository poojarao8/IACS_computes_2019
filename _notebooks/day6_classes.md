---
layout: post
title:  Classes
date:   2019-08-05
day: 6
---


# Classes

So far we've been using lots of different *data types* and *data structures*, such as integers, floats, strings, lists, tuples.... But what if we want to represent a collection of data that doesn't  neatly fit into one of these existing data types? For that we can use *classes*. A class is a way of defining our own custom data type that can contain both data and its own functions for operating on that data. 

Note: classes are a very powerful concept that is key to *object oriented programming*. We're going to just cover the very basics here, but if you're interested in learning more, ask one of the instructors and we can point you in the direction of some further reading!

## Let's make a cat

For our first class, let's make a class that represents a cat. We'd like this class to contain some information about the cat: its name, its age and its color.


```python
class Cat(object):
    
    # constructor
    def __init__(self, name, age, color):
        # member variables
        self.name = name
        self.age = age
        self.color = color
```

There's a lot to unpack here. 

First of all, in the first line we define the class using the syntax `class Cat(object)`. This is similar to the `def foo` syntax we use to define functions. By convention, in Python class names begin with a capital letter (to help distinguish them from functions). The `(object)` bit is necessary here but it's beyond what we're going to cover today to explain why (ask an instructor if you're interested!). 

Next we define a function called `__init__`. This is a special function called the class *constructor*. Every time we make a `Cat` (as we will do shortly!), this function will be called automatically. The first argument of this function is `self`. This is a variable associated with the particular instance of the `Cat` that we create. We access things belonging to this particular instance with a period, `.`, as you can see on the next few lines. Here we define *member variables*. These are variables that *belong* to that particular instance of the `Cat` class. So here, we have said that we would like to create a cat with a particular name, age and color, then in the constructor we assign these values passed into the constructor to member variables.

To try and see how all this works a bit more, let's actually make a particular `Cat`. A particular instance of a class is known as an *object*. I'm going to make an object that represents my cat Arya.

<img src="{{ site.baseurl }}/images/arya.jpeg" />


```python
arya = Cat("Arya", 5, "ginger")

print(arya.name)
print(arya.age)
print(arya.color)
```

    Arya
    5
    ginger


Here I created the object `arya` of class `Cat`. When I created it, I passed the arguments `"Arya", 5, "ginger"` to its constructor, which then assigned these to the object's member variables. In the lines beneath, I then accessed these member variables. 

It's also possible to change the value of member variables after they have been defined. For example, let's say it's Arya's birthday and we need to update her age:


```python
arya.age += 1
print(arya.age)
```

    6


Great! Let's create a few more cats and store them in a list:


```python
cats = []
cats.append(arya)
cats.append(Cat("Lilly", 3, "gray"))
cats.append(Cat("Ben", 11, "white"))
cats.append(Cat("Ser Pounce", 4, "gray"))
cats.append(Cat("Mrs Norris", 13, "gray"))
cats.append(Cat("Salem", 500, "black"))
cats.append(Cat("Choupette", 7, "white"))
cats.append(Cat("Crookshanks", 10, "ginger"))
```


```python
for cat in cats:
    print("Name: {}, age: {}, color: {}".format(cat.name, cat.age, cat.color))
```

    Name: Arya, age: 5, color: ginger
    Name: Lilly, age: 3, color: gray
    Name: Ben, age: 11, color: white
    Name: Ser Pounce, age: 4, color: gray
    Name: Mrs Norris, age: 13, color: gray
    Name: Salem, age: 500, color: black
    Name: Choupette, age: 7, color: white
    Name: Crookshanks, age: 10, color: ginger


Great, so we've made a class that allows us to store some information about cats. Now let's define some *member functions* which allow us to carry out some operations on these objects.


```python
class Cat(object):
    
    def __init__(self, name, age, color):
        self.name = name
        self.age = age
        self.color = color
    
    # define function that makes the Cat meow
    def meow(self):
        print("{} says 'Meow!'".format(self.name))
        
    # increase the cat's age by n
    def update_age(self, n=1):
        self.age += n
    
    # define string representation
    def __str__(self):
        return "Cat {}, age: {}, color: {}".format(self.name, self.age, self.color)
```

Here we've redefined the `Cat` class the include a few new functions. Notice that the first argument of every function is `self`. In the first function, we've created a function that will cause the cat the meow:


```python
arya = Cat("Arya", 5, "ginger")
arya.meow()
```

    Arya says 'Meow!'


In the second function, we've created a function to update the cat's age. If we don't pass in any arguments to this function, it defaults to 1. 


```python
print(arya.age)

arya.update_age()

print(arya.age)

arya.update_age(3)

print(arya.age)
```

    5
    6
    9


Our last function is a special function (you may have noticed that like `__init__` it is also surrounded by double underscores `__`. In Python, this is a way of indicating certain special function names and helps prevent the user from accidentally overriding with their own functions with the same name. These special methods are called *dunder methods*). It defines the *string representation* of the object. If you try printing once of the `Cat`s using our previous class definition, it should give you something like

``` 
<__main__.Cat object at 0x7fab527717f0>
```
Useful. By defining our own string representation, we can instead produce something much more human-readable:


```python
print(arya)
```

    Cat Arya, age: 9, color: ginger


## Classes of classes

Classes can also include instances of other classes and data objects. Let's make a class called `Person` that will use our `Cat` class.


```python
class Person(object):
    
    def __init__(self, first_name, last_name, cat=None):
        
        self.first_name = first_name
        self.last_name = last_name
        self.cat = cat
        
    def has_cat(self):
        
        if self.cat is None:
            print("{} has no cat :(".format(self.first_name))
            return False
        else:
            return True
        
    def __str__(self):
        
        return "Person {} {}".format(self.first_name, self.last_name)
```

Before we make some `Person` objects, one quick thing to point out: notice that in the constructor we've used a keyword argument. This is a particularly useful feature for constructors, as it's often the case that many of the objects that we create will have similar attributes. Rather than type out the full list of attributes every time we create a new object, we can use keyword arguments to define the default values of these attributes so that we only have to enter them for the few objects that are different.


```python
hermione = Person("Hermione", "Granger", cat=Cat("Crookshanks", 10, "ginger"))
harry = Person("Harry", "Potter")

print(hermione)
print(harry)

print(hermione.has_cat())
print(harry.has_cat())
```

    Person Hermione Granger
    Person Harry Potter
    True
    Harry has no cat :(
    False


## Operators

We've seen how we can perform arithmetic on integers, strings and lists, but what if we want to perform arithmetic using our own classes. It doesn't make so much sense to add and multiply cats, so unfortunately we're going to have to move on to another example here to illustrate this.

Let's create a class that describes periods of time in hours, minutes and seconds.


```python
class Time(object):
    """ describes time in hours, minutes and seconds """
    
    def __init__(self, h=0, m=0, s=0):
        
        self.h = int(h)
        self.m = int(m)
        self.s = int(s)
        
        self.redistribute()
        
    def to_seconds(self):
        """ convert time to seconds """
        return (self.h * 60 + self.m) * 60 + self.s
        
        
    def redistribute(self):
        """
        This will redistribute the minutes and seconds so that the seconds and minutes are < 60.
        """
        
        # calculate divisor and remainder for the seconds
        divisor = self.s // 60
        remainder = self.s % 60
        
        self.s = remainder
        self.m += divisor 
        
        # calculate divisor and remainder for the minutes
        divisor = self.m // 60 
        remainder = self.m % 60
        
        self.m = remainder
        self.h += divisor
        
    def __str__(self):
        # note that the funny :02d syntax here will pad out the time with leading zeros
        # so that it looks like hh:mm:ss
        return "{:02d}:{:02d}:{:02d}".format(self.h, self.m, self.s)
    
    def __repr__(self):
        # this is like __str__ in that it provides another representation of our object.
        # In the notebook, it's what you'll see if you run a cell that returns the object 
        # itself (i.e. you don't print it)
        return self.__str__()
    
    def __add__(self, other):
        # it only makes sense to add Time to Time
        if isinstance(other, Time):
            return Time(self.h + other.h, self.m + other.m, self.s + other.s)
        else:
            raise NotImplementedError("We don't know how to add {} to Time".format(type(other)))
            
    def __sub__(self, other):
        # it only makes sense to subtract Time from Time
        if isinstance(other, Time):
            return Time(self.h - other.h, self.m - other.m, self.s - other.s)
        else:
            raise NotImplementedError("We don't know how to subtract {} from Time".format(type(other)))
        
    def __mul__(self, other):
        # it only makes sense to multiply Time by a scalar
        if isinstance(other, int) or isinstance(other, float):
            return Time(s=int(self.to_seconds() * other))
        else:
            raise NotImplementedError("We don't know how to multiply Time by Time")
            
    def __truediv__(self, other):
        # it only makes sense to divide Time by a scalar
        if isinstance(other, int) or isinstance(other, float):
            return Time(s=int(self.to_seconds() / other))
        else:
            raise NotImplementedError("We don't know how to divide Time by Time")
        
    
```

Cool. So we've created a class that holds time, and defined a load of arithmetic functions using dunder (<b>d</b>ouble <b>under</b>score) methods. We've also created a couple of utility functions that help with our arithmetic. There's `to_seconds`, which returns the time in seconds (useful for multiplication and division), and there's `redistribute`, which will take any extra factors of 60 minutes and seconds and move them over to the hours and minutes so that the minutes and seconds in the `Time` object are always less than 60. Note that we call this at the end of the constructor so that the minutes and seconds are always redistrubuted every time a `Time` object is created. 

In our dunder methods, we have some checks to ensure that the `other` object is of the correct type for the operations to make sense. So for addition and subtraction, we check that `other` is another `Time` object, and for multiplication and division, we check that is a scalar (and integer or a float). 


```python
time = Time(110, 234, 124)
time
```




    113:56:04




```python
time2 = Time(s=124523)
time2
```




    34:35:23




```python
time + time2
```




    148:31:27




```python
time - time2
```




    79:20:41




```python
time * 5
```




    569:40:20




```python
time / 4
```




    28:29:01



## Practice problems

### Let's build a spaceship!

You've been appointed the head of a spaceship agency, and need to keep track of your spaceships. To do this, you've decided (perhaps questionably) to use python classes. Design a python class called `Spaceship`. It should have member variables recording its 
- name,
- destination,
- list of crew members,
- and whether or not it has launched.

Provide member functions that 

- return the number of crew members 
- and launch the spaceship (or at least change the launched variable from `False` to `True`).

Feel free to add any other variables or functions that you think might be useful for you to help manage your spaceships.

Don't forget to test out your class by creating a number of spaceships and launching them!


```python

```
