class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float speed;
  float radius = 20;
  int num;
  color ballColor;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c) {
    position = new PVector(newX, newY);
    speed = new PVector(0, 0);
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
    isSelected = false;
  }

  void display() {
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
    if (position.x - radius <= 0 || position.x + radius >= width)
      speed.x *= -1;
    if (position.y - radius <= 0 || position.y + radius >= height)
      speed.y *= -1;
    if (isSelected) {
      line(position.x, position.y, mouseX, mouseY);
    }
    position.add(speed);
    speed.mult(dec);
  }

  public void collide(Ball other) {
    //find a normal vector
    PVector n = this.position.sub(other.position);
    float d = n.mag();

    //find minimum translation distance
    PVector mtd = n.mult((radius*2 - d) / d);

    //push-pull balls
    this.position = this.position.add(mtd.mult(1/2));
    other.position = other.position.sub(mtd.mult(1/2));

    //find a unit normal vector
    PVector un = n.div(n.mag());

    //find unit tangent vector
    PVector ut = new PVector(-un.y, un.x);

    //project velocities onto the un and ut vectors
    float v1n = un.dot(this.speed);
    float v1t = ut.dot(this.speed);
    float v2n = un.dot(other.speed);
    float v2t = ut.dot(other.speed);

    //
    float v1nT = (2*1*v2n)/2;
    float v2nT = (2*1*v1n)/2;


    //convert the scalar normal and tangential velocities into vectors
    PVector v1nTag = un.mult(v1nT);
    PVector v1tTag = ut.mult(v1t);
    PVector v2nTag = un.mult(v2nT);
    PVector v2tTag = ut.mult(v2t);

    //update velocities
    this.speed = v1nTag.add(v1tTag);
    other.speed = v2nTag.add(v2tTag);
  }

  public boolean colliding(Ball other) {
    if (this.position.dist(other.position) < radius*2)
      return true;
    else return false;
  }
}
