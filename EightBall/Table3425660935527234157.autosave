class Table {
  ArrayList<Ball> onTable;
  ArrayList<Ball> pocketed;
  ArrayList<Pocket> holes;
  int playerTurn;
  boolean player1Stripe;
  
  Table(ArrayList<Ball> ball, ArrayList<Ball> pocketBalls, ArrayList<Pocket> hole, int turn) {
    onTable = ball;
    pocketBalls = pocketed;
    hole = holes;
    playerTurn = turn;
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
}
