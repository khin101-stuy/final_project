import java.util.concurrent.TimeUnit;
import processing.sound.*;
PImage map;
PImage char1;
PImage menu;
PImage endScreen;
PImage KenSelect, BlankaSelect, idkSelect;
boolean menuScreen = true;
boolean battle = false;
String selectedChar1 = "";
String selectedChar2 = "";
PVector Player1StartPos = new PVector(0, 0);
PVector Player2StartPos = new PVector(0, 0);
int charOnePoints;
int charTwoPoints;
float charOneOgHP = 0;
float charTwoOgHP = 0;

Characters charOne, charTwo;
SoundFile selectionAudio;
SoundFile battleAudio;
SoundFile curAudio;
SoundFile attackAudio;
SoundFile impact;
// handle the loading of sprites and backgrounds and what characters to be selected
PFont font;
void setup()
{
  font =  createFont("Act_Of_Rejection.ttf", 100);
  textFont(font);
  curPlayerSelect = 1;
  frameRate(60);
  size(384*3, 224*3);
  menu = loadImage("menu.png");
  menu.resize(384*3, 224*3);
  map = loadImage("map.png");
  map.resize(384*3, 224*3);
  endScreen = loadImage("menublur.png");
  endScreen.resize(384*3, 224*3);
  KenSelect = loadImage("ken.png");
  KenSelect.resize(KenSelect.width * 4, KenSelect.height * 4);
  BlankaSelect = loadImage("blanka.png");
  BlankaSelect.resize(BlankaSelect.width, BlankaSelect.height);
  selectionAudio =  new SoundFile(this, "charselectaudio.mp3");
  battleAudio = new SoundFile(this, "battleaudio.mp3");
  battleAudio.amp(0.7);
  attackAudio = new SoundFile(this, "attackaudio.wav");
  impact = new SoundFile(this, "impact.wav");
}
SoundFile temp;
void playAudio()
{
  if (! (temp == curAudio))
  {
    if (temp != null)
    {
      temp.stop();
    }
    curAudio.loop();
    temp = curAudio;
  }
}

// handle the drawing of the characters their attacks, and the ui
boolean charOneAttackState = false;
boolean charTwoAttackState = false;
long charOneNextAvaliable = 0;
long charTwoNextAvaliable = 0;
long charOneAnimationTime = 0;
long charTwoAnimationTime = 0;
void draw()
{
  long curTime = System.currentTimeMillis();
   System.out.println("x-cord:" + mouseX + " " + "y-cord:" + mouseY); // debug cords
  if (menuScreen == true)
  {
    playAudio();
    image(menu, 0, 0);
    textSize(100);
    text("Press any key!", width/4, 600);
  }

  if (menuScreen == false && battle == false)    // handle character pos, attacks, ui
  {
    curAudio = selectionAudio;
    playAudio();
    background(0, 0, 0);
    image(KenSelect, 30, 405-KenSelect.height);
    image(BlankaSelect, 300, 405-BlankaSelect.height);
    text("Choose your character!", width/8, 600);
  }
  if (battle)
  {
    curAudio = battleAudio;
    playAudio();
    image(map, 0, 0);
    fill(0, 255, 0);
    rect(0, 20,  400 * (charOne.hp / charOneOgHP), 20);
    rect(1152 - (400 * (charTwo.hp / charTwoOgHP)), 20, 400 * (charTwo.hp / charTwoOgHP), 20);
    
    if (charOneAttackState && curTime >= charOneNextAvaliable)
    {
      attackAudio.play();
      image(charOne.attack, charOne.pos.x, charOne.pos.y);
      charOneNextAvaliable = curTime + (long)(625 * (1.0/ charOne.speed));
      charOneAnimationTime = curTime + 175;
      if (charOne.pos.x + charOne.attack.width >= charTwo.pos.x  && charOne.pos.x  <= charTwo.pos.x )
      {
        impact.play();
        charTwo.hp += (-1 * charOne.damage);
        System.out.println("Player Two HP:" + charTwo.hp);
      }
    } else
    {
      if (curTime < charOneAnimationTime)
      {
        image(charOne.attack, charOne.pos.x, charOne.pos.y);
      } else
        image(charOne.sprite, charOne.pos.x, charOne.pos.y);
    }

    if (charTwoAttackState && curTime >= charTwoNextAvaliable)
    {
      attackAudio.play();
      image(charTwo.attackMirror, charTwo.pos.x - (charTwo.attack.width - charTwo.sprite.width), charTwo.pos.y);
      charTwoNextAvaliable = curTime + (long)(625 * (1.0/ charTwo.speed));
      charTwoAnimationTime = curTime + 175;
      if (charTwo.pos.x - (charTwo.attack.width - charTwo.sprite.width) <= charOne.pos.x + charOne.sprite.width && charTwo.pos.x  >= charOne.pos.x)
      {
        impact.play();
        charOne.hp += (-1 * charTwo.damage);
        System.out.println("Player One HP:" + charOne.hp);
      }
    } else
    {
      if (curTime < charTwoAnimationTime)
      {
        image(charTwo.attackMirror, charTwo.pos.x - (charTwo.attack.width - charTwo.sprite.width), charTwo.pos.y);
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
      // display score
      fill(255,165,0);
      textSize(100);
      text(charOnePoints, 465, 80);
      text(charTwoPoints, 665, 80);
    }
    if (charOnePoints == 3)
    {
      image(endScreen, 0, 0);
      text("P1 WINS", width/2-150,height/2);
      image(charOne.winPose, width/2, height/2 + 50);
    }
    if (charTwoPoints == 3)
    {
      image(endScreen, 0, 0);
      text("P2 WINS", width/2-100,height/2);
      image(charTwo.winPose, width/2, height/2 + 50);
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
      if (mouseX >= 39 && mouseX < 180 && mouseY > 86 && mouseY < 404)
      {
        selectedChar1 = "Ken";
        charOne = new Ken(Player1StartPos);
        charOne.pos.set(0, 587 - charOne.sprite.height);
        charOneOgHP = charOne.hp;
        curPlayerSelect = 2;
      }
      if (mouseX > 303 && mouseX < 533 && mouseY > 45 && mouseY < 404)
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
      if (mouseX >= 39 && mouseX < 180 && mouseY > 86 && mouseY < 404 && noDupeSelect)
      {
        noDupeSelect  = false;
        selectedChar2 = "Ken";
        charTwo = new Ken(Player2StartPos);
        charTwo.pos.set(width - charTwo.sprite.width, 587 - charTwo.sprite.height);
        charTwoOgHP = charTwo.hp;
        battle = true;
      }
      if (mouseX > 303 && mouseX < 533 && mouseY > 45 && mouseY < 404 && noDupeSelect)
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
