PVector v1, v2, px, py, rx, ry;
boolean overCircle = false;
boolean locked = false;
int circleSize = 50;

void setup() {
  size(500, 500);
  v1 = new PVector(100, 300);
  v2 = new PVector(25, 50); 
}

void draw() {
  if (mouseX > v1.x-circleSize && mouseX < v1.x+circleSize &&
      mouseY > v1.y-circleSize && mouseY < v1.y+circleSize) {
        overCircle = true;
      }
  if (overCircle && mouseDown()
        
  ellipse(v1.x, v1.y, 50, 50);
}