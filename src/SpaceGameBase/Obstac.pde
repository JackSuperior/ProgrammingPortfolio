class Rock {
  //mem vari
  int x, y, dia, health, speed;
  color c;
  char displayMode;
  //const
  Rock(int x, int y) {
    this.x=x;
    this.y=y;
    dia = 50;
    health=1;
    speed = int(random(5, 10));
    displayMode='1';
    c=255;
  }

  boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  //methods
  void display() {
    fill(c);
    ellipse(x, y, dia, dia);
  }
}
