class ship {
  //mem vari
  int x, y, health, ammo, lives;
  char displayMode;
  color c1;
  //const
  ship(color c1) {
    x = 0;
    y = 0;
    health = 50;
    ammo = 75;
    lives = 3;
    displayMode = '1';
    this.c1 = c1;
  }
  //mem methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    if (displayMode == '1') {
      rectMode(CENTER);
      stroke(150);
      strokeWeight(2);
      fill(c1);
      rect(x+18, y+10, 8, 8);
      rect(x-18, y+10, 8, 8);
      line(x+35, y+10, x+35, y);
      line(x-35, y+10, x-35, y);
      fill(128);
      triangle(x, y-20, x+40, y+10, x-40, y+10);
      fill(200);
      ellipse(x, y+10, 20, 80);
    }
  }
}
