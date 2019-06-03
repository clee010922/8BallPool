# 8BallPool
Chong Lee and Brandon Chan\
Mr. K APCS pd. 3

# Development Log
**5/20/19:**\
*Chong:* Started the project. Made a Table class that will have all components of the game. Added instance variables and few methods.\
*Brandon:* Wrote some of the basics for some of the classes starting with Table. Created about 3 arrays to keep track of everything in Table and mostly organized all the classes with nothing to display at this point.

**5/21/19:**\
*Chong:* created an Experiment folder to play with the shooting and the collisions of the balls.\
*Brandon:* Worked on the table of the pool game and drew some of the balls and pockets to be added into their corresponding arrays.

**5/22/19:**\
*Chong:* kept working on the experiment class and the dragging/shooting of the ball. In class, the dragging worked but the ball was moving in a wrong direction. Also, the shapes were leaving traces when they were moving. Looking to fix that. At home, Chong fixed the dragging/shooting of the ball. The ball moves correctly and according to how long the mouse drag was, the ball moves at different speeds.\
*Brandon:* Got all of the balls on the table and in the correct positions. Added a number to each ball and a stripe to those that need a stripe. Worked on placing a rectangle wall between pockets.

**5/23/19:**\
*Chong:* continued to work on the experiment folder and successfully changed every code regarding movement and location with PVector, which will make our lives easier when calculating collisions.\
*Brandon:* continued working on placing the walls and placing the walls at a diagonal that connects with the holes. All the walls are finished for easy x and y detection but might adjust placements later to make it look better.

**5/24/19:**\
*Chong:* Started to work on collisions. In the Ball class, a test code was added to see if the balls were colliding correctly. When the balls were colliding, its color becomes red. It doesn't seem to work properly yet.\
*Brandon:* Started to work on the rules of the game. Added loops in update to check the status of the balls for both players but still need to take into account of the 8 ball. Added a background to the back of the table using an image but converted to just a solid color.

**5/27/19:**\
*Chong:* Transferred everything in Experiments folder to the actual files. The actual files now use PVectors and have updated methods regarding movements. Methods regarding ball collisions and movements are also added in the Ball class. In the Table class, the update methods now is a loop which checks for the collisions between the balls. If they do collide, then they will go through the collide method which handles the new velocity, direction, etc. However, the code doesn't seem to work yet.

**5/28/19:**\
*Chong:* Continued to implement the collisions of the balls.\
*Brandon:* Tested the code on the school computer but everything was much bigger than what it appeared on my laptop. Converted everything in table/ball class down to a size of 2/3 by multiplying each value by 2/3.

**5/29/19:**\
*Brandon:* Setted up the different conditions to win or lose for both players by checking the types of balls remaining as well as the status of the eightball. Started to work on moving the cue ball around with right click.

**5/30/19:**\
*Chong:* Added spaces between each balls so they don't collide when they are generated. Still working on collisions.\
*Brandon:* Finished moveWhite() and was able to keep it from going past the walls as well as overlapping with other balls.

**5/31/19:**\
*Chong:* Finished adding thespaces between each balls so theydon't collide when they are generated. Also trying to figure out why the code for collision isn't working yet.\
*Brandon:* Worked on the disappearing balls after collision problem. Added a display to know whose turn it is.

**6/1/19:**\
*Brandon:* Ball on ball collision works at an angle to each other and don't disappear anymore. Was able to undisplay a ball when it gets close enough to a hole. Able to replace the white ball after it enters a hole by putting it outside the table and adding it back in with right click.

**6/2/19:**\
*Chong:* Adjusted the pocket sizes and added the boundaries of the pool tables that the balls will bounce back when they try to go out of these boundaries. Also added a new boolean isMoving in Ball class that checks if the ball is moving or not. A new boolean isStillMoving in Table class which checks if all of the balls on table are still moving. This plays a role in the EightBall class because a player is only allowed to drag on the cue ball if the all of the balls have stopped moving. Also changed the color of the background and the texts of the game.
