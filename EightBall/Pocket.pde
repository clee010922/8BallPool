class Pocket{
  float x;
  float y;
  float radius = 50;
  Pocket(float newX, float newY){
    x = newX;
    y = newY;
  }
  void display(){
    fill(#120D01);
    circle(x,y,radius);
  }
}
