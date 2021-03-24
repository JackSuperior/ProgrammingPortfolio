class Pow {
  //mem vari
  int x, y, dia;
  color c;
  char displayMode;
  //const
  Pow() {
    x=0;
    y=0;
    dia = 0;
    displayMode='1';
    c=255;
  }
  //methods
  void display() {
    fill(c);
    ellipse(x, y, dia, dia);
  }
}
