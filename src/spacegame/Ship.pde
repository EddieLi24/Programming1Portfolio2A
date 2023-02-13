class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  Ship() {
    x = 0;
    y = 0;
    w = 110;
    ammo = 1000;
    health = 1000;
    turretCount = 1;
    ship = loadImage("ship.png");
  }

  void display(int mx, int my) {
    x = mx;
    y = my;
    image(ship, x, y);
    imageMode(CENTER);
    ship.resize(w, w);
    image(ship, x, y);
  }

  void move() {
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
