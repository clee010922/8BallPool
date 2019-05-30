public class Ball {

  PVector location, speed;
  int size;
  float decc = 0.97;
  boolean isSelected;
  color c;

  public Ball(int radius, float xp, float yp) {
    size = radius;
    location = new PVector(xp, yp);
    speed = new PVector(0, 0);
    isSelected = false;
    c = color(255, 255, 255);
  }

  public void display() {
    fill(c);
    ellipse(location.x, location.y, size*2, size*2);
  }

  public void move() {
    if (location.x - size <= 0 || location.x + size >= width)
      speed.x *= -1;
    if (location.y - size <= 0 || location.y + size >= height)
      speed.y *= -1;
    if (isSelected) {
      line(location.x, location.y, mouseX, mouseY);
    }
    location.add(speed);
    speed.mult(decc);
  }

  public boolean colliding(Ball other) {
    if (this.location.dist(other.location) < size*2) {
      return true;
    } else {

      return false;
    }
  }
  
    public void collide(Ball other) {
    //find a normal vector
    PVector n = this.location.sub(other.location);
    float d = n.mag();
    
    //find minimum translation distance
    PVector mtd = n.mult((radius*2 - d) / d);

    //push-pull balls
    this.location = this.location.add(mtd.mult(1/2));
    other.location = other.location.sub(mtd.mult(1/2));

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
}

Ball[] balls;
Ball selected;
int radius = 20;

void setup() {
  background(255);
  size(800, 400);
  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(radius, random(0, width), random(0, height));
  }
}

void mousePressed() {
  for (int i = 0; i < balls.length; i++) {
    if (mouseX > balls[i].location.x-radius && mouseX < balls[i].location.x+radius &&
      mouseY > balls[i].location.y-radius && mouseY < balls[i].location.y+radius) {
      selected = balls[i];
      selected.isSelected = true;
    }
  }
}

void mouseReleased() {
  if (selected != null) {
    PVector mouseV = new PVector(mouseX, mouseY);
    PVector newSpeed = PVector.sub(selected.location, mouseV).div(7);
    selected.speed = newSpeed;
    //(selected.location.sub(mouse)).div(7);
    //selected.speed.x = (selected.location.x-mouseX)/7;
    //selected.speed.y = (selected.location.y-mouseY)/7;
    //println(selected.speed);
    selected.isSelected = false;
    selected = null;
  }
}

void draw() {
  background(#07DB59);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
  }
  for (int i = 0; i < balls.length; i++) {
    for (int j = i+1; j < balls.length; j++) {
      if (balls[i].colliding(balls[j])) {
        balls[i].collide(balls[j]);
      }
    }
  }
}