 class Button {
  // Number Variables
  int x, y, w, h;
  String val;
  color c1, c2;
  boolean hover;

  //Constructor
  Button(int x, int y, int w, int h, String val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(128);
    c2 = color(222);
    hover = false;
  }
  // Member Methods
  void display() {
   if (hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    textSize(21);
    text(val, x+w/2-30, y+h/2-23);
  }

  void hover(int mx, int my) {
    hover = (mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2);
  }
}
