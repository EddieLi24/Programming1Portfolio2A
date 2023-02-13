class Laser {
  int x,y,w,h,speed;
  color c1;
  
  // Constructor
  Laser(int x, int y) {
    this.x = x-4;
    this.y = y;
    w = 4;
    h = 10;
    speed = 5;
    c1 = color(255);
  }
  
  void display() {
    fill(c1);
    rectMode(CENTER);
    noStroke();
    rect(x,y,w,h);
  }
  
  void move() {
    y -= speed;
    println(x + " : " + millis());
  }
  
  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect() {
    return true;
  }
}
