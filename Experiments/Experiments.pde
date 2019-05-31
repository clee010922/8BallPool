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

  public PVector polar(float radius, float angle) {
    PVector polar = new PVector(radius*cos(angle), radius*sin(angle));
    return polar;
  }

  public void collide(Ball other) {
    /*
    PVector n = other.location.sub(this.location);
    //float d = n.mag();
    n = n.normalize();
    this.location.sub(n.mult(0.1));
    PVector _n = this.location.sub(other.location);
    _n = _n.normalize();
    PVector nv = new PVector(-_n.y, _n.x);
    nv.normalize();
    float vStore = other.speed.mag();
    this.speed.mult(0.9);
    other.speed.mult(0.75);
    this.speed.add(_n.mult(0.5*vStore));
    other.speed.sub(nv.mult(0.5*vStore));
    

    /*
    //PVector colPoint = (this.location.add(other.location)).div(2);
     PVector newVel1 =  (other.speed.mult(2)).div(2);
     PVector newVel2 = (this.speed.mult(2)).div(2);
     this.speed = newVel1;
     other.speed = newVel2;
    /*
     PVector diff = other.location.sub(this.location);
     float n = diff.mag();
     PVector norm = diff.div(n);
     PVector delta = this.speed.sub(other.speed);
     float dot = delta.dot(norm);
     if (dot > 0) {
     float co = 0.5;
     float impS = (1+co)*dot*2;
     PVector imp = norm.mult(impS);
     this.speed.sub(imp);
     other.speed.sub(imp);
     }
    /*
     float xd = this.location.x - other.location.x;
     float yd = this.location.y - other.location.y;
     float dsq = xd*xd + yd*yd;
     float xv = other.speed.x - this.speed.x;
     float yv = other.speed.y - this.speed.y;
     float dot = xd*xv+yd*yv;
     if (dot > 0) {
     float scale = dot / dsq;
     float xc = xd * scale;
     float yc = yd * scale;
     this.speed.x += xc;
     this.speed.y += yc;
     other.speed.x += xc;
     other.speed.y += yc;
     }
     */
    /*
    //find a normal vector
    PVector n = other.location.sub(this.location);
    float d = n.mag();

    //find minimum translation distance
    PVector mtd = n.mult((radius*2 - d) / d);

    //push-pull balls
    this.location = this.location.add(mtd.mult(1/2));
    other.location = other.location.sub(mtd.mult(1/2));

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
    println(this.location);
    */
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
    for (int j = i+1; j < balls.length; j++) {
      if (balls[i].location.dist(balls[j].location) <= radius) {
        balls[i].collide(balls[j]);
      }
    }
  }
  for (int i = 0; i < balls.length; i++) {
    balls[i].move();
  }
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
  println(balls.length);
  println(balls[0].location);
}
