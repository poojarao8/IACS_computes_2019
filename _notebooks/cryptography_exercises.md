---
layout: post
title:  Exercises
date:   2019-08-08
day: ptography
---


# Cryptography exercises

## Rail fence cipher

In the session, we looked at *substitution ciphers*, where one letter is substituted for another. Another type of cipher is a *transposition cipher*. This is where the letters in a message are switched around according to some pattern. Here, we shall look at the [rail fence cipher](https://en.wikipedia.org/wiki/Rail_fence_cipher). 

Here's the description from wikipedia:

*In the rail fence cipher, the plain text is written downwards and diagonally on successive 'rails' of an imaginary fence, then moving up when the bottom rail is reached. When the top rail is reached, the message is written downwards again until the whole plaintext is written out. The message is then read off in rows. For example, if 3 'rails' and the message `WE ARE DISCOVERED. FLEE AT ONCE` is used, the cipherer writes out:*

    W . . . E . . . C . . . R . . . L . . . T . . . E
    . E . R . D . S . O . E . E . F . E . A . O . C .
    . . A . . . I . . . V . . . D . . . E . . . N . .

*Then reads off to get the ciphertext:*

    WECRLTEERDSOEEFEAOCAIVDEN
    
Write functions that encrypt and decrypt messages using the rail fence cipher.


```python

```

## Let's crack some codes!

In this directory, you'll find some `.txt` files which contain some encrypted messages. Each of the messages has been encrypted using one of the ciphers we saw during the session (and to make this task non-impossible we've indicated which cipher was used for each message). Your task is to try and decrypt these messages. To do this, feel free to reuse some of the code used during the session (e.g. to perform frequency analysis), or devise a method of your own (hint: some intelligent guesswork is likely to pay off here!).

Solved all these problems and want to try some more? Try encrypting some messages of your own and send them to your classmates to see if they can decrypt them!

Note: the last problem here is very difficult. Remember that it took three centuries for the Vigenère cipher to be broken, so it will be very impressive if you manage in an afternoon!


```python
# Caesar shift cipher
ciphertext = ""
with ("caesar.txt", r) as cipherfile:
    ciphertext = cipherfile.read()
    
# your solution goes here
```


```python
# Random monoalphabetic cipher (this has been encrypted using a random 
# permutation of the letters in the alphabet)
ciphertext = ""
with ("random_mono.txt", r) as cipherfile:
    ciphertext = cipherfile.read()
    
# your solution goes here
```


```python
# Vigenère cipher
ciphertext = ""
with ("vigenere.txt", r) as cipherfile:
    ciphertext = cipherfile.read()
    
# your solution goes here

```
