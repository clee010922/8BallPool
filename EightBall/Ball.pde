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
      circle(x,y,12.5);
    }
    if (stripe){
      arc(x,y-7.25,24, 16.5, PI , TWO_PI);
      arc(x,y+7.25,24, 16.5, 0 , PI);
    }
    if (num != 0){
      if (num > 9){
        textSize(10);
        fill(#000000);
        text("" + num,x-7,y+5);
      }
      else{
        textSize(12.5);
        fill(#000000);
        text("" + num,x-4,y+5);
      }
    }
  }
  
}
