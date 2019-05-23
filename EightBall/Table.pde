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
    Ball ball1 = new Ball(1150, 450 , false, true, false,1,#FAF432);
    onTable[1] = ball1;
    Ball ball2 = new Ball(1225, 405 , false, true, false,2,#3252FA);
    onTable[2] = ball2;
    Ball ball3 = new Ball(1200, 480 , false, true, false,3,#FF2600);
    onTable[3] = ball3;
    Ball ball4 = new Ball(1175, 435 , false, true, false,4,#9F06CE);
    onTable[4] = ball4;
    Ball ball5 = new Ball(1250, 450 , false, true, false,5,#FC7F00);
    onTable[5] = ball5;
    Ball ball6 = new Ball(1225, 465 , false, true, false,6,#2CAF05);
    onTable[6] = ball6;
    Ball ball7 = new Ball(1250, 390 , false, true, false,7,#D10808);
    onTable[7] = ball7;
    Ball ball8 = new Ball(1200, 450 , false, false, true,8,#010300);
    onTable[8] = ball8;
    Ball ball9 = new Ball(1250, 420 , true, false, false,9,#FAF432);
    onTable[9] = ball9;
    Ball ball10 = new Ball(1175, 465 , true, false, false,10,#3252FA);
    onTable[10] = ball10;
    Ball ball11 = new Ball(1250, 510 , true, false, false,11,#FF2600);
    onTable[11] = ball11;
    Ball ball12 = new Ball(1225, 495 , true, false, false,12,#9F06CE);
    onTable[12] = ball12;
    Ball ball13 = new Ball(1200, 420 , true, false, false,13,#FC7F00);
    onTable[13] = ball13;
    Ball ball14 = new Ball(1250, 480 , true, false, false,14,#2CAF05);
    onTable[14] = ball14;
    Ball ball15 = new Ball(1225, 435 , true, false, false,15,#D10808);
    onTable[15] = ball15;
    Ball ball0 = new Ball(650, 450 , false, false, false,0,#FFFFFF);
    onTable[0] = ball0; // white cue ball
    holes[0] = new Pocket(380,180);
    holes[1] = new Pocket(890,180);
    holes[2] = new Pocket(1420,180);
    holes[3] = new Pocket(380,720);
    holes[4] = new Pocket(890,720);
    holes[5] = new Pocket(1420,720);
    walls[0] = new Wall(435,175,855,175,425,200);
    walls[1] = new Wall(925,175,1365,175,925,200);
    walls[2] = new Wall(435,700,855,700,425,725);
    walls[3] = new Wall(925,700,1365,700,925,725);
    walls[4] = new Wall(375,230,400,220,375,665);
    walls[5] = new Wall(1400,230,1425,220,1400,665);
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
