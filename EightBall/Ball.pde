class Ball {
  float x;
  float y;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float speed;
  float radius = 30;
  int num;
  color ballColor;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c){
    x = newX;
    y = newY;
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
  }
  
  void display(){
    fill(ballColor);
    circle(x,y,radius);
    if (num != 0){
      fill(255,255,255);
      circle(x,y,15);
    }
    if (num != 0){
      if (num > 9){
        textSize(11);
        fill(#000000);
        text("" + num,x-7,y+5);
      }
      else{
        textSize(15);
        fill(#000000);
        text("" + num,x-4,y+5);
      }
    }
  }
  
}
