PImage img;
PImage char1;
PImage menu;
boolean menuScreen = true;
boolean battle = false;
String selectedChar = "";
// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  img = loadImage("map.png");
  img.resize(384*3, 224*3);
  char1 = loadImage("sprite1.png");
  char1.resize(char1.width * 2, char1.height * 2);
  if (selectedChar.equals("Jake"))
  {
   Jake charOne = new Jake();
  }
}


// handle the drawing of the characters their attacks, and the ui
void draw()
{
  System.out.println("x-cord:" + mouseX + " " + "y-cord:" + mouseY); // debug cords
  if (menuScreen == true)
  {
    
    image(menu, 0, 0);
    textSize(100);
    text("Press any key!", width/4, 600);
  }

  if (menuScreen == false)    // handle character pos, attacks, ui
  {
    image(img, 0, 0);
    image(char1, charOnePos.x, charOnePos.y);
  }
}

PVector charOnePos = new PVector(50, 50);

// handle th eocntrol scheme
void keyPressed() {
  // movement
  menuScreen = false;  // press any key to move to character select screen
 
  if ( key == CODED) {
    if (keyCode == UP) {
      if (350 < charOnePos.y)  
      charOnePos.add(0, -20);
    }
    if (keyCode == DOWN) {
      if (464 > charOnePos.y)  
      {
      charOnePos.add(0, 20);
      }
    }
    if (keyCode == LEFT) {
      charOnePos.add(-20, 0);
    }
    if (keyCode == RIGHT) {
      charOnePos.add(20, 0);
    }
  }
}


void mousePressed() // this will be used to detect which character is selected
{
  if (mouseX > 30 && mouseX < 100 && mouseY > 50 && mouseY < 100)
  {
    selectedChar = "Jake";
  }
  
  
}
