Table t;

void mousePressed() {
  if (mouseX > t.onTable[0].position.x-30 && mouseX < t.onTable[0].position.x+30 &&
    mouseY > t.onTable[0].position.y-30 && mouseY < t.onTable[0].position.y+30) {
    t.onTable[0].isSelected = true;
    t.selected = t.onTable[0];
  }
}

void mouseReleased() {
  if (t.selected != null) {
    PVector mouseV = new PVector(mouseX, mouseY);
    PVector newSpeed = PVector.sub(t.selected.position, mouseV).div(7);
    t.selected.speed = newSpeed; 
    //(selected.location.sub(mouse)).div(7);
    //selected.speed.x = (selected.location.x-mouseX)/7;
    //selected.speed.y = (selected.location.y-mouseY)/7;
    //println(selected.speed);
    t.selected.isSelected = false;
    t.selected = null;
  }
}

void setup() {
  size(1200, 600); //1800 900
  t = new Table();
}

void draw() {
  t.display();
  t.update();
  t.moveWhite();
}