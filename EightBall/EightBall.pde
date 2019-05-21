Table t;
void setup(){
  size(1800,900);
  t = new Table();
}

void draw() {
  t.display();
  t.update();
}
