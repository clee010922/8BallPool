class Table {
  Ball[] onTable;
  Ball[] pocketed;
  Pocket[] holes;
  Wall[] walls;
  int playerTurn;
  int winner;
  boolean player1Stripe;
  Ball selected;

  Table(){
    onTable = new Ball[16];
    pocketed = new Ball[16];
    holes = new Pocket[6];
    walls = new Wall[18];
    Ball ball1 = new Ball(766.7, 300 , false, true, false,1,#FAF432);
    onTable[1] = ball1;
    Ball ball2 = new Ball(816.7, 270 , false, true, false,2,#3252FA);
    onTable[2] = ball2;
    Ball ball3 = new Ball(800, 320 , false, true, false,3,#FF2600);
    onTable[3] = ball3;
    Ball ball4 = new Ball(783.3, 290 , false, true, false,4,#9F06CE);
    onTable[4] = ball4;
    Ball ball5 = new Ball(833.3, 300 , false, true, false,5,#FC7F00);
    onTable[5] = ball5;
    Ball ball6 = new Ball(816.7, 310 , false, true, false,6,#2CAF05);
    onTable[6] = ball6;
    Ball ball7 = new Ball(833.3, 260 , false, true, false,7,#D10808);
    onTable[7] = ball7;
    Ball ball8 = new Ball(800, 300 , false, false, true,8,#010300);
    onTable[8] = ball8;
    Ball ball9 = new Ball(833.3, 280 , true, false, false,9,#FAF432);
    onTable[9] = ball9;
    Ball ball10 = new Ball(783.3, 310 , true, false, false,10,#3252FA);
    onTable[10] = ball10;
    Ball ball11 = new Ball(833.3, 340 , true, false, false,11,#FF2600);
    onTable[11] = ball11;
    Ball ball12 = new Ball(816.7, 330 , true, false, false,12,#9F06CE);
    onTable[12] = ball12;
    Ball ball13 = new Ball(800, 280 , true, false, false,13,#FC7F00);
    onTable[13] = ball13;
    Ball ball14 = new Ball(833.3, 320 , true, false, false,14,#2CAF05);
    onTable[14] = ball14;
    Ball ball15 = new Ball(816.7, 290 , true, false, false,15,#D10808);
    onTable[15] = ball15;
    Ball ball0 = new Ball(433.3, 300 , false, false, false,0,#FFFFFF);
    onTable[0] = ball0; // white cue ball
    holes[0] = new Pocket(256.7,120); //top left
    holes[1] = new Pocket(593.3,120); //top middle
    holes[2] = new Pocket(943.3,120); //top right
    holes[3] = new Pocket(253.3,480);  //bottom left //here
    holes[4] = new Pocket(593.3,480); //bottom middle
    holes[5] = new Pocket(943.3,480); //bottom right
    walls[0] = new Wall(290,116.7,566.7,116.7,283.3,133.3); //top left
    walls[1] = new Wall(620,116.7,910,116.7,616.7,133.3); //top right
    walls[2] = new Wall(290,466.7,566.7,466.7,283.3,483.3); //bottom left
    walls[3] = new Wall(620,466.7,910,466.7,616.7,483.3); //bottom right
    walls[4] = new Wall(250,153.3,266.7,153.3,250,446.7); //left
    walls[5] = new Wall(933.3,153.3,950,153.3,933.3,446.7); //right
    //triangle walls
    //hole0
    walls[6] = new triangleWall(273.3,116.7,290,116.7,290,133.3);
    walls[7] = new triangleWall(250,153.3,266.7,153.3,250,136.7);
    //hole1
    walls[8] = new triangleWall(566.7,116.7,566.7,133.3,575,116.7);
    walls[9] = new triangleWall(620,116.7,611.7,116.7,620,133.3);
    //hole2
    walls[10] = new triangleWall(910,116.7,926.7,116.7,910,133.3);
    walls[11] = new triangleWall(933.3,153.3,950,153.3,950,136.7);
    //hole3
    walls[12] = new triangleWall(250,446.7,266.7,446.7,250,463.3);
    walls[13] = new triangleWall(290,466.7,290,483.3,270,483.3);
    //hole4
    walls[14] = new triangleWall(566.7,466.7,566.7,483.3,575,483.3);
    walls[15] = new triangleWall(620,466.7,620,483.3,611.7,483.3);
    //hole5
    walls[16] = new triangleWall(910,466.7,910,483.3,926.7,483.3);
    walls[17] = new triangleWall(933.3, 446.7, 950, 446.7, 950, 463.3);
    //rect(375, 175, 1050, 550);
  }

  void pocketBall(int index) {
    Ball temp = onTable[index];
    onTable[index] = null;
    pocketed[index] = temp;
  }

  void unPocket(int index) {
    Ball temp = pocketed[index];
    pocketed[index] = null;
    onTable[index] = temp;
  }

  void changeTurn() {
    if (playerTurn == 1)
      playerTurn = 2;
    else playerTurn = 1;
  }

  void player1Type(String str) {
    if (str.equals("stripe"))
      player1Stripe = true;
    else player1Stripe = false;
  }

  void display(){
    background(#1263FF);
    fill(#745300);
    rect(226.7,93.3, 746.7, 413.3);
    fill(#07DB59);
    rect(250, 116.7, 700, 366.7);
    //beginShape();
    //vertex
    //fill(#07DB59);
    //rect(400,200,1000,500);
    for (int i = 0; i < onTable.length; i++) {
      if (onTable[i] != null) {
        onTable[i].display();
      }
    }
    for (int i = 0; i < holes.length && holes[i] != null; i++) {
      holes[i].display();
    }
    for (int i = 0; i < walls.length; i++) {
      if (walls[i] != null) {
        walls[i].display();
      }
    }
    for (int i = 0; i < onTable.length; i++) {
      for (int j = i+1; j < onTable.length; j++) {
        if (onTable[i] != null && onTable[j] != null) {
          if (onTable[i].colliding(onTable[j]))
          return;
            //onTable[i].collide(onTable[j]);
        }
      }
    }
  }

  void update(){
    boolean allStripesDone = true;
    boolean allSolidsDone = true;
    boolean eightBallDone;
    //checks the status of all non cue and eight ball
    for (int i = 1; i < 8; i++){
      if (onTable[i] != null){
        allStripesDone = false;
      }
    }
    for (int i = 9; i < 16; i++){
      if (onTable[i] != null){
        allSolidsDone = false;
      }
    }
    //checks for status of eightball
    if (onTable[8] != null){
      eightBallDone = false;
    }
    else{
      eightBallDone = true;
    }
    
    //player1's turn 
    if (playerTurn == 1){
      if (player1Stripe){ //player1 is stripes
        if (allStripesDone){ //all stripes are done
          if (eightBallDone){
            winner = 1; //eightball is done
          }
        }
        else{ //all stripes are not done
          if (eightBallDone){
            winner = 2; //eightball is done but all stripes aren't
          }
        }
      }
      else{//player1 is solids
      }
    }
    //player2's turn
    if (playerTurn == 2){
    }
    
  }
<<<<<<< HEAD
  
  
=======
>>>>>>> 1f76ce0811d3f0afcd213a5a96215d5a5e7e8ac1
}