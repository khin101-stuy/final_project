PImage map;
PImage char1;
PImage menu;
PImage Jake, Dave, Louis;
boolean menuScreen = true;
boolean battle = false;
String selectedChar1 = "";
// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);
  Jake = loadImage("sprite1.png");
  Jake.resize(Jake.width * 2, Jake.height * 2);
  if (selectedChar1.equals("Jake"))
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

  if (menuScreen == false && battle == false)    // handle character pos, attacks, ui
  {
    background(0, 0, 0);
    image(Jake, 30, 50);
    
    
  }
  if (battle)
  {
    image(map, 0, 0);
    image(char1, charOnePos.x, charOnePos.y);
  }
}

PVector charOnePos = new PVector(1012, 360);

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
      if (0 < charOnePos.x)  
      charOnePos.add(-20, 0);
    }
    if (keyCode == RIGHT) {
      if (width > charOnePos.x + Jake.width)
      charOnePos.add(20, 0);
    }
  }
}

int curPlayerSelect = 1;
void mousePressed() // this will be used to detect which character is selected
{
  if (curPlayerSelect == 1)
  {
  if (mouseX > 0 && mouseX < 256 && mouseY > 0 && mouseY < 256)
  {
    selectedChar1 = "Jake";
    curPlayerSelect = 2;
  }
  }
  
  
}
