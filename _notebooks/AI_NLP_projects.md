---
layout: post
title:  N lp projects
date:   2019-08-11
day: 8
---


All of these projects are open-ended, meaning that it's you who is deciding what exactly to do -- I will only give you some of the guidelines on what to aim for.



## Project 1: SwankBot

In this project, you need to create a chatbot that has a small knowledge database that allows it to show off its knowledge, randomizes answers that it is giving to the user, and emotionally reacts to certain things.

#### Task 1: knowledge database 
Here, we will need to create a knowledge database that the chatbot will rely on. We will start by creating the empty dictionary.


```python
knowledge = {}
```

Ask the user to tell us some facts. When receiving the facts, don't forget to save them!

* Chatbot: `Continue a sentence: a dog...`
* User: `is nice to play with`

Now, you can save the following item into your dictionary: `"dog":["is nice to play with"]`

We can start asking a user for the input about certain topics of your choice. You can create a list of topics you care about, and ask user to give you several facts about those topics. Make sure that in the end, every entry of your database looks somehow like that:

`"dog":["is nice to play with", "belongs to a canine family"]`


```python

```

**Task 2: show off your knowledge**

Study the `random.choice` function [here](https://docs.python.org/3/library/random.html). Write a code that is capable of using it. For example, ask user for an input, and if you know something about the things they told you about, mention a random fact about it!

* *User:* `I have a dog!`
* *Chatbot:* `Did you know that a dog belongs to a canine family?`


```python
from random import choice
```

** Task 3: get emotional**

Remember the sentiment analysis task we did together a couple of days ago? Retrieve (or re-write) the code that is capable of detecting the emotion of the user input (if any), and react to it with a phrase of your choice. Remember, that that phrase can be randomly selected as well!

* *User:* `I am sad today. My dog doesn't want to play with me.`
* *Chatbot:* `Oh :(`
* *Chatbot:* `By the way, did you know that a dog belongs to a canine family?`

For now, write a function that asks user for input, and reacts to it in some way.


```python

```

#### Task 4: putting it all together

Now create a full chatbot that is capable of talking to a user, reacting to their respondes, providing any facts if our chatbot has anything to say, and also getting emotional sometimes! Also, think of a name to give to your chatbot so that it can introducte iteself. :)

Repeat the function that you defined in the cell above until the user will want to stop the conversation.


```python

```

# Project 2: text generation

Here, we will generate sentences based on the ngrams from Harry Potter and see if they make sense.

Create a function `bigramize` that takes a list of words as input and returns the list with bigrams found in this list. For example:
* Input: \[today, is, a, nice, day\]
* Output: \[\[today, is\], \[is, a\], \[a, nice\], \[nice, day\]\]

If this is too easy, write a function `ngramize` that does the same thing not only for bigrams, but for any ngrams.


```python

```

In the same folder as this notebook, you can find a file with an extract from Harry Potter: `hp.txt`. Load this file and print the first two lines from it.


```python

```

Now we need to write a function `tokenize` that creates a list of words based on the sentence. What it should do:
* Remove all the punctuations from the sentence except the dot.
* Remove the capitalization (we want "Apple" to be treated in the same way as "apple") using the `str.lower()` function.
* Split the sentence -- pay attention to the final dot! It needs to be a separate "word".
* Return the result.


* Input: `Tomorrow, it will be nice.`
* Output: `\[tomorrow, it, will, be, nice, .\]`


```python

```

Now, let's prepare a list in which we will put all ngrams that we can extract from the Harry Potter.


```python
ngrams = []
```

Let's read the `hp.txt` line by line, and every line we will first tokenize, and then ngramize. Every time you observe a new ngram, save it in the list of `ngrams`.


```python

```

Now you should have a list of ngrams that are ready to help us to generate something interesting! Let's print some of them. For example, print first 10 ngrams that you collected from the text.


```python

```

Write a function `generate` that takes a list of ngrams as input, and produces a sentence. How to do it:

1. Pick a word that you are going to start your sentence with. You can either provide it as an argument to your function, or pick it randomly from the first words that are found in the ngrams.
2. Now, create a list of possible continuations of that word.
3. Choose a random word from that list (see the previous project for `random.choice` function).
4. While you are not choosing a dot, keep repeating steps 2 and 3.
5. If you chose a dot, output the resulting sentence! 


```python

```

Run the function and enjoy your work. :)
