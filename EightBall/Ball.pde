class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float radius = 30;
  float dec = 0.98;
  int num;
  color ballColor;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c){
    position = new PVector(newX, newY);
    speed = new PVector(0, 0);
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
  }
  
  void display(){
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
    if (num != 0){
      fill(255,255,255);
      ellipse(position.x, position.y, 12.5, 12.5);
    }
    if (stripe){
      arc(position.x, position.y-7.25,24, 16.5, PI , TWO_PI);
      arc(position.x, position.y+7.25,24, 16.5, 0 , PI);
    }
    if (num != 0){
      if (num > 9){
        textSize(10);
        fill(#000000);
        text("" + num,position.x-7, position.y+5);
      }
      else{
        textSize(12.5);
        fill(#000000);
        text("" + num,position.x-4,position.y+5);
      }
    }
  }
  
}
