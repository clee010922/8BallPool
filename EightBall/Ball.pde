class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  float radius = 20;
  int num;
  float dec = 0.98;
  color ballColor;
  boolean isSelected;
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
    ellipse(position.x, position.y, radius, radius);
    if (num != 0) {
      fill(255, 255, 255);
      ellipse(position.x, position.y, 8.33, 8.33);
    }
    if (stripe) {
      arc(position.x, position.y-4.83, 16, 11, PI, TWO_PI);
      arc(position.x, position.y+4.83, 16, 11, 0, PI);
    }
    if (num != 0) {
      if (num > 9) {
        textSize(6.7);
        fill(#000000);
        text("" + num, position.x-4.7, position.y+3.3);
      } else {
        textSize(8.3);
        fill(#000000);
        text("" + num, position.x-2.7, position.y+3.3);
      }
    }
    if (position.x - radius <= 0 || position.x + radius >= width)
      speed.x *= -1;
    if (position.y - radius <= 0 || position.y + radius >= height)
      speed.y *= -1;
    if (isSelected) {
      line(position.x, position.y, mouseX, mouseY);
    }
  }

  public void move() {
    position.add(speed);
    speed.mult(dec);
  }

  public PVector polar(float radius, float angle) {
    PVector polar = new PVector(radius*cos(angle), radius*sin(angle));
    return polar;
  }
  
  void collide(Ball other){
    float distance = dist(this.position.x,this.position.y,other.position.x,other.position.y);
    if (distance <= 20){
      other.speed.x += this.speed.x;
      other.speed.y += this.speed.y;
      float angle = atan2(other.position.y - this.position.y, other.position.x - this.position.x);
      this.position.x = other.position.x - cos(angle) * 20;
      this.position.y = other.position.y - sin(angle) * 20;
      this.speed.x *= -.85;
      this.speed.y *= -.85;
    }
  }

  //public void collide(Ball other) {
    /*
    float a = this.position.sub(other.position).heading();
     this.position = other.position.add(this.polar(radius, a));
     float a1 = this.speed.heading()-a;
     float a2 = other.speed.heading()-a;
     PVector v1 = this.polar(this.speed.mag()*cos(a1), a);
     PVector v2 = this.polar(other.speed.mag()*cos(a2), a);
     this.speed.sub(v1).add(v2);
     other.speed.sub(v2).add(v1);
     */
     
     /**
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

    //convert the scalar normal and tangential velocities into vectors
    PVector v1nTag = un.mult(v1n);
    PVector v1tTag = ut.mult(v1t);
    PVector v2nTag = un.mult(v2n);
    PVector v2tTag = ut.mult(v2t);

    //update velocities
    this.speed = v1nTag.add(v1tTag);
    other.speed = v2nTag.add(v2tTag);
  }
  **/
}
