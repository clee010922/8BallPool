class Table {
  Ball[] onTable;
  Ball[] pocketed;
  Pocket[] holes;
  Wall[] walls;
  int playerTurn;
  boolean player1Stripe;
  Ball selected;

  Table(){
    PImage img = loadImage("grass.jpg");
    img.resize(1800,900);
    background(img);
    onTable = new Ball[16];
    pocketed = new Ball[16];
    holes = new Pocket[6];
    walls = new Wall[18];
    Ball ball1 = new Ball(1150, 450, false, true, false, 1, #FAF432);
    onTable[1] = ball1;
    Ball ball2 = new Ball(1225, 405, false, true, false, 2, #3252FA);
    onTable[2] = ball2;
    Ball ball3 = new Ball(1200, 480, false, true, false, 3, #FF2600);
    onTable[3] = ball3;
    Ball ball4 = new Ball(1175, 435, false, true, false, 4, #9F06CE);
    onTable[4] = ball4;
    Ball ball5 = new Ball(1250, 450, false, true, false, 5, #FC7F00);
    onTable[5] = ball5;
    Ball ball6 = new Ball(1225, 465, false, true, false, 6, #2CAF05);
    onTable[6] = ball6;
    Ball ball7 = new Ball(1250, 390, false, true, false, 7, #D10808);
    onTable[7] = ball7;
    Ball ball8 = new Ball(1200, 450, false, false, true, 8, #010300);
    onTable[8] = ball8;
    Ball ball9 = new Ball(1250, 420, true, false, false, 9, #FAF432);
    onTable[9] = ball9;
    Ball ball10 = new Ball(1175, 465, true, false, false, 10, #3252FA);
    onTable[10] = ball10;
    Ball ball11 = new Ball(1250, 510, true, false, false, 11, #FF2600);
    onTable[11] = ball11;
    Ball ball12 = new Ball(1225, 495, true, false, false, 12, #9F06CE);
    onTable[12] = ball12;
    Ball ball13 = new Ball(1200, 420, true, false, false, 13, #FC7F00);
    onTable[13] = ball13;
    Ball ball14 = new Ball(1250, 480, true, false, false, 14, #2CAF05);
    onTable[14] = ball14;
    Ball ball15 = new Ball(1225, 435, true, false, false, 15, #D10808);
    onTable[15] = ball15;
    Ball ball0 = new Ball(650, 450, false, false, false, 0, #FFFFFF);
    onTable[0] = ball0; // white cue ball
    holes[0] = new Pocket(385,180); //top left
    holes[1] = new Pocket(890,180); //top middle
    holes[2] = new Pocket(1415,180); //top right
    holes[3] = new Pocket(380,720);  //bottom left
    holes[4] = new Pocket(890,720); //bottom middle
    holes[5] = new Pocket(1415,720); //bottom right
    walls[0] = new Wall(435,175,850,175,425,200); //top left
    walls[1] = new Wall(930,175,1365,175,925,200); //top right
    walls[2] = new Wall(435,700,850,700,425,725); //bottom left
    walls[3] = new Wall(930,700,1365,700,925,725); //bottom right
    walls[4] = new Wall(375,230,400,230,375,670); //left
    walls[5] = new Wall(1400,230,1425,230,1400,670); //right
    //triangle walls
    //hole0
    walls[6] = new triangleWall(410, 175, 435, 175, 435, 200);
    walls[7] = new triangleWall(375, 230, 400, 230, 375, 205);
    //hole1
    walls[8] = new triangleWall(850,175,850,200,862.5,175);
    walls[9] = new triangleWall(930,175,917.5,175,930,200);
    //hole2
    walls[10] = new triangleWall(1365,175,1390,175,1365,200);
    walls[11] = new triangleWall(1400,230,1425,230,1425,205);
    //hole3
    walls[12] = new triangleWall(375,670,400,670,375,695);
    walls[13] = new triangleWall(435,700,435,725,405,725);
    //hole4
    walls[14] = new triangleWall(850,700,850,725,862.5,725);
    walls[15] = new triangleWall(930,700,930,725,917.5,725);
    //hole5
    walls[16] = new triangleWall(1365,700, 1365,725, 1390,725);
    walls[17] = new triangleWall(1400, 670, 1425, 670, 1425, 695);
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

  void display() {
    fill(#745300);
    rect(340,140, 1120, 620);
    fill(#07DB59);
    rect(375, 175, 1050, 550);
    //beginShape();
    //vertex
    //fill(#07DB59);
    //rect(400,200,1000,500);
    for (int i = 0; i < onTable.length; i++){
      if (onTable[i] != null){
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
  }

  void update() {
    for (int i = 0; i < onTable.length; i++) {
      for (int j = i+1; j < onTable.length; j++) {
        if(onTable[i] != null && onTable[j] != null) {
          //onTable[i].collide(onTable[j]);
          return;
        }
      }
    }
  }
}
