class Table {
  Ball[] onTable;
  Ball[] pocketed;
  Pocket[] holes;
  int playerTurn;
  boolean player1Stripe;
  
  Table(){
    onTable = new Ball[16];
    pocketed = new Ball[16];
    Ball ball1 = new Ball(50, 50 , false, true, false);
    onTable[1] = ball1;
    Ball ball2 = new Ball(50, 50 , false, true, false);
    onTable[2] = ball2;
    Ball ball3 = new Ball(50, 50 , false, true, false);
    onTable[3] = ball3;
    Ball ball4 = new Ball(50, 50 , false, true, false);
    onTable[4] = ball4;
    Ball ball5 = new Ball(50, 50 , false, true, false);
    onTable[5] = ball5;
    Ball ball6 = new Ball(50, 50 , false, true, false);
    onTable[6] = ball6;
    Ball ball7 = new Ball(50, 50 , false, true, false);
    onTable[7] = ball7;
    Ball ball8 = new Ball(50, 50 , false, false, true);
    onTable[8] = ball8;
    Ball ball9 = new Ball(50, 50 , true, false, false);
    onTable[9] = ball9;
    Ball ball10 = new Ball(50, 50 , true, false, false);
    onTable[10] = ball10;
    Ball ball11 = new Ball(50, 50 , true, false, false);
    onTable[11] = ball11;
    Ball ball12 = new Ball(50, 50 , true, false, false);
    onTable[12] = ball12;
    Ball ball13 = new Ball(50, 50 , true, false, false);
    onTable[13] = ball13;
    Ball ball14 = new Ball(50, 50 , true, false, false);
    onTable[14] = ball14;
    Ball ball15 = new Ball(50, 50 , true, false, false);
    onTable[15] = ball15;
    Ball ball0 = new Ball(50, 50 , false, false, false);
    onTable[0] = ball0; // white cue ball
  }

  void pocketBall(int index) {
    Ball temp = onTable[index];
  }

  void unPocket() {
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
    fill(0,255,0);
    rect(400,200,1000,500);
  }
  
  void update(){
  }
}
