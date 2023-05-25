import java.util.concurrent.TimeUnit;
PImage map;
PImage char1;
PImage menu;
PImage JakeSelect, BlankaSelect, LouisSelect;
boolean menuScreen = true;
boolean battle = false;
String selectedChar1 = "";
PVector Player1StartPos = new PVector(0, 0);
Characters charOne, charTwo;

// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  frameRate(60);
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);

  JakeSelect = loadImage("sprite1.png");
  JakeSelect.resize(JakeSelect.width * 2, JakeSelect.height * 2);
  
  BlankaSelect = loadImage("Screen_Shot_2023-05-25_at_12.47.21_PM-removebg-preview.png");
  BlankaSelect.resize(BlankaSelect.width / 2, BlankaSelect.height / 2);
 
}


// handle the drawing of the characters their attacks, and the ui
boolean charOneAttackState = false;
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
    image(BlankaSelect, 150, 10);
  }
  if (battle)
  {
    image(map, 0, 0);
    if (! charOneAttackState)
    {
      image(charOne.sprite, charOne.pos.x, charOne.pos.y);
    }
    if (charOneAttackState)
    {
      image(map, 0, 0);
      image(charOne.attack, charOne.pos.x, charOne.pos.y);
    }
  }
  }

// handle then control scheme
void keyPressed() {
  // movement
  menuScreen = false;  // press any key to move to character select screen
  if (battle)
  {
    // movement
    if ( key == CODED) {
      if (keyCode == UP) {
        if (587 - charOne.sprite.height < charOne.pos.y) // make this be respective to character height like the other ones
          charOne.pos.add(0, -20);
      }
      if (keyCode == DOWN) {
        if (height - charOne.sprite.height > charOne.pos.y)
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
    // attacks
    if (key == 'n')
    {
      charOneAttackState = true;
    }
  }
}

int curPlayerSelect = 1;
void mousePressed() // this will be used to detect which character is selected
{
  if ( ! (menuScreen || battle))
    if (curPlayerSelect == 1)
    {
      if (mouseX > 0 && mouseX < 256 && mouseY > 0 && mouseY < 256)
      {
        selectedChar1 = "Jake";
        charOne = new Jake(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        curPlayerSelect = 2;
        battle = true;
        scale(-1, 1);
      }
      if (mouseX > 155 && mouseX < 310 && mouseY > 0 && mouseY < 256)
      {
        selectedChar1 = "Blanka";
        charOne = new Blanka(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        curPlayerSelect = 2;
        battle = true;
        scale(-1, 1);
        
      }
      
    }
}
void keyReleased()
{
  if (key == 'n')
  {
    charOneAttackState = false;
  }
}
