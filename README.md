# EightBallPool
Chong Lee and Brandon Chan\
Mr. K APCS pd. 3

# Description
**EightBallPool** is a game in which 2 players take turns and shoot the white ball (cue ball) at other pool balls and try to pocket their own types (striped of solid) of pool balls. The player can click on the cue ball and drag the mouse to different locations to set the speed and the direction of the cue ball. When a player pockets the cue ball, the other player gets a free ball and can right click to place the cue ball wherever on the pool table. After pocketing all of the assigned type of pool balls, pocket the 8ball (black ball) to win.

# Rules
1: Each player has their own types of balls (stripes or solids). To determine each player's type of ball, the type of the first sunked ball will be assigned to the player that made it in while the opposite type is assigned to the other player.\
2: If a player shoots the ball but doesn't make any contact with another ball, the other player will be able to move the white ball on his/her turn. If a player doesn't make first contact with their assigned type of ball, the opposite player will get to move the white ball on his/her next turn as well.\
3: If a player sinks the white ball, the opposite player gets to place and move the white ball on his turn.\
4: If a player sinks in a ball of his/her type, he/she gets to go again.\
5: The first player to sink in the 8 ball AFTER sinking in all of the balls with his assigned type wins.\
6: If a player makes in the eightball without clearing all of his balls with his assinged type first, the opposite player wins the game.

# How To Play
Left click the white ball and drag in order to shoot. Right click the white ball and drag to move the white ball.

# How To Run
Open the **EightBall.pde** file inside the **EightBall** folder and click on the **run** button on the top left corner.

# Development Log
**_5/20/19:_**\
**Chong:** Started the project. Made a Table class that will have all components of the game. Added instance variables and few methods.\
**Brandon:** Wrote some of the basics for some of the classes starting with Table. Created about 3 arrays to keep track of everything in Table and mostly organized all the classes with nothing to display at this point.

**_5/21/19:_**\
**Chong:** created an Experiment folder to play with the shooting and the collisions of the balls.\
**Brandon:** Worked on the table of the pool game and drew some of the balls and pockets to be added into their corresponding arrays.

**_5/22/19:_**\
**Chong:** kept working on the experiment class and the dragging/shooting of the ball. In class, the dragging worked but the ball was moving in a wrong direction. Also, the shapes were leaving traces when they were moving. Looking to fix that. At home, Chong fixed the dragging/shooting of the ball. The ball moves correctly and according to how long the mouse drag was, the ball moves at different speeds.\
**Brandon:** Got all of the balls on the table and in the correct positions. Added a number to each ball and a stripe to those that need a stripe. Worked on placing a rectangle wall between pockets.

**_5/23/19:_**\
**Chong:** continued to work on the experiment folder and successfully changed every code regarding movement and location with PVector, which will make our lives easier when calculating collisions.\
**Brandon:** continued working on placing the walls and placing the walls at a diagonal that connects with the holes. All the walls are finished for easy x and y detection but might adjust placements later to make it look better.

**_5/24/19:_**\
**Chong:** Started to work on collisions. In the Ball class, a test code was added to see if the balls were colliding correctly. When the balls were colliding, its color becomes red. It doesn't seem to work properly yet.\
**Brandon:** Started to work on the rules of the game. Added loops in update to check the status of the balls for both players but still need to take into account of the 8 ball. Added a background to the back of the table using an image but converted to just a solid color.

**_5/27/19:_**\
**Chong:** Transferred everything in Experiments folder to the actual files. The actual files now use PVectors and have updated methods regarding movements. Methods regarding ball collisions and movements are also added in the Ball class. In the Table class, the update methods now is a loop which checks for the collisions between the balls. If they do collide, then they will go through the collide method which handles the new velocity, direction, etc. However, the code doesn't seem to work yet.

**_5/28/19:_**\
**Chong:** Continued to implement the collisions of the balls.\
**Brandon:** Tested the code on the school computer but everything was much bigger than what it appeared on my laptop. Converted everything in table/ball class down to a size of 2/3 by multiplying each value by 2/3.

**_5/29/19:_**\
**Brandon:** Setted up the different conditions to win or lose for both players by checking the types of balls remaining as well as the status of the eightball. Started to work on moving the cue ball around with right click.

**_5/30/19:_**\
**Chong:** Added spaces between each balls so they don't collide when they are generated. Still working on collisions.\
**Brandon:** Finished moveWhite() and was able to keep it from going past the walls as well as overlapping with other balls.

**_5/31/19:_**\
**Chong:** Finished adding thespaces between each balls so theydon't collide when they are generated. Also trying to figure out why the code for collision isn't working yet.\
**Brandon:** Worked on the disappearing balls after collision problem. Added a display to know whose turn it is.

**_6/1/19:_**\
**Brandon:** Ball on ball collision works at an angle to each other and don't disappear anymore. Was able to undisplay a ball when it gets close enough to a hole. Able to replace the white ball after it enters a hole by putting it outside the table and adding it back in with right click.

**_6/2/19:_**\
**Chong:** Adjusted the pocket sizes and added the boundaries of the pool tables that the balls will bounce back when they try to go out of these boundaries. Also added a new boolean isMoving in Ball class that checks if the ball is moving or not. A new boolean isStillMoving in Table class which checks if all of the balls on table are still moving. This plays a role in the EightBall class because a player is only allowed to drag on the cue ball if the all of the balls have stopped moving. Also changed the color of the background and the texts of the game. \
**Brandon:** Added a display so each player knows what kind of ball they should be hitting. Added a first contact for the white ball so when it hits something it isn't suppose to, the other player could move the white ball. Added a function where a player is able to go again if he/she makes in the correct ball. Added a winner display when the game ends and you can't play the game anymore.

**_6/4/19:_**\
**Brandon:** Fixed a bug with the walls where ball jumps out of the table if it is going really fast. Fixed the same issue but with the pockets as well. Added a display so each player knows what balls they made in. Made it so if the ball doesn't come into contact with any balls or the correct ball, the opposite player is able to move the ball. Fixed an issue with the going again function happening sometimes instead of always when a player makes in the correct type of ball.
