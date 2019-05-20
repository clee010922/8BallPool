public class Table {
  private ArrayList<Ball> onTable;
  private ArrayList<Ball> pocketed;
  private ArrayList<Pocket> holes;
  private int playerTurn;
  private boolean player1Stripe;
  
  public Table(ArrayList<Ball> ball, ArrayList<Ball> pocketBalls, ArrayList<Pocket> hole, int turn) {
    onTable = ball;
    pocketBalls = pocketed;
    hole = holes;
    playerTurn = turn;
  }

  public void pocketBall() {
  }

  public void unPocket() {
  }

  public void changeTurn() {
    if (playerTurn == 1)
      playerTurn = 2;
    else playerTurn = 1;
  }
  
  public void player1Type(String str) {
    if (str.equals("stripe"))
      player1Stripe = true;
    else player1Stripe = false;
  }
}