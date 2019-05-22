public class Ball {
  float xspeed, yspeed, x, y;
  int number;
  int size;

  public Ball(int num, int radius, float xp, float yp) {
    number = num;
    size = radius;
    xspeed = 0;
    yspeed = 0;
    x = xp;
    y = yp;
  }

  public void display() {
    if (x - size <= 0 || x - size >= width)
      xspeed *= -1;
    if (y - size <= 0 || y - size >= height)
      yspeed *= -1;
    fill(255);
    ellipse(x, y, size, size);
    x+=xspeed*decc;
    y+=yspeed*decc;
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

void mousePressed() {
  for (int i = 0; i < balls.length; i++) {
    if (mouseX > balls[i].x-radius && mouseX < balls[i].x+radius &&
      mouseY > balls[i].y-radius && mouseY < balls[i].y+radius) {
      selected = balls[i];
    }
  }
}

void mouseReleased() {
  selected.xspeed = selected.x-mouseX;
  selected.yspeed = selected.y-mouseY;
  selected = null;
}


void draw() {
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
}
