import java.util.concurrent.TimeUnit;
PImage map;
PImage char1;
PImage menu;
PImage KenSelect, BlankaSelect, idkSelect;
boolean menuScreen = true;
boolean battle = false;
String selectedChar1 = "";
String selectedChar2 = "";
PVector Player1StartPos = new PVector(0, 0);
PVector Player2StartPos = new PVector(0, 0);
Characters charOne, charTwo;

// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  curPlayerSelect = 1;
  frameRate(30);
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);

  KenSelect = loadImage("sprite1.png");
  KenSelect.resize(KenSelect.width * 2, KenSelect.height * 2);

  BlankaSelect = loadImage("Screen_Shot_2023-05-25_at_12.47.21_PM-removebg-preview.png");
  BlankaSelect.resize(BlankaSelect.width / 2, BlankaSelect.height / 2);
}


// handle the drawing of the characters their attacks, and the ui
boolean charOneAttackState = false;
boolean charTwoAttackState = false;
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
    rect(20, 195-KenSelect.height, KenSelect.width + 20, KenSelect.height+20);
    image(KenSelect, 30, 205-KenSelect.height);
    image(BlankaSelect, 200, 205-BlankaSelect.height);
    text("Choose your character!", width/8, 600);
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
    if (! charTwoAttackState)
    {
      image(charTwo.sprite, charTwo.pos.x, charTwo.pos.y);
    }
    if (charTwoAttackState)
    {
      image(map, 0, 0);
      image(charTwo.attack, charTwo.pos.x, charTwo.pos.y);
    }

    // movement vector handling
    if (a)
    {
      charOne.moveLeft();
    }
    if (s)
    {
      charOne.moveDown();
    }
    if (w)
    {
      charOne.moveUp();
    }
    if (d)
    {
      charOne.moveRight();
    }

    if (up)
    {
      charTwo.moveUp();
    }
    if (down)
    {
      charTwo.moveDown();
    }
    if (left)
    {
      charTwo.moveLeft();
    }
    if (right)
    {
      charTwo.moveRight();
    }
  }
}

// handle then control scheme
Boolean left = false, right = false, up = false, down = false, w = false, s = false, a = false, d = false;
void keyPressed() {
  // movement states
  menuScreen = false;  // press any key to move to character select screen
  if (battle)
  {

    // movement
    if (key == 'W' || key == 'w') {
      w = true;
    }
    if (key == 'S' || key == 's') {
      s = true;
    }
    if (key == 'A' || key == 'a') {

      a = true;
    }
    if (key == 'D' || key == 'd') {

      d = true;
    }
    // plyr2 controls
    if ( key == CODED) {
      if (keyCode == UP) {

        up = true;
      }
      if (keyCode == DOWN) {


        down = true;
      }
      if (keyCode == LEFT) {

        left = true;
      }
      if (keyCode == RIGHT) {

        right = true;
      }
    }


    // attacks
    if (key == 'q')
    {
      charOneAttackState = true;
    }
  }
}

int curPlayerSelect = 1;
void mousePressed() // this will be used to detect which character is selected
{
  if ( ! (menuScreen || battle))
  {
    if (curPlayerSelect == 1)
    {
      if (mouseX > 0 && mouseX < 256 && mouseY > 0 && mouseY < 256)
      {
        selectedChar1 = "Ken";
        charOne = new Ken(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        curPlayerSelect = 2;
      }
      if (mouseX > 155 && mouseX < 310 && mouseY > 0 && mouseY < 256)
      {
        selectedChar1 = "Blanka";
        charOne = new Blanka(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        curPlayerSelect = 2;
      }
    }
    if (curPlayerSelect == 2)
    {
      if (mouseX > 0 && mouseX < 256 && mouseY > 0 && mouseY < 256 && noDupeSelect)
      {
        noDupeSelect  = false;
        selectedChar2 = "Ken";
        charTwo = new Ken(Player2StartPos);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        battle = true;
      }
      if (mouseX > 155 && mouseX < 310 && mouseY > 0 && mouseY < 256 && noDupeSelect)
      {
        noDupeSelect  = false;
        selectedChar2 = "Blanka";
        charTwo = new Blanka(Player2StartPos);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        battle = true;
      }
    }
  }
}
boolean noDupeSelect = false;
void mouseReleased()
{
  if (curPlayerSelect == 2)
  {
    noDupeSelect = true;
  }
}
void keyReleased()
{
  if (key == 'W' || key == 'w') {
    w = false;
  }
  if (key == 'S' || key == 's') {
    s = false;
  }
  if (key == 'A' || key == 'a') {
    a = false;
  }
  if (key == 'D' || key == 'd') {
    d = false;
  }
  if ( key == CODED) {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {

      {
        down = false;
      }
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
  }

  if (key == 'q')
  {
    charOneAttackState = false;
  }
}
