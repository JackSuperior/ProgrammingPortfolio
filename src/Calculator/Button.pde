class Button {
  int x, y, w, h;
  String val;
  color c1, c2;
  boolean hover, isNumber, over;

  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = #FF6923;
    c2 = #F06678;
    hover = false;
    this.isNumber=isNumber;
  }

  void display() {
    stroke(0);
    if (over) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    textSize(14);
    text(val, x, y+5);
  }

  // Detect if mouse is over button
  void hover(int tempX, int tempY) {
    over = tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2;
  }
}
