PImage img;
PImage char1;
void setup()
{
  size(488*3, 192*3);
  img = loadImage("map.png");
  img.resize(488*3, 192*3);
  char1 = loadImage("sprite1.png");
  char1.resize(char1.width * 2, char1.height * 2);
}

PVector charOnePos = new PVector(50, 50);
 void draw()
 {
 image(img, 0, 0);
 image(char1, charOnePos.x, charOnePos.y);
 System.out.println(mouseX);
 System.out.print(mouseY);
 }
 
  void keyPressed() {
  if( key == CODED) {
    if(keyCode == UP) { charOnePos.add(0, -20);}
    if(keyCode == DOWN) { charOnePos.add(0,20); }
    if(keyCode == LEFT) { charOnePos.add(-20,0); }
    if(keyCode == RIGHT) { charOnePos.add(20,0); }
  }
  }
  
