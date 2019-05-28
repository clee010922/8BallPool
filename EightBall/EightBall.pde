Table t;
void setup(){
  size(1200,600); //1800 900
  t = new Table();
}

void draw() {
  t.display();
  t.update();
}