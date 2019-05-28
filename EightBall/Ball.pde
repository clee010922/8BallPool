class Ball {
  float x;
  float y;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float speed;
  float radius = 20;
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
    ellipse(x,y,radius, radius);
    if (num != 0){
      fill(255,255,255);
      ellipse(x,y,8.33, 8.33);
    }
    if (stripe){
      arc(x,y-4.83,16, 11, PI , TWO_PI);
      arc(x,y+4.83,16, 11, 0 , PI);
    }
    if (num != 0){
      if (num > 9){
        textSize(6.7);
        fill(#000000);
        text("" + num,x-4.7,y+3.3);
      }
      else{
        textSize(8.3);
        fill(#000000);
        text("" + num,x-2.7,y+3.3);
      }
    }
  }
  
}