class Star {
  //mem vari
  int x, y, speed, dia;
  color c;
  //const
  Star(int x, int y) {
    this.x=x;
    this.y=y;
    c=color(random(190,255));
    speed = int(random(1, 10));
    dia = int(random(1, 4));
  }
  //methods
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, dia, dia);
  }
}
