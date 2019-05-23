class triangleWall extends Wall{
   triangleWall(float a, float b, float c, float d, float e, float f){
    super(a,b,c,d,e,f);
  }
  
  void display(){
    fill(#05AA45);
    triangle(x1,y1,x2,y2,x3,y3);
  }
}
