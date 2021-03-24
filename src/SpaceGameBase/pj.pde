class pj {
  //mem vari
  int x, y, speed;
  color c;

  //const
  pj(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 5;
    c = #FC05E0;
  }
  //methods
  void fire() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y<0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, 6, 6);
  }
}
