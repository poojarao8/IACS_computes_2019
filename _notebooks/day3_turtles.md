---
layout: post
title:  Turtles
date:   2019-08-07
day: 3
---


# Turtles

http://www.turtlesrock.org/

Lets do something fun and visual. We are going to need to use a library for this. In Python, a *library* is a collection of functions that you can use to perform actions without having to create your own code. In order to use a library we must `import` the library's code. Let's import the `turtle` library.


```python
import turtle
```

Nothing happened. Don't panic: this was supposed to happen! Importing a library doesn't actually execute any code (it just makes it available for use). As long as there is no error message after an import, we know we are good to go!

Lets start by creating a window to draw in.


```python
# here we are creating the window
window = turtle.Screen()
```

Next we need to create the thing we will be drawing with, called a Turtle.


```python
ned = turtle.Turtle()
```

Now a little arrow appeared in the middle of the window you created. That's your turtle. We'll refer to our turtle by name, `ned`.
  
Lets get `ned` to start walking by telling him to go forward.


```python
ned.forward(50)  # commands given to ned will often be given in a form like this
```

This command told `ned` (our turtle) to move forward 50 pixels worth of distance. Cool. Let's tell ned to take a left.


```python
ned.left(90)     # This command makes ned turn to the left
```


```python
ned.forward(50)  # This tells ned to walk forward again
```

Yay, that wasn't too bad. What if I wanted to send `ned` back to where he started? We just need to send `ned` home.


```python
ned.home()
```

Because of the default settings of turtles, the path that `ned` takes is drawn and left on the screen. What if I want to erase all `ned`'s hard work? I use `ned.clear()`.


```python
ned.clear()
```

Now let's use `ned` to draw some regular polygons.


```python
# Let's draw a square
side_length = 100 # length in pixels
angle = 90        # angle in degrees

ned.forward(side_length)

ned.left(angle)
ned.forward(side_length)

ned.left(angle)
ned.forward(side_length)

ned.left(angle)
ned.forward(side_length)
```

Nice, but very repetitive. Let's get rid of the repetition! We can use a for loop.


```python
ned.home()
ned.clear()

side_length = 100
angle = 90

# A square
for i in range(4):            # a square has four sides
    ned.forward(side_length)
    ned.left(angle)
```

Now, let us draw a triangle.


```python
ned.home()  # start back at the middle
ned.clear() # clear the square we just drew

side_length = 100 # pixels
angle = 120       # degrees. Note that this is the *exterior* angle

# An equilateral triangle
ned.forward(side_length)
ned.left(angle)
ned.forward(side_length)
ned.left(angle)
ned.forward(side_length)
```

**Challenge**: simplify the code from the cell above in the following cell using the for loop.


```python
# your code
```

So what if we wanted to do this more generally? We could create a variable for the number of sides to draw a generic $n$-gon. From the number of sides, we can calculate the angle we are going to turn. Let's do that now.


```python
# clean up our window
ned.home()
ned.clear()

# The number of sides
n = 6

# The length of a side in our shape
side_length = 50

# The angle between sides
angle = 360 / n

# Our loop
for i in range(n):
    ned.forward(side_length)
    ned.left(angle)
```

**Challenge**: how to draw a circle using a code above?

A fun little exercise is to draw these $n$-sided polygons multiple times. Well, we can do that if we use a loop inside a loop!


```python
# clean up previous shapes
ned.home()
ned.clear()

num_sides = 6           # the number of sides on our polygon
poly_angle = 360 / num_sides # the angle between sides of the polygon

num_shapes = 8            # the number of times to draw the polygon
shape_angle = 360 / num_shapes # the angle between shapes
side_length = 50 # the length of a side in our shape


for i in range(num_shapes): # helps to repeat the polygons
    
    for j in range(num_sides): # draws the polygons
        ned.forward(side_length)
        ned.left(poly_angle)
        
    ned.left(shape_angle) # rotate to not draw the new polygon in exactly the same place
    
    
# Little trick to hide the drawing icon
ned.hideturtle()
```

At the end of the above code cell, we used `hideturtle` to hide the drawing icon. To get your turtle back, you can use:


