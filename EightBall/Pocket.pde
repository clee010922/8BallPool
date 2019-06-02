class Pocket{
  float x;
  float y;
  float radius = 40;
  Pocket(float newX, float newY){
    x = newX;
    y = newY;
  }
  void display(){
    fill(#120D01);
    ellipse(x,y,radius, radius);
  }
}
