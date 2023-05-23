PVector pos;
PVector dir = new PVector(0,0);
int size = 40;
int w, h;
int spd = 20;

void setup() {
  size(1080, 720);
  w = width/size;
  h = height/size;
  
  pos = new PVector(w/2, h/2);
  noStroke();
  fill(0);
}

void draw() {
  background(200);
  drawCharacter();
  updateCharacter();
}

void drawCharacter() {
  fill(0);
  rect(pos.x * size, pos.y * size, size, size);
}

void updateCharacter() {
  if (keyPressed == true) {
    rect(pos.x * size + dir.x * size, pos.y * size + dir.y * size, size, size);
    pos.x += dir.x * size;
    pos.y += dir.y * size;
  }
}

void keyPressed() {
  if( key == CODED) {
    if(keyCode == UP) { dir = new PVector(0,-1); }
    if(keyCode == DOWN) { dir = new PVector(0,1); }
    if(keyCode == LEFT) { dir = new PVector(-1,0); }
    if(keyCode == RIGHT) { dir = new PVector(1,0); }
  }
}

void reset() {
  spd = 20;
  pos = new PVector(w/2, h/2);
  dir = new PVector(0,0);
}
