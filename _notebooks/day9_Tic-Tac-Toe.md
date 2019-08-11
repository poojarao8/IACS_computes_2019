---
layout: post
title:  Tic-tac-toe
date:   2019-08-11
day: 9
---


# Tic-Tac-Toe

### Part 1: The board

Time for some fake graphics! Let’s say we want to draw game boards that look like this (don't bother running the cell):


```python
 --- --- --- 
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- --- 
```

This one is 3x3. Obviously, they come in many other sizes (8x8 for chess, 19x19 for Go, and 1000x1000 for Xtreme Tic-Tac-Bro).

Ask the user what size game board they want to draw, and draw it for them to the screen using Python’s print statement.

Remember, we want to be able to do this for any size square board, but you can always start by just thinking about what to do for a 3x3 board and generalize later.


```python
#your code
```

### Part 2: Winning Conditions

As you may have guessed, we are trying to build up to a full tic-tac-toe board. Now let's focus on checking whether someone has WON a game of Tic Tac Toe, not worrying about how the moves were made.

If a game of Tic Tac Toe is represented as a list of lists, like so:


```python
game = [[1, 2, 0],
        [2, 1, 0],
        [2, 1, 1]]
```

where 0 means an empty square, 1 means that player 1 put their token in that space, and a 2 means that player 2 put their token in that space.

Given an $n$ by $n$ (ex., 3 by 3) list of lists that represents a Tic Tac Toe game board, tell me whether anyone has won, and tell me which player won, if any. A Tic Tac Toe win is $n$ in a row - either in a row, a column, or a diagonal. Don’t worry about the case where TWO people have won - assume that in every board there will only be one winner.

Here are some more examples to work with:

winner_is_2 = [[2, 2, 0],
	[2, 1, 0],
	[2, 1, 1]]

winner_is_1 = [[1, 2, 0],
	[2, 1, 0],
	[2, 1, 1]]

winner_is_also_1 = [[0, 1, 0],
	[2, 1, 0],
	[2, 1, 1]]

no_winner = [[1, 2, 0],
	[2, 1, 0],
	[2, 1, 2]]

also_no_winner = [[1, 2, 0],
	[2, 1, 0],
	[2, 1, 0]]

If you want, you can also try doing this with dictionaries instead of lists of lists. :)


```python
#your code
```

### Part 3: Filling the board

In a tic tac toe game, the “game server” needs to know where the Xs and Os are in the board, to know whether player 1 or player 2 (or whoever is X and O won). The next logical step is to deal with handling user input. When a player (say player 1, who is X) wants to place an X on the screen, they can’t just click on a terminal. So we are going to approximate this clicking simply by asking the user for a coordinate of where they want to place their piece.

As a reminder, our tic tac toe game is really a list of lists or dictionary, where the positions on the board and their values (i.e., 'O', 'X' or ' ') are stored as a key-value pair. An example of that would be like, {'top-left':' ', 'top-mid': ' ', 'top-right': ' ', 'mid-left': ' ', ...}.  

The game starts out with an empty game board like this:


```python
game = [[0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]]
```

The computer asks Player 1 (X) what their move is (in the format row,col), and say they type 1,3. Then the game would print out:


```python
game = [[0, 0, X],
        [0, 0, 0],
        [0, 0, 0]]
```

And then it would ask Player 2 for their move, printing an O in that place.

#### Note:

Just for now, assume that player 1 (the first player to move) will always be X and player 2 (the second player) will always be O.
    Notice how in the example I gave coordinates for where I want to move starting from (1, 1) instead of (0, 0). To people who don’t program, starting to count at 0 is a strange concept, so it is better for the user experience if the row counts and column counts start at 1. This is not required, but whichever way you choose to implement this, it should be explained to the player.
    Ask the user to enter coordinates in the form “row,col” - a number, then a comma, then a number. Then you can use your Python skills to figure out which row and column they want their piece to be in.
    Don’t worry about checking whether someone won the game, but if a player tries to put a piece in a game position where there already is another piece, do not allow the piece to go there.

#### Bonus:

For the “standard” exercise, don’t worry about “ending” the game - no need to keep track of how many squares are full. In a bonus version, keep track of how many squares are full and automatically stop asking for moves when there are no more valid moves.


```python
#your code
```

### Part 4: Putting it all together

Use the functions you just built all together in the same program to make a two-player game that you can play with a friend. There are a lot of choices you will have to make when completing this exercise, so you can go as far or as little as you want with it.

Here are a few things to keep in mind:
- You should keep track of who won - if there is a winner, show a congratulatory message on the screen.
- If there are no more moves left, don’t ask for the next player’s move!
- You can ask the players if they want to play again and keep a running tally of who won more - Player 1 or Player 2.


```python
#your code
```

### Part 5: AI

Once you finish these, if you want, you can try to make another version of the game that uses AI instead of input from a second player. Imagine that the board is numbered like so:


```python
 --- --- --- 
| 7 | 8 | 9 | 
 --- --- ---  
| 4 | 5 | 6 | 
 --- --- ---  
| 1 | 2 | 3 | 
 --- --- --- 
```

You can use this algorithm for your AI:

1. First, see if there’s a move the computer can make that will win the game. If there is, take that move. Otherwise, go to step 2.
2. See if there’s a move the player can make that will cause the computer to lose the game. If there is, move there to block the player. Otherwise, go to step 3.
3. Check if any of the corner spaces (spaces 1, 3, 7, or 9) are free. If so, move there. If no corner piece is free, then go to step 4.
4. Check if the center is free. If so, move there. If it isn’t, then go to step 5.
5. Move on any of the side pieces (spaces 2, 4, 6, or 8). There are no more steps, because if the execution reaches step 5 the side spaces are the only spaces left.

You can have the program select who goes first randomly using the `random` module Sanket told us about.

Happy Tic Tac Toeing!


```python
#your code
```
