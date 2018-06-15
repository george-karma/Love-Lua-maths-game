# Love-Lua-maths-game

Simple lua maths game madde with the love2d framework, along with other community-made libraries.

### How to run
To run you can download the exe in the releases or you can build it yourself by going here: https://bitbucket.org/rude/love/downloads/  and dowloading Love 0.10.2, then use the command:
```
"path-to-love/love.exe" "path-to-gamefolder"
```
Remember that the second factor in the command above is the path to the game folder, <b>Not</b> to the executable.


Inspired by this wonderfull tutorial:
  https://github.com/SSYGEN/blog/

### Known issues
Due to the library used for input  spamming keys that take you to another screen (e.g. spamming E on the start menu) will result in multiple instances of the screen beeing initiated. This further results in slowdown and audio shutter. Will fix this by researching another input library.

Hitting multiple enemies at once can sometimes result in the wrong graphics beeing displayed. 
