---
layout: post
title:  I o
date:   2019-08-05
day: 4
---


# Input / Output 

One thing we haven't touched on is how we can get our programs to interact with things outside of our code. In Python, we can write code to read and write to files and take input from the user. 

### Interact with User

A very simple way to demonstrate how to interact with the user is to take input from them using the `input()` function. (Run the cell below).


```python
name = input("What is your name?: ")
```

    What is your name?:  Arthur


You'll notice a few things from this line. 

First: Python prints out what is inside the string that we passed to the `input()` function. If we had passed nothing, what would we get?


```python
input()
```

     





    ''



It's not very informative when a program puts up an empty box and then idles, waiting for an uninformed user to do something. Its good practice to always provide some kind of prompt as a string input argument to `input()`. 

The second thing you may notice is Python that outputs our input. What type is our output?


```python
# use the type function to determine the type of our output
type(input("Give me a number: "))
```

    Give me a number:  42





    str



Although I entered a number here, Python interpreted it as a string. That's because everything entered into `input()` gets stored as a string. It is up to the programmer to change the input into the correct data type (this is known by computer scientists as *casting*).  

### Casting the data type of input
  
We can save the input into a variable in the usual way:


```python
my_name = input("Enter your name: ")
```

    Enter your name:  Arthur


You'll notice no output was given here, as it was instead stored inside the variable `my_name`. Lets see what is stored in `my_name`.


```python
print(my_name)
```

    Arthur


Let's try and get a number from the user now:


```python
my_int = input("What is the answer to life, the universe and everything? ")  # read input from the user

print(type(my_int))                         # print the type of the input from the user
print("The answer is " , my_int)            # print the input from the user

my_int = int(my_int)                        # change the input to an integer (rather than a string)

print(type(my_int))                         # again print the type of my_int (should be an integer)
print("The answer is " , my_int)            # again print my_int

my_int = str(my_int)
print(type(my_int))

```

    What is the answer to life, the universe and everything?  42


    <class 'str'>
    The answer is  42
    <class 'int'>
    The answer is  42
    <class 'str'>


So notice here that we took something that was a string and converted it to an integer. We could do it in one line by doing the following:


```python
my_int = int(input("What is the answer to life, the universe and everything? "))
print(type(my_int))
print("The answer is " , my_int)
```

    What is the answer to life, the universe and everything?  42


    <class 'int'>
    The answer is  42


### A bot you can chat to!

Remember chat bot example in the last lesson? Now we can make it interactive!


```python
def chatbot(name, animal, state):
    print("Hello, " + name + "!\n")
    
    print("Oh, I see you like " + animal + "s...")
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
        print("Pretty cold there, huh?")
    else:
        print("That's good.")
        
    return name + " from " + state + " likes " + animal + "s!"
```

Write some code that uses this chat bot by feeding user input into the chat bot function's arguments, as opposed to the predetermined answers we've been using.


```python
chatbot(input("What is your name? "),input ("What is your favorite animal? "),input("where are you from? "))
```

    What is your name?  Ford
    What is your favorite animal?  cat
    where are you from?  Betelgeuse V


    Hello, Ford!
    
    Oh, I see you like cats...
    That choice is pretty usual.
    
    Wow, you're from Betelgeuse V.
    That's good.





    'Ford from Betelgeuse V likes cats!'



Let's make our chatbot more chatty:


