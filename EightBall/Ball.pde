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
  boolean isMoving;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c) {
    position = new PVector(newX, newY);
    speed = new PVector(0, 0);
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
    isSelected = false;
    isMoving = false;
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
    
    if (position.x < 266.3 && position.y < 130){
      position.x = 266.3;
      position.y = 130;
    }
    if (position.x < 266.3 && position.y > 470){
      position.x = 266.3;
      position.y = 470;
    }
    if (position.x > 573.3 && position.x < 613.3 && position.y < 130){
      position.x = 593.3;
      position.y = 130;
    }
    if (position.x > 573.3 && position.x < 613.3 && position.y > 470){
      position.x = 593.3;
      position.y = 470;
    }
    if (position.x > 933.3 && position.y < 130){
      position.x = 933.3;
      position.y = 130;
    }
    if (position.x > 933.3 && position.y > 470){
      position.x = 933.3;
      position.y = 470;
    }
    
    if (position.y < 143.3 && position.x > 283.3 && position.x < 566.7){
      speed.y *= -1;
      position.y = 143.3;
    }
    if (position.y < 143.3 && position.x > 616.7 && position.x < 910){
      speed.y *= -1;
      position.y = 143.3;
    }
    if (position.y > 456.7 && position.x > 283.3 && position.x < 566.7){
      speed.y *= -1;
      position.y = 456.7;
    }
    if (position.y > 455.7 && position.x > 616.7 && position.x < 910){
      speed.y *= -1;
      position.y = 456.7;
    }
    if (position.x < 276.7 && position.y > 153.3 && position.y < 446.7){
      speed.x *= -1;
      position.x = 276.7;
    }
    if (position.x > 923.3 && position.y > 153.3 && position.y < 446.7){
      speed.x *= -1;
      position.x = 923.3;
    }
    /**
    if ((position.x-10<=266.7 && position.y-10>=150 && position.y+10<=450) ||
      (position.x+10>=933.3 && position.y-10>=150 && position.y+10<=450))
      speed.x *= -1;
    if ((position.y-10<=133.3 && position.x-10>=286.3 && position.x+10<=573.3) ||
      (position.y-10<=133.3 && position.x-10>=613.3 && position.x+10<=913.3) ||
      (position.y+10>=466.7 && position.x-10>=286.3 && position.x+10<=573.3) ||
      (position.y+10>=466.7 && position.x-10>=613.3 && position.x+10<=913.3))
      speed.y *= -1;

    if (position.x - 10 <= 250 || position.x + 10 >= 950)
      speed.x *= -1;
    if (position.y - 10 <= 116.7 || position.y + 10 >= 483.3)
      speed.y *= -1;
    **/
    if (isSelected) {
      line(position.x, position.y, mouseX, mouseY);
    }
  }

  public void move() {
    if (speed.mag() < 0.1) {
      speed.set(0, 0);
      isMoving = false;
    } else {
      isMoving = true;
    }
    position.add(speed);
    speed.mult(dec);
  }

  public PVector polar(float radius, float angle) {
    PVector polar = new PVector(radius*cos(angle), radius*sin(angle));
    return polar;
  }

  void collide(Ball other, float xDis, float yDis, float dist) {
    float normX = xDis / dist;
    float normY = yDis / dist;
    float midX = (this.position.x + other.position.x)/2;
    float midY = (this.position.y + other.position.y)/2;
    this.position.x = midX - normX * 10;
    this.position.y = midY - normY * 10;
    other.position.x = midX + normX * 10;
    other.position.y = midY + normY * 10;
    float dVector = (this.speed.x - other.speed.x) * normX;
    dVector += (this.speed.y - other.speed.y) * normY;
    float dvx = dVector * normX;
    float dvy = dVector * normY;
    this.speed.x -= dvx;
    this.speed.y -= dvy;
    other.speed.x += dvx;
    other.speed.y += dvy;
    other.speed.x *= 0.98;
    other.speed.y *= 0.98;
    this.speed.x *= 0.95;
    this.speed.y *= 0.95;
  }
  /**
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
   **/
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
  /**
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
