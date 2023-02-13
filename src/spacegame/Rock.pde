class Rock {
  int x, y, speed, diam;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 10));
    diam = int(random(50, 150));
    int rand = int(random(0,3));
    if (rand ==0) {
      rock = loadImage("rock.png");
    } else if (rand ==1) {
      rock = loadImage("Rock 2.png");
    } else if (rand ==2) {
      rock = loadImage("Rock 3.png");
    }
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height + 50) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<3+(diam/2)) {
      return true;
    } else {
      return false;
    }
  }
}
