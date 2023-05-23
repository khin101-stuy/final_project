PImage img;
PImage char1;
PImage menu;
boolean charSelect = true;
boolean battle = false;
void setup()
{
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  img = loadImage("map.png");
  img.resize(384*3, 224*3);
  char1 = loadImage("sprite1.png");
  char1.resize(char1.width * 2, char1.height * 2);
}

PVector charOnePos = new PVector(50, 50);

void draw()
{
  System.out.println("x-cord:" + mouseX + " " + "y-cord:" + mouseY);
  if (charSelect == true)
  {
    
    image(menu, 0, 0);
    textSize(100);
    text("Press any key!", width/4, 600);
  }

  if (charSelect == false)
  {
    image(img, 0, 0);
    image(char1, charOnePos.x, charOnePos.y);
  }
}

void keyPressed() {
  charSelect = false;
  if ( key == CODED) {
    if (keyCode == UP) {
      charOnePos.add(0, -20);
    }
    if (keyCode == DOWN) {
      charOnePos.add(0, 20);
    }
    if (keyCode == LEFT) {
      charOnePos.add(-20, 0);
    }
    if (keyCode == RIGHT) {
      charOnePos.add(20, 0);
    }
  }
}
