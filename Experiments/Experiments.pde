public class Ball {

  PVector location, speed;
  int size;
  float decc = 0.98;
  boolean isSelected;

  public Ball(int radius, float xp, float yp) {
    size = radius;
    location = new PVector(xp, yp);
    speed = new PVector(0, 0);
    isSelected = false;
  }

  public void display() {
    fill(255);
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
}

Ball[] balls;
Ball selected;
int radius = 20;

void setup() {
  background(255);
  size(800, 400);
  balls = new Ball[5];
  for (int i = 0; i < 5; i++) {
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
    selected.speed = (selected.sub(mouseX, mouseY)).div(7);
    selected.xspeed = (selected.x-mouseX)/7;
    selected.yspeed = (selected.y-mouseY)/7;
    selected.isSelected = false;
    selected = null;
  }
}

void draw() {
  background(255);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
  }
}