public class Blanka extends Characters
//blanka is slower than jake, and has more attack power and more health points
{
  public Blanka()
  {
    super();
    speed = 0.6;
    hp = 125.0;
    damage = 27;
    sprite = loadImage("blanka.png");
    sprite.resize(sprite.width * 4 / 5, sprite.height * 4 / 5);
    attack = loadImage("blankattack.png");
    attack.resize(attack.width * 4 / 5, attack.height * 4 / 5);
    spriteMirror = loadImage("blankamirrored.png");
    spriteMirror.resize(spriteMirror.width * 4/5, spriteMirror.height * 4 / 5);
    mugshot = loadImage("blankamugshot.png");
  }
  public Blanka(PVector position)
  {
    super();
    speed = 0.6;
    hp = 125.0;
    damage = 27;
    sprite = loadImage("blanka.png");
    sprite.resize((sprite.width * 4) / 5, sprite.height * 4 / 5);
    pos = position;
    attack = loadImage("blankattack.png");
    attack.resize((attack.width * 4) / 5, attack.height * 4 / 5);
    spriteMirror = loadImage("blankamirrored.png");
    spriteMirror.resize(spriteMirror.width * 4/5, spriteMirror.height * 4 / 5);
    attackMirror = loadImage("blankattackmirrored.png");
    attackMirror.resize(attackMirror.width *4/5, spriteMirror.height);
    mugshot = loadImage("blankamugshot.png");
    winPose = loadImage("blankawinpose.png");
    winPose.resize(winPose.width*2, winPose.height*2);
  }
}
