class Table {
  Ball[] onTable;
  Ball[] pocketed;
  Pocket[] holes;
  Wall[] walls;
  int playerTurn = 1;
  boolean gameOver = false;
  int winner;
  boolean assignedType = false;
  boolean player1Stripe;
  Ball selected;
  boolean whiteIsMoveable = false;
  boolean foundFirstContact = false;
  boolean isStillMoving = false;
  float firstContactIndex = -1; //-1 means no contact
  Table() {
    onTable = new Ball[16];
    pocketed = new Ball[16];
    holes = new Pocket[6];
    walls = new Wall[18];
    Ball ball1 = new Ball(764.7, 300, false, true, false, 1, #FAF432);
    onTable[1] = ball1;
    Ball ball2 = new Ball(822, 267, false, true, false, 2, #3252FA);
    onTable[2] = ball2;
    Ball ball3 = new Ball(802, 322, false, true, false, 3, #FF2600);
    onTable[3] = ball3;
    Ball ball4 = new Ball(783.3, 288, false, true, false, 4, #9F06CE);
    onTable[4] = ball4;
    Ball ball5 = new Ball(843, 302, false, true, false, 5, #FC7F00);
    onTable[5] = ball5;
    Ball ball6 = new Ball(822, 312, false, true, false, 6, #2CAF05);
    onTable[6] = ball6;
    Ball ball7 = new Ball(842, 257, false, true, false, 7, #D10808);
    onTable[7] = ball7;
    Ball ball8 = new Ball(802, 300, false, false, true, 8, #010300);
    onTable[8] = ball8;
    Ball ball9 = new Ball(843, 280, true, false, false, 9, #FAF432);
    onTable[9] = ball9;
    Ball ball10 = new Ball(783.3, 311, true, false, false, 10, #3252FA);
    onTable[10] = ball10;
    Ball ball11 = new Ball(843, 348, true, false, false, 11, #FF2600);
    onTable[11] = ball11;
    Ball ball12 = new Ball(821, 335, true, false, false, 12, #9F06CE);
    onTable[12] = ball12;
    Ball ball13 = new Ball(803, 278, true, false, false, 13, #FC7F00);
    onTable[13] = ball13;
    Ball ball14 = new Ball(843, 325, true, false, false, 14, #2CAF05);
    onTable[14] = ball14;
    Ball ball15 = new Ball(822, 290, true, false, false, 15, #D10808);
    onTable[15] = ball15;
    Ball ball0 = new Ball(433.3, 300, false, false, false, 0, #FFFFFF);
    onTable[0] = ball0; // white cue ball
    walls[0] = new Wall(290, 116.7, 566.7, 116.7, 283.3, 133.3); //top left
    walls[1] = new Wall(620, 116.7, 910, 116.7, 616.7, 133.3); //top right
    walls[2] = new Wall(290, 466.7, 566.7, 466.7, 283.3, 483.3); //bottom left
    walls[3] = new Wall(620, 466.7, 910, 466.7, 616.7, 483.3); //bottom right
    walls[4] = new Wall(250, 153.3, 266.7, 153.3, 250, 446.7); //left
    walls[5] = new Wall(933.3, 153.3, 950, 153.3, 933.3, 446.7); //right
    //triangle walls
    //hole0
    walls[6] = new triangleWall(273.3, 116.7, 290, 116.7, 290, 133.3);
    walls[7] = new triangleWall(250, 153.3, 266.7, 153.3, 250, 136.7);
    //hole1
    walls[8] = new triangleWall(566.7, 116.7, 566.7, 133.3, 575, 116.7);
    walls[9] = new triangleWall(620, 116.7, 611.7, 116.7, 620, 133.3);
    //hole2
    walls[10] = new triangleWall(910, 116.7, 926.7, 116.7, 910, 133.3);
    walls[11] = new triangleWall(933.3, 153.3, 950, 153.3, 950, 136.7);
    //hole3
    walls[12] = new triangleWall(250, 446.7, 266.7, 446.7, 250, 463.3);
    walls[13] = new triangleWall(290, 466.7, 290, 483.3, 270, 483.3);
    //hole4
    walls[14] = new triangleWall(566.7, 466.7, 566.7, 483.3, 575, 483.3);
    walls[15] = new triangleWall(620, 466.7, 620, 483.3, 611.7, 483.3);
    //hole5
    walls[16] = new triangleWall(910, 466.7, 910, 483.3, 926.7, 483.3);
    walls[17] = new triangleWall(933.3, 446.7, 950, 446.7, 950, 463.3);
    //rect(375, 175, 1050, 550);
    holes[0] = new Pocket(266.3, 130); //top left
    holes[1] = new Pocket(593.3, 130); //top middle
    holes[2] = new Pocket(933.3, 130); //top right
    holes[3] = new Pocket(266.3, 470);  //bottom left 
    holes[4] = new Pocket(593.3, 470); //bottom middle
    holes[5] = new Pocket(933.3, 470); //bottom right
  }
  
  void resetFindFirstContact(){
    foundFirstContact = false;
  }

  void pocketBall(int index) {
    Ball temp = onTable[index];
    onTable[index] = null;
    pocketed[index] = temp;
  }
  
  void changeMoveable(boolean boo){
   // if (!boo){
      whiteIsMoveable = boo;
//}
  }

  void unPocket(int index) {
    Ball temp = pocketed[index];
    pocketed[index] = null;
    onTable[index] = temp;
  }

  void changeTurn() {
    if (playerTurn == 1){
      playerTurn = 2;}
    else{ playerTurn = 1;}
  }

  void player1Type(String str) {
    if (str.equals("stripe"))
      player1Stripe = true;
    else player1Stripe = false;
  }

  void start() {
    /**
    for (int i = 0; i < onTable.length; i++) {
      for (int j = i+1; j < onTable.length; j++) {
        if (onTable[i] != null && onTable[j] != null) {
          if (onTable[i].position.dist(onTable[j].position) <= onTable[i].radius)
           float xDis = onTable[j].position.x - onTable[i].position.x;
          float yDis = onTable[j].position.y - onTable[i].position.y;
          float dist = sqrt(xDis * xDis + yDis * yDis);
            onTable[i].collide(onTable[j]);
        }
      }
    }
    **/
    for (int i = 0; i < onTable.length; i++) {
      if (onTable[i] != null){
        onTable[i].move();
      }
    }
  }

  void display() {
    background(#FFFFFF);
    fill(#745300);
    rect(226.7, 93.3, 746.7, 413.3);
    fill(#07DB59);
    rect(250, 116.7, 700, 366.7);
    //beginShape();
    //vertex
    //fill(#07DB59);
    //rect(400,200,1000,500);
    
    for (int i = 0; i < walls.length; i++) {
      if (walls[i] != null) {
        walls[i].display();
      }
    }
    for (int i = 0; i < holes.length && holes[i] != null; i++) {
      holes[i].display();
    }
    fill(255,255,255);
    ellipse(359.1,124.9,5,5);
    ellipse(428.3,124.9,5,5);
    ellipse(497.3,124.9,5,5);
    
    ellipse(692.5,124.9,5,5);
    ellipse(765,124.9,5,5);
    ellipse(837.5,124.9,5,5);
    
    ellipse(359.1,475,5,5);
    ellipse(428.3,475,5,5);
    ellipse(497.3,475,5,5);
    
    ellipse(692.5,475,5,5);
    ellipse(765,475,5,5);
    ellipse(837.5,475,5,5);
    
    ellipse(258.3,226.7,5,5);
    ellipse(258.3,300,5,5);
    ellipse(258.3,373.3,5,5);
    
    ellipse(941.65,226.7,5,5);
    ellipse(941.65,300,5,5);
    ellipse(941.65,373.3,5,5);
    for (int i = 0; i < onTable.length; i++) {
      if (onTable[i] != null) {
        onTable[i].display();
      }
    }
  }
  
  void moveWhite(){
    if (onTable[0] == null){
      onTable[0] = pocketed[0];
      pocketed[0] = null;
      onTable[0].position.x = 590;
      onTable[0].position.y = 20;
      onTable[0].speed.x = 0;
      onTable[0].speed.y = 0;
      whiteIsMoveable = true;
    }
      if (whiteIsMoveable && mousePressed && (mouseButton == RIGHT)){
        if (mouseX > 277.7 && mouseX < 922.3 && mouseY > 144.3 && mouseY < 455.7){
          boolean placeWhite = true;
          for (int i = 1; i < onTable.length; i++){// check for distance with other ball
            if (onTable[i] != null && dist(mouseX, mouseY,
            onTable[i].position.x, onTable[i].position.y) <= 20){
               placeWhite = false;
            }
          }
          if (placeWhite){
              onTable[0].position.x = mouseX; 
              onTable[0].position.y = mouseY;
              //whiteIsMoveable = false;
          }
          placeWhite = true;
        }
      }
  }

  void update() {
    boolean allStripesDone = true;
    boolean allSolidsDone = true;
    boolean eightBallDone;
    //checks the status of all non cue and eight ball
    for (int i = 1; i < 8; i++) {
      if (onTable[i] != null) {
        allStripesDone = false;
      }
    }
    for (int i = 9; i < 16; i++) {
      if (onTable[i] != null) {
        allSolidsDone = false;
      }
    }
    for (int i = 0; i < onTable.length; i++) {
      if (onTable[i] != null && !(onTable[i].isMoving) && !(onTable[0].isMoving)) {
        isStillMoving = false;
      } else {
        isStillMoving = true;
      }
    }   
    if (isStillMoving == false && foundFirstContact == false){
      whiteIsMoveable = true;
    }
    //checks for status of eightball
    if (onTable[8] != null) {
      eightBallDone = false;
    } else {
      eightBallDone = true;
    }

  //CHECKS FOR BALL COLLISION 
  for (int i = 0; i < onTable.length; i++){
    for (int j = i + 1; j < onTable.length; j++){
      if (onTable[i] != null && onTable[j] != null){
        float xDis = onTable[j].position.x - onTable[i].position.x;
        float yDis = onTable[j].position.y - onTable[i].position.y;
        float dist = sqrt(xDis * xDis + yDis * yDis);
        if (dist < 20){
          onTable[i].collide(onTable[j], xDis, yDis, dist);
          if (!foundFirstContact && i == 0){
            firstContactIndex = j; 
            foundFirstContact = true; 
            int turn = playerTurn;
             if (turn == 1){
              turn++;
            }
            else{
              turn--;
            }
            //whiteIsMoveable = true;
            if (turn == 1){
              if (player1Stripe && firstContactIndex < 8){
                whiteIsMoveable = true; 
              }
              if (!player1Stripe && firstContactIndex > 8){
                whiteIsMoveable = true;
              }
            }
            if (turn == 2){
              if (player1Stripe && firstContactIndex > 8){
                whiteIsMoveable = true;
              }
              if (!player1Stripe && firstContactIndex < 8){
                whiteIsMoveable = true;
              }
            }
          }
        }
      }
    }
    //if (!foundFirstContact){
    //  whiteIsMoveable = true;
    //}  
}
  //potting a ball
  boolean goAgain = false;
  for (int i = 0; i < onTable.length; i++){
    for (int p = 0; p < 6; p++){
      if (onTable[i] != null && dist(holes[p].x,holes[p].y,onTable[i].position.x,onTable[i].position.y) <= 22.5){
        pocketed[i] = onTable[i];
        onTable[i] = null;
        //assigning stripes or solids to each player based on the first ball that is potted
        if (!assignedType){
          int turn = playerTurn;
          if (turn == 1){
            turn++;
          }
          else{
            turn--;
          }
          if (i > 0){
            if (i < 8){
              if (turn == 1){
                player1Stripe = false;
                 assignedType = true;
              }
              if (turn == 2){
                player1Stripe = true;
                assignedType = true;
              }
            }
            if (i > 8){
              if (turn == 1){
                player1Stripe = true;
                assignedType = true;
              }
              if (turn == 2){
                player1Stripe = false;
                assignedType = true;
              }
            }
          }
          
        }
        int turnn = playerTurn;
          if (turnn == 1){
            turnn++;
          }
          else{
            turnn--;
          }
          if (turnn == 1 && player1Stripe && i > 8){
            goAgain = true;
          }
          if (turnn == 1 && !player1Stripe && i < 8){
            goAgain = true;
          }
          if (turnn == 2 && !player1Stripe && i > 8){
            goAgain = true;
          }
          if (turnn == 2 && player1Stripe && i < 8){
            goAgain = true;
          }
        if (goAgain){
          if (playerTurn == 2){
            playerTurn--;
          }
          else{
            playerTurn++;
          }
        }
      }
    }
  }
    int turnnn = playerTurn;
          if (turnnn == 1){
            turnnn++;
          }
          else{
            turnnn--;
          }
    //player1's turn 
    if (turnnn == 1) {
      if (player1Stripe) { //player1 is stripes
        if (allStripesDone) { //all stripes are done
          if (eightBallDone) {
            winner = 1; //eightball is done
            gameOver = true;
          }
        } else { //all stripes are not done
          if (eightBallDone) {
            winner = 2; //eightball is done but all stripes aren't
            gameOver = true;
          }
        }
      } else {//player1 is solids
        if (allSolidsDone) {
          if (eightBallDone) {
            winner = 1;
            gameOver = true;
          }
        } else {
          if (eightBallDone) {
            winner = 2;
            gameOver = true;
          }
        }
      }
    }
    //player2's turn
    if (turnnn == 2) {
      if (player1Stripe) { //player2 is solids
        if (allSolidsDone) { //all stripes are done
          if (eightBallDone) {
            winner = 2; //eightball is done
            gameOver = true;
          }
        } else { //all solids are not done
          if (eightBallDone) {
            winner = 1; //eightball is done but all solids aren't
            gameOver = true;
          }
        }
      } else {//player2 is stripes
        if (allStripesDone) {
          if (eightBallDone) {
            winner = 2;
            gameOver = true;
          }
        } else {
          if (eightBallDone) {
            winner = 1;
            gameOver = true;
          }
        }
      }
    }
    textSize(25);
    fill(0,0,0);
    text("Player" + " " + playerTurn + "'s" + "Turn", 500 ,50);
    text("Player 1", 100, 100);
    text("Player 2", 1000, 100);
    if (assignedType){
      if (player1Stripe){
        text("Striped", 100, 150);
        text("Solids", 1000, 150);
        }
      else{
        text("Solids", 100, 150);
        text("Stripes", 1000, 150);
      }
    }
    //text("" + firstContactIndex, 500, 500);
    if (gameOver){
      textSize(100);
      fill(255,0,0);
      text("Winner: Player " + winner, 250, 300); 
    }
   float h1 = 180;
   for (int j = 1; j < 8; j++){
     fill(255,255,255);
     ellipse(190,h1,20,20);
     h1 += 40;
   }
   h1 = 180;
   for (int k = 9; k < pocketed.length; k++){
     fill(255,255,255);
     ellipse(1000,h1,20,20);
     h1 += 40;
   }
    
   float player1Height = 180;
   float player2Height = 180;
   if (player1Stripe){
     for (int i = 1; i < 8; i++){
       if (pocketed[i] != null){
         pocketed[i].position.x = 1000;
         pocketed[i].position.y = player2Height;
         pocketed[i].display();
         player2Height += 40;
       }
     }
     for (int k = 9; k < pocketed.length;k++){
       if (pocketed[k] != null){
         pocketed[k].position.x = 190;
         pocketed[k].position.y = player1Height;
         pocketed[k].display();
         player1Height += 40;
       }
     }
   }
     if (!player1Stripe){
     for (int i = 1; i < 8; i++){
       if (pocketed[i] != null){
         pocketed[i].position.x = 190;
         pocketed[i].position.y = player1Height;
         pocketed[i].display();
         player1Height += 40;
       }
     }
     for (int k = 9; k < pocketed.length;k++){
       if (pocketed[k] != null){
         pocketed[k].position.x = 1000;
         pocketed[k].position.y = player2Height;
         pocketed[k].display();
         player2Height += 40;
       }
     }
     
   }
  }
  
  
}
