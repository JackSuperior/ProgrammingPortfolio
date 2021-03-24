// SpaceGame | Dec 2020
// By Jack Mayville, instructed by Mr Kapptie
//TODO: simplify art style to something basic yet enjoyable.

ship s1;
ArrayList<pj> projectiles = new ArrayList<pj>();
ArrayList<Rock> obstacales = new ArrayList<Rock>();
Timer timer;

void setup() {
  size (500, 500);
  s1 = new ship(#36AFDE);
  projectiles = new ArrayList();
  obstacales = new ArrayList();
  timer = new Timer(int(random(500, 3000)));
  timer.start();
}

void draw() {
  background(0);
  if (timer.isFinished()) {
    obstacales.add(new Rock(int(random(width)), -50));
    timer.start();
  }
  for (int i = 0; i < obstacales.size(); i++) {
    Rock rock = obstacales.get(i);
    rock.display();
    rock.move();
    if (rock.reachedBottom()) {
      obstacales.remove(rock);
    }
  }
  for (int i = 0; i < projectiles.size(); i++) {
    pj laser = projectiles.get(i);
    laser.display();
    laser.fire();
    if (laser.reachedTop()) {
      projectiles.remove(laser);
    }
  }
  s1.display(mouseX, mouseY);
}

void mousePressed() {
  projectiles.add(new pj(s1.x, s1.y));
}