```python
ned.showturtle()
```

All of these drawings are starting `ned` in the middle of the screen. What if we wanted to start somewhere else? There are many ways to do this, but here's one: 


```python
ned.setposition(100,100)
```

That is almost what we want, but we still drew a line. How do we not draw a line? We use the `penup()` function.


```python
ned.penup()
```


```python
ned.setposition(-50,-50)
```

So there we go. What do we do if we want to start drawing lines again? As you may expect, we can use `pendown()`.


```python
ned.pendown()
ned.home()
```


```python
ned.clear()
```

We can change the background color of our window using `window.bgcolor("color_name")`. For example:


```python
window.bgcolor("blue")
```


```python
window.bgcolor("purple")
```


```python
window.bgcolor("white")
```

You have probably heard of the *RGB* (red-green-blue) model. It is a model where all colors are represented via certain amounts of red, green, and blue. We can do that here by specifying a color as being made up of a combination of red, green and blue. We do this by giving `bg_color` a tuple of the percentages of each of the three colors, where e.g. `(0,0,0)` is black, `(1,0,0)` is red, `(1,1,0)` is yellow and `(1,1,1)` is white.


```python
window.bgcolor((0.7,0.6,0.8))
```

Back to turtles: we can also change the color and thickness of the lines drawn by our turtles. For example:


```python
ned.forward(50)  # Draw using old size
ned.pensize(2)   # Make a new size
ned.forward(50)  # Draw using new size
ned.pensize(3.5) # Another new size
ned.forward(50)  # Drawing with the newer size
```

You can also change the color of the line drawn. 


```python
# Clean up old stuff
ned.home()
ned.clear()

# You can use common color names, 
# represented as strings
ned.pencolor("red")
ned.forward(50)
```


```python
# Clean up
ned.home()
ned.clear()

# Or you can use RGB
ned.pencolor((1,0,0)) # the color red
ned.forward(50)

ned.pencolor((0,1,0)) # the color green
ned.forward(50)

ned.pencolor((0,0,1)) # the color blue
ned.forward(50)
```

Any float between 0 and 1 is acceptable for these values. You can use these to get all sorts of colors. For example, we can draw a circle where the colors get progressively more red.


```python
# clean up our window
ned.home()
ned.clear()

# The number of sides
n = 30

# The length of a side in our shape
side_length = 15

# The angle between sides
angle = 360 / n

# Our loop
for i in range(n):
    ned.pencolor((i / 30, 0, 0))
    ned.forward(side_length)
    ned.left(angle)
```

Also, there are shapes that can be automatically drawn.


```python
# Clean up
ned.home()
ned.clear()

# Reset everything
ned.pensize(1)
ned.pencolor("black")

# Draw some circles
ned.circle(10)
ned.circle(40)
ned.circle(80)
```


```python
# Clean up
ned.home()
ned.clear()

ned.hideturtle()

# Draw some dots
ned.dot()
ned.dot(10, "red")
ned.penup()
ned.goto((100, 100))
ned.dot(80, (0, 0, 1))
ned.goto((-238, 85))
ned.dot(100, (0.5, 0.23, 0.75))
ned.goto((130, -67))
ned.dot(19, (0.09, .94, 0.11))
```

So lets take some time and draw things! If you come up with something you're willing to share, we are more than happy to cede the floor to you!


```python
# Stars
side = 40

# General good habit
ned.home()
ned.clear()

# General things 
window.bgcolor('black')
ned.showturtle()
ned.pensize(3)

# Draw the stars
ned.pencolor('yellow')
ned.fillcolor('yellow')
ned.pendown()
ned.begin_fill()

ned.right(36)
for i in range(5):
    ned.forward(side)
    ned.left(180 - (180 / 5)) # sum of all point angles of a star is 180!
    ned.forward(side)
    ned.right((180 - (180 / 5)) / 2)
ned.end_fill()

ned.hideturtle()
```

**Question**: we drew a pentagram. Now, how could we draw a hexagram?

Always clean up after yourself and close things properly.


```python
window.bye()
```


```python

```
