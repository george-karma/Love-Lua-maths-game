# Love-Lua-maths-game

Simple lua maths game made with the love2d framework, along with other community-made libraries. Made using Love2d 0.10.2

### How to run
To run you can download the exe in the releases or you can build it yourself by going here: https://bitbucket.org/rude/love/downloads/  and dowloading Love 0.10.2, then use the command:
```
"path-to-love/love.exe" "path-to-gamefolder"
```
Remember that the second factor in the command above is the path to the game folder, <b>Not</b> to the executable.


Inspired by this wonderfull tutorial:
  https://github.com/SSYGEN/blog/

### Known issues
Due to the library used for input  spamming keys that take you to another screen (e.g. spamming E on the start menu) will result in multiple instances of the screen beeing initiated. This further results in slowdown and audio shutter. Will fix this by researching another input  library.

Hitting multiple enemies at once can sometimes result in the wrong graphics beeing displayed. 

## Documentation

<details><summary>CLICK ME</summary>
<p>
Some temp docx, I will update this once I have the time
1.	Game Elements
a.	Input
The player object will have a constant velocity value attached to it, with the “a” and “d” keys being used to change the angular rotation of the player object (Figure 1).
 
Figure 1: Movement System
 The keyboard will be used to input numbers, specifically, the number keys will be used to type an answer, then the “e” key will be used to lock in the answer before smashing into enemies. Furthermore, the delete key will remove the current number, in case of mistakes (Figure 2).
 
Figure 2: Number imputing system
b.	Output
The main output will be done through the love.graphics library, supported by love.physics and love.input. These three libraries used in conjunction to make up the bulk of the front end of the game. 
The game is set on black background to mimic the feel of space in older games and reduce the amount of work that has to be done in regard to the. So, we can concentrate on adding more features. All the actors in the game will be drawn by means of built in mathematical methods such as “love.graphics.polygon”  which takes four or more points and draws  a empty or filled polygon.
All the enemies will be made with the “love.graphics.polygon” method to reduce the time that it will take to do art while reducing the size of the packaged game. The only planned enemy currently is an asteroid represented by an irregular polygon with a box collider. A math question will also be inscribed in the centre of the asteroid using the “love.graphics.print. The asteroids will have some degree of randomization, however they will all look roughly like the bellow (figure 3):
 
Figure 3: Enemy Asteroid
The player will be drawn through a more complicated system, but it will roughly look like the bellow (figure 4): 
 
Figure 4: Player object



c.	Actors
The will consists of two main types of actors and one subtype of actor. What is referred here by actor is any programming construct that the user directly interacts with and is displayed on screen.
The two main types are the player, described in the image above (figure 2), and the asteroids (figure 1). These actors consist of a computer-generated graphic, each with appropriately shaped collision boxes and. The one subtype of actor will be the UI. Two UI elements will be present:
•	HP bar at the top of the screen that consists of a computer-generated graphics, and some code that will “speak” with the player object to know when it gets hit and how much hp to decrease, pictured bellow (Figure 5). 
 
Figure 5
•	Score at the top right of the screen 

2.	Gameplay
a.	Core Gameplay/Story Board
The player will be tasked protecting an objective in the centre of the screen while managing health and fending off incoming asteroids. The game will end when either the player, or the objective runs out of health. This creates an interesting dynamic where the player has to manage both their life and the objective’s life. 
The player is going to fend of the asteroids by smashing into them, however, all the asteroids will have a randomly generated math’s question inscribed on them; the player will have to lock in the right answer before smashing into the asteroids, otherwise they will lose health.
b.	Narrative
There is no narrative for the game as it stands, however it can be added as development goes on. The main reason for the lack of a narrative is budget. Because we expect the game to be a piece of freeware, it means that no profit will be had, which in turn means that the resources that can be invested in development are limited.
3.	Target Market
The target market is children aged between 4 and 7.
4.	Game Purpose
The purpose of the game is to teach children how to do simple arithmetic fast, a skill which will no doubt come in use at later stages of education. To this end, the game must be somewhat entertaining while still managing to teach the player the intended material.

</p>
</details>
