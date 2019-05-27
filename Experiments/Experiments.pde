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
      this.c = color(255, 0, 0);
      other.c = color(255, 0, 0);
      return true;
    } else {
      this.c = color(255, 255, 255);
      other.c = color(255, 255, 255);
      return false;
    }
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
