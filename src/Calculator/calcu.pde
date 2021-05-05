/* //////////////////////////////////
 2020 Calculator for Programming I
 Jack Mayville
 Student interpretation of 
 Calculator assignment
 //////////////////////////////////*/

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal;
String op = "";
boolean left = true;
float r = 0.0;
float l = 0.0;
float result = 0.0;
int currentNum = 0;
DivInfo di = new DivInfo(currentNum);

void setup() {
  size(350, 520);
  dVal = "0.0";
  numButtons[0] = new Button(170, 370, 90, 60, "0", true);
  numButtons[1] = new Button(75, 190, 85, 50, "1", true);
  numButtons[2] = new Button(170, 190, 90, 50, "2", true);
  numButtons[3] = new Button(266, 190, 85, 50, "3", true);
  numButtons[4] = new Button(75, 250, 85, 50, "4", true);
  numButtons[5] = new Button(170, 250, 90, 50, "5", true);
  numButtons[6] = new Button(266, 250, 85, 50, "6", true);
  numButtons[7] = new Button(75, 310, 85, 50, "7", true);
  numButtons[8] = new Button(170, 310, 90, 50, "8", true);
  numButtons[9] = new Button(266, 310, 85, 50, "9", true);
  opButtons[0] = new Button(75, 370, 85, 60, "=", false);
  opButtons[1] = new Button(170, 440, 85, 30, "X", false);
  opButtons[2] = new Button(170, 480, 85, 30, "÷", false);
  opButtons[3] = new Button(75, 440, 85, 30, "+", false);
  opButtons[4] = new Button(75, 480, 85, 30, "-", false);
  opButtons[5] = new Button(266, 440, 85, 30, "%", false);
  opButtons[6] = new Button(266, 480, 85, 30, ".", false);
  opButtons[7] = new Button(236, 353, 25, 25, "x²", false);
  opButtons[8] = new Button(296, 353, 25, 25, "√", false);
  opButtons[9] = new Button(236, 388, 25, 25, "cos", false);
  opButtons[10] = new Button(296, 388, 25, 25, "sin", false);
  opButtons[11] = new Button(266, 388, 25, 25, "?", false);
  opButtons[12] = new Button(266, 353, 25, 25, "C", false);
}

void draw() {
  background(0);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void updateDisplay() {
  fill(40);
  rect(175, 80, 285, 110);
  fill(#F06678);
  fill(225);

  if (dVal.length()<13) {
    textSize(32);
  } else if (dVal.length()<14) {
    textSize(28);
  } else if (dVal.length()<15) {
    textSize(26);
  } else if (dVal.length()<17) {
    textSize(24);
  } else if (dVal.length()<19) {
    textSize(22);
  } else if (dVal.length()<21) {
    textSize(20);
  } else if (dVal.length()<23) {
    textSize(18);
  } else if (dVal.length()<25) {
    textSize(16);
  } else {
    textSize(14);
  }
  textAlign(RIGHT);
  text(dVal, 300, 130);
  textSize(9);
  textAlign(LEFT);
  println("L:" + l + " R:" + r + " Op:" + op);
  println("Result:" + result + " Left:" + left);
  // Div Info
  fill(127);
  textSize(14);
  textAlign(LEFT);
  fill(255);
}
void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].over && dVal.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].over) {
      handleEvent(opButtons[i].val, false);
    }
  }


  for (int i= 0; i<opButtons.length; i++) {
    if (opButtons[i].hover && opButtons[i].val.equals("C")) {
      dVal = "0";
      op = "";
      left = true;
      l = 0.0;
      r = 0.0;
      result = 0.0;
    } else if (opButtons[i].hover && opButtons[i].val.equals("+")) {
      if (!left) {
        performCalc();
      } else {
        op = "+";
        left = false;
        dVal = op;
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("-")) {
      if (!left) {
        performCalc();
      } else {
        op = "-";
        left = false;
        dVal = op;
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("=")) {
      performCalc();
    }
  }
}
void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);

  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  } else if (keyCode == 27) {
    key = 0;
    if (key == 0) {
      handleEvent("C", false);
    }
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) { // Left Number
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      l = float(dVal);
    } else { 
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      r = float(dVal);
    } else { 
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
    //if (left) {
    //  dVal=dVal.substring(0, dVal.length()-1);
    //}
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    op = "-";
    left = false;
    dVal = "0";
  } else if (val.equals("x")) {
    op = "x";
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = "÷";
    left = false;
    dVal = "0";
  } else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l));
      dVal = str(l);
    } else {
      r = sin(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("Rand")) {
    if (left) {
      l = random(0, 1);
      dVal = str(l);
    } else {
      r = random(0, 1);
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}

void callDivInfo() {
  currentNum = int(dVal.replaceAll("\\.0*$", ""));
  if (!dVal.contains(".") || dVal.contains(".0")) {
    // Check for Prime
    if (currentNum < 1) {
      noFill();
      stroke(#BABACF);
      ellipse(20, 20, 15, 15);
      fill(#BABACF);
      text("p", 20, 25);
    } else {
      if (di.isPrime(currentNum)) {
        fill(#E3DBB6);
        noStroke();
        ellipse(20, 20, 15, 15);
        fill(0);
        text("p", 20, 25);
      } else {
        noFill();
        stroke(#BABACF);
        ellipse(20, 20, 15, 15);
        fill(#BABACF);
        text("p", 20, 25);
      }
    }
  }
}