```python
import time

def chatbot():
    
    name = input("Hi, I'm RUDY! What's your name? ")
    
    time.sleep(1)
    
    print("Nice to meet you, " + name + "!\n")
    
    animal = input("I like turtles. What's your favorite animal? ")
    
    time.sleep(1)
    
    print("Oh, you like " + animal + "s...?")
    
    time.sleep(1)
    
    if animal in ["cat", "dog"]:
        print("Boooooring!\n")
    elif animal in ["spider", "salamander"]:
        print("WHOA! You're weird!\n")
    else:
        print("What the heck is that?!\n")
    
    time.sleep(1)
    
    state = input("Where are you from? :D ")
    
    time.sleep(1)
    
    print("Wow, you're from " + state + "??")
    
    time.sleep(1)
    
    if state in ["Connecticut", "Massachusetts", "Rhode Island", "New Hampshire", "Maine", "Vermont",
                 "New York", "Michigan", "Wisconsin", "Iowa", "Minnesota", "South Dakota", "North Dakota",
                 "Montana", "Idaho", "Oregon", "Washington"]:
        print("Pretty cold there, huh?")
    else:
        print("That's good.")
        
    return name + " from " + state + " likes " + animal + "s!"
```


```python
chatbot()
```

    Hi, I'm RUDY! What's your name?  Ford


    Nice to meet you, Ford!
    


    I like turtles. What's your favorite animal?  cat


    Oh, you like cats...?
    Boooooring!
    


    Where are you from? :D  Betelgeuse V


    Wow, you're from Betelgeuse V??
    That's good.





    'Ford from Betelgeuse V likes cats!'



### A quick example of control flow


```python
def are_we_there_yet():
    running = True
        
    while running:
        mom = input("Are we there yet? ")

        if mom == "yes":
            running = False
```


```python
are_we_there_yet()
```

    Are we there yet?  no
    Are we there yet?  
    Are we there yet?  no
    Are we there yet?  yes


## Read and Write to Files 

Python can also interact with files already saved on your hard drive or create a new file and write output to that new file. Both commands will require us to open and close a file. That is done as shown here:


```python
output_file = open('secret.txt','w')
```

What did we just do? We have opened the file hello.txt in `write` mode (that is what the `'w'` means). We could also have opened in `read only` mode (`'r'`) or `append` mode (`'a'`).  
  
In `write` mode, the file we name (here its `secret.txt`) is created if it doesn't exist. 

If it does exist, it is deleted and started from a blank file. Everything written to this file will start at the beginning and follow from there.
  
In `append` mode (`'a'`), the file named is created if it doesn't exist OR opened if it does exist. Everything written to the file is added at the end (appended, if you will). Anything already written in the file will remain there. New material will simply be appended.
  
In `read only` mode (`'r'`), the file is simply opened if it exists OR an error is thrown if it doesn't exist.

The file we just opened didn't exist, so Python has now kindly created it for us. 

The variable `output_file` is of a new kind of data type. Let's see what Python says it is:


```python
type(output_file)
```




    _io.TextIOWrapper



Think of `output_file` as some kind of interface to the actual file we're interested in,`secret.txt`. `output_file` is *not* the file itself, but through it we can communicate with the file. 

Anything we want to do with `secret.txt`, we must do through `output_file`. Note that `output_file` is just a variable name. We could have named it anything we wanted.

Now let's write something to our file with the write function.


```python
output_file.write("I know your secrets")
```




    19



This, oddly, printed the number `19` to the screen. This is simply the length of the string that we gave to `write()`. However, `write()` did more than just tell us the length of the string. 

Let's close our file now that it contains something so we can open it up and look at its contents. We do this just like you'd imagine: using the `close()` function.


```python
output_file.close()
```

Now, in order to read what's in our file, let's open it up in `read` mode.


```python
input_file = open('secret.txt', 'r') # the 'r' means read mode
```

Ok, let's read a single line out of our file. We do this with the `readline()` command.


```python
# read the next line in our file (which is the first line, since we haven't read any)
# and store it in a variable
the_line = input_file.readline() 

print(the_line)
```

    I know your secrets


Yay! The string we added is in our file. Can we read any more? We didn't add anything else, but let's try.


```python
the_second_line = input_file.readline() # read the next line of our file, which is the second line, since we already read the first
print(the_second_line)
```

    


No errors, but nothing seems to have happened. That's because `the_second_line` didn't contain anything (which we expected since we knew our file only had one line.)  
  
Let's close the file that is `read` only right now, open it in `append`, and then add another line.


