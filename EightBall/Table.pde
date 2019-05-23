class Table {
  Ball[] onTable;
  Ball[] pocketed;
  Pocket[] holes;
  Wall[] walls;
  int playerTurn;
  boolean player1Stripe;
  
  Table(){
    onTable = new Ball[16];
    pocketed = new Ball[16];
    holes = new Pocket[6];
    walls = new Wall[6];
    Ball ball1 = new Ball(1150, 450 , false, true, false);
    onTable[1] = ball1;
    Ball ball2 = new Ball(50, 50 , false, true, false);
    onTable[2] = ball2;
    Ball ball3 = new Ball(50, 50 , false, true, false);
    onTable[3] = ball3;
    Ball ball4 = new Ball(1175, 435 , false, true, false);
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
    Ball ball10 = new Ball(1175, 465 , true, false, false);
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
    Ball ball0 = new Ball(650, 450 , false, false, false);
    onTable[0] = ball0; // white cue ball
    holes[0] = new Pocket(380,180);
    holes[1] = new Pocket(890,180);
    holes[2] = new Pocket(1390,180);
    holes[3] = new Pocket(380,720);
    holes[4] = new Pocket(890,720);
    holes[5] = new Pocket(1390,720);
    walls[0] = new Wall(425,175,855,175,425,200);
    walls[1] = new Wall(925,175,1350,175,925,200);
    walls[2] = new Wall(425,700,855,700,425,725);
    walls[3] = new Wall(925,700,1350,700,925,725);
    walls[4] = new Wall(375,220,400,220,375,675);
    walls[5] = new Wall(1400,220,1425,220,1400,675);
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
    fill(#745300);
    rect(340,140, 1120, 620);
    //fill(#05AA45);
    //rect(375, 175, 1050, 550);
    //beginShape();
    //vertex
    fill(#07DB59);
    rect(400,200,1000,500);
    for (int i = 0; i < onTable.length; i++){
      if (onTable[i] != null){
        onTable[i].display();
      }
    }
    for (int i = 0; i < holes.length && holes[i] != null; i++){
      holes[i].display();
    }
    for (int i = 0; i < walls.length && walls[i] != null; i++){
      walls[i].display();
    }
  }
  
  void update(){
  }
}
