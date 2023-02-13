// Eddie li | 10 Oct 2022 | Screensaver

float xpos;
float ypos;
float strokeW;
float pointCount;

void setup() {
  size(displayWidth,displayHeight);
  background(255);
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  strokeW = random(1,10);
  pointCount = random(1,20);
  strokeWeight(strokeW);
  stroke(random(50, 255),random(50, 255),random(50, 255));
  if (xpos > width || xpos < 0 || ypos > height || ypos<0) {
    xpos = random(width);
    ypos = random(height);
  }
  if (random(100)>75) {
    strokeWeight(strokeW);
    moveLeft(xpos, ypos, pointCount);
  } else if (random(100)>66) {
    strokeWeight(strokeW);
    moveUp(xpos, ypos, pointCount);
  } else if (random(100)>50) {
    strokeWeight(strokeW);
    moveDown(xpos, ypos, pointCount);
  } else {
    strokeWeight(strokeW);
    moveRight(xpos, ypos, pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY - i;
  }
}void moveDown(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}void moveLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}
