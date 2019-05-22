public class Ball {
  float xspeed, yspeed, x, y;
  int number;
  int size;
  boolean isSelected;

  public Ball(int num, int radius, float xp, float yp) {
    number = num;
    size = radius;
    xspeed = 0;
    yspeed = 0;
    x = xp;
    y = yp;
    isSelected = false;
  }

  public void display() {
    fill(255);
    ellipse(x, y, size*2, size*2);
  }

  public void move() {
    if (x - size <= 0 || x +size >= width)
      xspeed *= -1;
    if (y - size <= 0 || y + size >= height)
      yspeed *= -1;
    if (isSelected) {
      line(x, y, mouseX, mouseY);
    }
    x+=xspeed;
    y+=yspeed;
    xspeed *= decc;
    yspeed *= decc;
  }
}

Ball[] balls;
Ball selected;
int radius = 20;
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
      selected.isSelected = true;
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
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
  }
}
