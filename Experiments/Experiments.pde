public class Ball {
<<<<<<< HEAD
  float xspeed, yspeed, x, y;
  int number;
  int size;
  boolean isSelected;
=======
  float speed, xd, yd, x, y;
  int number;
  int size;
>>>>>>> c46a5177a18d5c2594dd45d370ae79e81acf2bd8

  public Ball(int num, int radius, float xp, float yp) {
    number = num;
    size = radius;
<<<<<<< HEAD
    xspeed = 0;
    yspeed = 0;
    x = xp;
    y = yp;
    isSelected = false;
=======
    speed = 0;
    xd = 1;
    yd = 1;
    x = xp;
    y = yp;
>>>>>>> c46a5177a18d5c2594dd45d370ae79e81acf2bd8
  }

  public void display() {
    fill(255);
<<<<<<< HEAD
    ellipse(x, y, size*2, size*2);
  }

  public void move() {
    if (x - size <= 0 || x + size >= width)
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
=======
    ellipse(x, y, size, size);
>>>>>>> c46a5177a18d5c2594dd45d370ae79e81acf2bd8
  }
}

Ball[] balls;
Ball selected;
<<<<<<< HEAD
int radius = 20;
float decc = 0.98;

void setup() {
  background(255);
  size(500, 500);
  balls = new Ball[5];
  for (int i = 0; i < 5; i++) {
    balls[i] = new Ball(i, radius, random(0, width), random(0, height));
  }
}

void mousePressed() {
  for (int i = 0; i < balls.length; i++) {
    if (mouseX > balls[i].x-radius && mouseX < balls[i].x+radius &&
      mouseY > balls[i].y-radius && mouseY < balls[i].y+radius) {
      selected = balls[i];
      selected.isSelected = true;
=======
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
      if (mousePressed){
        line(selected.x, selected.y, mouseX, mouseY);
      }
      selected.x += selected.speed*selected.xd*decc;
      selected.y += selected.speed*selected.yd*decc;
>>>>>>> c46a5177a18d5c2594dd45d370ae79e81acf2bd8
    }
  }
}

<<<<<<< HEAD
void mouseReleased() {
  if (selected != null) {
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
=======




>>>>>>> c46a5177a18d5c2594dd45d370ae79e81acf2bd8
