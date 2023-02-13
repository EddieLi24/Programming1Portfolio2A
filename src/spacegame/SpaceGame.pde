// Eddie Li | Nov 28 2022 | Spacegame
import processing.sound.*;
SoundFile blaster;
Ship s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
//Rock r1;
//Laser l1;
Star[] stars = new Star[100];
int score, level, rockRate, rockCount, rockPassed, laserCount;
boolean play;

void setup() {
  size(800, 800);
  blaster = new SoundFile(this, "blasterSound.wav");
  s1 = new Ship();
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer(int(random(500, 2000)));
  rockTimer.start();
  //r1 = new Rock();
  //l1 = new Laser();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);

    // Rendering
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();

    //Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps:" + powerups.size());
    }

    //Rendering PowerUps and Detecting Ship Collision
    for (int i=0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else {
          s1.ammo+=100;
        }
        powerups.remove(pu);
        // todo call the explosion animation
        // add a sound for explosion
        //todo: consider adding rock health
      }
    }

    //Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("Rock:" + rocks.size());
    }
    //Rendering Rocks and Detecting Ship Collision
    for (int i=0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        rocks.remove(r);
        // todo call the explosion animation
        // add a sound for explosion
        //todo: consider adding rock health
        score -= r.diam;
      }
    }
    // Render lasers on the screen and detect rock collision
    for (int i=0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j=0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=r.diam;
          // todo: add sound to collision
          // todo: add animation to the collision
          // todo: dectrament the rock health
          lasers.remove(l);
          r.diam-=50;
          if (r.diam<10) {
            rocks.remove(r);
          }
          rocks.remove(r);
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();
    if(s1.health<1) {
      gameOver();
    }
  }
}

void mousePressed() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    blaster.play();
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void keyPressed() {
  if ( key == ' ') {
  }
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-40, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(20);
  text("SPACEGAME" + "| Level" + level + "|Score:" + score + "| Ammo:" + s1.ammo + "|Health:" + s1.health, 20, 40);
}
void startScreen() {
  background(0);
  fill(255);
  text("Press any key to start", width/2-30, height/2-28);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Gamer Over", width/2-30, height/2-28);
}

//void drawShip(int x, int y) {
//  noStroke();
//  fill(128);
//  triangle(x,y-50, x+20, y+30,x-20,y+30);
//}
