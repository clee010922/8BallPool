class Ball {
  PVector position, speed;
  boolean stripe;
  boolean solid;
  boolean eightball;
  boolean isSelected;
  float radius = 30;
  float dec = 0.98;
  int num;
  color ballColor;
  Ball(float newX, float newY, boolean str, boolean sol, boolean ei, int n, color c) {
    position = new PVector(newX, newY);
    speed = new PVector(0, 0);
    stripe = str;
    solid = sol;
    eightball = ei;
    num = n;
    ballColor = c;
    isSelected = false;
  }

  void display() {
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
    if (num != 0) {
      fill(255, 255, 255);
      ellipse(position.x, position.y, 12.5, 12.5);
    }
    if (stripe) {
      arc(position.x, position.y-7.25, 24, 16.5, PI, TWO_PI);
      arc(position.x, position.y+7.25, 24, 16.5, 0, PI);
    }
    if (num != 0) {
      if (num > 9) {
        textSize(10);
        fill(#000000);
        text("" + num, position.x-7, position.y+5);
      } else {
        textSize(12.5);
        fill(#000000);
        text("" + num, position.x-4, position.y+5);
      }
    }
    if (position.x - radius <= 0 || position.x + radius >= width)
      speed.x *= -1;
    if (position.y - radius <= 0 || position.y + radius >= height)
      speed.y *= -1;
    if (isSelected) {
      line(position.x, position.y, mouseX, mouseY);
    }
    position.add(speed);
    speed.mult(dec);
  }
<<<<<<< HEAD
}
=======

}
>>>>>>> 29070fb01b29799d25c1fd5f1e8e0a480813de57