```python
input_file.close()                          # close the file

the_file = open('secret.txt', 'a')          # reopen the file in append mode so we can add another line

# write two more lines to the file
the_file.write("I know them all! ")
the_file.write("Muahaha! ")

# now close the file
the_file.close()
```

Before we move on, I'm going to quickly introduce something new. 

You may have noticed that we've been opening and closing the same file a lot. What would happen if we forgot to close our file? If we tried to open it again, our code would break. What if the code broke *before* it reached the `.close()` function? The file would be left open, and again if we tried to re-open it later on, it wouldn't work. These are among the many reasons why it's strongly encouraged to always open files using the `with` keyword:


```python
with open('secret.txt', 'w') as the_file:
    the_file.write("I know them all! ")
    the_file.write("Muahaha! ")
```

This did exactly the same as the code above: opened the file `secret.txt` in write mode, write two lines to the file, then close the file. Notice we did not need to explicitly close the file ourselves this time: Python did that for us automatically when it exited the `with` block. The great thing about this, is that the file is guaranteed to be closed *regardless of what happens within the block*. So even if the code within the with block causes an error, the file will still be closed when the program exits the with block when the code fails. This is particularly important for complex codes where many different processes may be running at the same time, and although it may be a while before you write anything that complicated, it's good to get in the habit of always opening files using `with open` now!

Now let's open this file and read it line by line. We can do this quite easily using this next loop structure.


```python
with open('secret.txt','r') as the_big_file: # open the file

    for line in the_big_file:  # this for loop will go line-by-line until the end of the file, storing each line in the variable "line"
        print(line)
```

    I know them all! Muahaha! 


You'll notice that all the lines we printed were put on one single line. Why? 


```python
with open('secret.txt', 'a') as the_file2:

    the_file2.write("\nI know them all!")        #the \n adds a new line or "return" to our file
    the_file2.write("\nMuahaha!")
```

Now let's print each line of our new file. This is the same code as before.


```python
with open('secret.txt','r') as the_big_file: 
    for line in the_big_file: 
        print(line)
```

    I know them all! Muahaha! 
    
    I know them all!
    
    Muahaha!


Woo hoo! That did what we thought it would do. 

What if we wanted to read the entire file at once?  We can use the `readlines()` function to do that.


```python
with open('secret.txt', 'r') as the_whole_file:

    everything = the_whole_file.readlines()

    print(everything)
```

    ['I know them all! Muahaha! \n', 'I know them all!\n', 'Muahaha!']


The `readlines()` function stores all of the lines in a file as strings inside a list. So here we got the whole file, stored in a list of length `3` (the number of non-empty lines in the file). You'll notice we have the special characters `"\n"` explicitly written out here. But look what happens if we try printing them -- they'll magically turn back into new lines!


```python
print(everything[1])
```

    I know them all!
    


## Practice Problems

Write a function that takes two strings as arguments. 

Append the first string to a file, and use the second string as the name of the file. 

Check that your function works by either opening the file manually, or by opening the file in a new cell and printing the content.


```python

```


```python

```

Write a function with no arguments that prompts the user to enter a random integer between zero and one-hundred. 

Name your function `get_number` and have it return the number entered. 

Make sure to cast the number entered as an integer!!

*Bonus*: get your function to check that the number is between 1 and 100 before returning. If it's not, ask the user to try inputting a number again!


```python

```


```python

```


```python

```


```python

```

Write a function that takes a number as its only argument. 

Have the function prompt the user for another number and store it in a variable. Then, determine if the user's number is greater than, equal to, or less than the input number. 

Tell the user which case their guess falls into by printing to the screen. 

Have your function return True if its equal and False otherwise.


```python

```


```python

```

## Advanced Problem 

*Guessing Game*: Write a guessing game function that has generates a random integer between 1 and 100 (we will provide the code for this), and then has the user continue to guess until the user guesses the correct number. Each time the user is wrong, the function should tell the user if they were too high or too low.


```python

```


```python

```
