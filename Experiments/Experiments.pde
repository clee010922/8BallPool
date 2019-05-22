public class Ball {
  float speed, xd, yd, x, y;
  int number;
  int size;

  public Ball(int num, int radius, float xp, float yp) {
    number = num;
    size = radius;
    speed = 0;
    xd = 1;
    yd = 1;
    x = xp;
    y = yp;
  }

  public void display() {
    fill(255);
    ellipse(x, y, size, size);
  }
}

Ball[] balls;
Ball selected;
int radius = 50;
float decc = 0.98;

void setup() {
  size(500, 500);
  balls = new Ball[5];
  for (int i = 0; i < 5; i++) {
    balls[i] = new Ball(i, radius, random(0, width/2), random(0, height/2));
  }
}

void mouseReleased() {
  float d = dist(selected.x, selected.y, mouseX, mouseY);
  selected.speed = d/10;
}


void draw() {
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    if (mouseX > balls[i].x-radius && mouseX < balls[i].x+radius &&
      mouseY > balls[i].y-radius && mouseY < balls[i].y+radius) {
      selected = balls[i];
    }
    if (selected != null) {
      if(mousePressed) {
        line(selected.x, selected.y, mouseX, mouseY);
      }
      selected.x += selected.speed*selected.xd*decc;
      selected.y += selected.speed*selected.yd*decc;
    }
  }
}