Table t;

void mousePressed() {
  if (!(t.gameOver) && t.onTable[0] != null && mouseButton == LEFT && t.onTable[0].position.x > 100 && mouseX > t.onTable[0].position.x-30 && mouseX < t.onTable[0].position.x+30 &&
    mouseY > t.onTable[0].position.y-30 && mouseY < t.onTable[0].position.y+30 && !(t.isStillMoving)) {
    t.onTable[0].isSelected = true;
    t.selected = t.onTable[0];
    t.resetFindFirstContact();
  }
}

void mouseReleased() {
  if (t.selected != null) {
    PVector mouseV = new PVector(mouseX, mouseY);
    PVector newSpeed = PVector.sub(t.selected.position, mouseV).div(7);
    /*
    if (abs(newSpeed.x) > 40) {
      if (newSpeed.x > 0)
        newSpeed.x = 40;
      if (newSpeed.x < 0)
        newSpeed.x = -40;
    }
    if (abs(newSpeed.y) > 40) {
      if (newSpeed.y > 0)
        newSpeed.y = 40;
      if (newSpeed.y < 0)
        newSpeed.y = -40;
    }
    */
    t.selected.speed = newSpeed;
    //(selected.location.sub(mouse)).div(7);
    //selected.speed.x = (selected.location.x-mouseX)/7;
    //selected.speed.y = (selected.location.y-mouseY)/7;
    //println(selected.speed);
    //println(t.onTable[0].speed);
    t.selected.isSelected = false;
    t.selected = null;
    t.changeTurn();
    t.changeMoveable(false);
  }
}

void setup() {
  size(1200, 600); //1800 900
  t = new Table();
}

void draw() {
  t.start();
  t.display();
  t.update();
  t.moveWhite();
  /*
  line(266.7, 0, 266.7, height);
   line(933.3, 0, 933.3, height);
   line(0, 133.3, width, 133.3);
   line(0, 466.7, width, 466.7);
   
   line(286.3, 0, 286.3, height);
   line(573.3, 0, 573.3, height);
   line(613.3, 0, 613.3, height);
   line(913.3, 0, 913.3, height);
   line(0, 150, width, 150);
   line(0, 450, width, 450);
   
   
   line(250, 0, 250, height);
   line(950, 0, 950, height);
   line(0, 116.7, width, 116.7);
   line(0, 483.3, width, 483.3);
   */
}
