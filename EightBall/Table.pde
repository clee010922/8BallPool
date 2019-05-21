class Table {
  ArrayList<Ball> onTable;
  ArrayList<Ball> pocketed;
  ArrayList<Pocket> holes;
  int playerTurn;
  boolean player1Stripe;
  
  Table(ArrayList<Ball> ball, ArrayList<Ball> pocketBalls, ArrayList<Pocket> hole, int turn) {
    onTable = ball;
    pocketed = pocketBalls;
    hole = holes;
    playerTurn = turn;
  }
  
  Table(){
    Ball ball1 = new Ball(50, 50 , false, true, false);
    onTable.add(ball1);
    Ball ball2 = new Ball(50, 50 , false, true, false);
    onTable.add(ball2);
    Ball ball3 = new Ball(50, 50 , false, true, false);
    onTable.add(ball3);
    Ball ball4 = new Ball(50, 50 , false, true, false);
    onTable.add(ball4);
    Ball ball5 = new Ball(50, 50 , false, true, false);
    onTable.add(ball5);
    Ball ball6 = new Ball(50, 50 , false, true, false);
    onTable.add(ball6);
    Ball ball7 = new Ball(50, 50 , false, true, false);
    onTable.add(ball7);
    Ball ball8 = new Ball(50, 50 , false, false, true);
    onTable.add(ball8);
    Ball ball9 = new Ball(50, 50 , true, false, false);
    onTable.add(ball9);
    Ball ball10 = new Ball(50, 50 , true, false, false);
    onTable.add(ball10);
    Ball ball11 = new Ball(50, 50 , true, false, false);
    onTable.add(ball11);
    Ball ball12 = new Ball(50, 50 , true, false, false);
    onTable.add(ball12);
    Ball ball13 = new Ball(50, 50 , true, false, false);
    onTable.add(ball13);
    Ball ball14 = new Ball(50, 50 , true, false, false);
    onTable.add(ball14);
    Ball ball15 = new Ball(50, 50 , true, false, false);
    onTable.add(ball15);
    Ball ball0 = new Ball(50, 50 , false, false, false);
    onTable.add(ball0);
  }

  void pocketBall() {
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
