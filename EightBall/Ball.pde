class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  boolean isSelected;
  float radius = 30;
  float dec = 0.98;
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
    ellipse(position.x, position.y, radius, radius);
    if (num != 0) {
      fill(255, 255, 255);
      ellipse(position.x, position.y, 12.5, 12.5);
    }
    if (stripe) {
      arc(position.x, position.y-7.25, 24, 16.5, PI, TWO_PI);
      arc(position.x, position.y+7.25, 24, 16.5, 0, PI);
    }
    if (num != 0) {
      if (num > 9) {
        textSize(10);
        fill(#000000);
        text("" + num, position.x-7, position.y+5);
      } else {
        textSize(12.5);
        fill(#000000);
        text("" + num, position.x-4, position.y+5);
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
    if (d > radius*2)
      return;

    //find minimum translation distance
    PVector mtd = n.mult((radius*2 - d) / d);

    //push-pull balls
    this.position = this.position.add(mtd.mult(1/2));
    other.position = other.position.sub(mtd.mult(1/2));

    //find a unit normal vector
    PVector un = n.mult(1/n.mag());

    //find unit tangent vector
    PVector ut = new PVector(-un.y, un.x);

    //project velocities onto the un and ut vectors
    float v1n = un.dot(this.speed);
    float v1t = ut.dot(this.speed);
    float v2n = un.dot(other.speed);
    float v2t = ut.dot(other.speed);


    //convert the scalar normal and tangential velocities into vectors
    PVector v1nTag = un.mult(v2n);
    PVector v1tTag = ut.mult(v1t);
    PVector v2nTag = un.mult(v1n);
    PVector v2tTag = ut.mult(v2t);

    //update velocities
    this.speed = v1nTag.add(v1tTag);
    other.speed = v2nTag.add(v2tTag);
  }
}
