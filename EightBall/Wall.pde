class Wall{
  float x1, y1, x2, y2, x3, y3; // these are the vertices of a rectangle
  //topleft(x1,y1) topright(x2,y2) bottomleft(x3,y3) 
  Wall(float newX, float newY, float newX2, float newY2,
  float newX3, float newY3){
    x1 = newX;
    y1 = newY;
    x2 = newX2;
    y2 = newY2;
    x3 = newX3;
    y3 = newY3;
  }
  
  void display(){
    fill(#05AA45);
    rect(x1,y1,x2-x1,y3-y1);
  }
}
