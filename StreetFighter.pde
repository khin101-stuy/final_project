PImage map;
PImage char1;
PImage menu;
PImage JakeSelect, DaveSelect, LouisSelect;
boolean menuScreen = true;
boolean battle = false;
String selectedChar1 = "";
PVector Player1StartPos = new PVector (100, 360);
Characters charOne;

// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);

  JakeSelect = loadImage("sprite1.png");
  JakeSelect.resize(JakeSelect.width * 2, JakeSelect.height * 2);
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
    image(JakeSelect, 30, 50);
  }
  if (battle)
  {
    image(map, 0, 0);
    image(charOne.sprite, charOne.pos.x, charOne.pos.y);
  }
}

// handle th eocntrol scheme
void keyPressed() {
  // movement
  menuScreen = false;  // press any key to move to character select screen
  if (battle)
  {
    if ( key == CODED) {
      if (keyCode == UP) {
        if (350 < charOne.pos.y)
          charOne.pos.add(0, -20);
      }
      if (keyCode == DOWN) {
        if (464 > charOne.pos.y)
        {
          charOne.pos.add(0, 20);
        }
      }
      if (keyCode == LEFT) {
         if (0 < charOne.pos.x)
          charOne.pos.add(-20, 0);
      }
      if (keyCode == RIGHT) {
        if (width > charOne.pos.x + charOne.sprite.width)
          charOne.pos.add(20, 0);
      }
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
      charOne = new Jake(Player1StartPos);
      curPlayerSelect = 2;
      battle = true;
    }
  }
}
