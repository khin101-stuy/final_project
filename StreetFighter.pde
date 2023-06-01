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
int charOnePoints;
int charTwoPoints;
int charOneOgHP = 0;
int charTwoOgHP = 0;
Characters charOne, charTwo;

// handle the loading of sprites and backgrounds and what characters to be selected
void setup()
{
  curPlayerSelect = 1;
  frameRate(60);
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);

  KenSelect = loadImage("ken.png");
  KenSelect.resize(KenSelect.width * 2, KenSelect.height * 2);

  BlankaSelect = loadImage("blanka.png");
  BlankaSelect.resize(BlankaSelect.width / 2, BlankaSelect.height / 2);
}


// handle the drawing of the characters their attacks, and the ui
boolean charOneAttackState = false;
boolean charTwoAttackState = false;
long charOneNextAvaliable = 0;
long charTwoNextAvaliable = 0;
void draw()
{
  long curTime = System.currentTimeMillis();
  //  System.out.println("x-cord:" + mouseX + " " + "y-cord:" + mouseY); // debug cords
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
    //if (! charOneAttackState )
    //{
    //  image(charOne.sprite, charOne.pos.x, charOne.pos.y);
    //}
    if (charOneAttackState && curTime >= charOneNextAvaliable)
    {
      image(map, 0, 0);
      image(charOne.attack, charOne.pos.x, charOne.pos.y);
      charOneNextAvaliable = curTime + 625;
      if (charOne.pos.x + charOne.attack.width >= charTwo.pos.x)
      {
        charTwo.hp += (-1 * charOne.damage);
        System.out.println("Player Two HP:" + charTwo.hp);
      }
    } else
    {
      if (curTime < charOneNextAvaliable - 500)
      {
        image(charOne.attack, charOne.pos.x, charOne.pos.y);
      } else
        image(charOne.sprite, charOne.pos.x, charOne.pos.y);
    }

    if (charTwoAttackState && curTime >= charTwoNextAvaliable)
    {
      image(charTwo.attack, charTwo.pos.x, charTwo.pos.y);
      charTwoNextAvaliable = curTime + 625;
      if (charTwo.pos.x + charTwo.attack.width >= charTwo.pos.x)
      {
        charOne.hp += (-1 * charTwo.damage);
        System.out.println("Player One HP:" + charOne.hp);
      }
    } else
    {
      if (curTime < charTwoNextAvaliable - 500)
      {
        image(charTwo.attack, charTwo.pos.x, charTwo.pos.y);
      } else
        image(charTwo.spriteMirror, charTwo.pos.x, charTwo.pos.y);

      // hp triggers
      if (charOne.hp <= 0)
      {
        charTwoPoints += 1;
        charOne.pos.set(0, 587 - charOne.sprite.height);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        charOne.hp = charOneOgHP;
        charTwo.hp = charTwoOgHP;
      }
      if (charTwo.hp <= 0)
      {
        charOnePoints += 1;
        charOne.pos.set(0, 587 - charOne.sprite.height);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        charOne.hp = charOneOgHP;
        charTwo.hp = charTwoOgHP;
      }
    }
    if (charOnePoints == 3)
    {
      // win code here
    }
    if (charTwoPoints == 3)
    {
      // win code here
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

    if (key == '.')
    {
      charTwoAttackState = true;
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
        charOneOgHP = charOne.hp;
        curPlayerSelect = 2;
      }
      if (mouseX > 155 && mouseX < 310 && mouseY > 0 && mouseY < 256)
      {
        selectedChar1 = "Blanka";
        charOne = new Blanka(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        curPlayerSelect = 2;
        charOneOgHP = charOne.hp;
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
        charTwoOgHP = charTwo.hp;
        battle = true;
      }
      if (mouseX > 155 && mouseX < 310 && mouseY > 0 && mouseY < 256 && noDupeSelect)
      {
        noDupeSelect  = false;
        selectedChar2 = "Blanka";
        charTwo = new Blanka(Player2StartPos);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        charTwoOgHP = charTwo.hp;
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
  if (key == '.')
  {
    charTwoAttackState = false;
  }
}
