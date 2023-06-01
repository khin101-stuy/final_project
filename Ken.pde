public class Ken extends Characters
{
  public Ken()
  {
    super();
    speed = 1;  // default 20 walkspeed
    hp = 100.0;
    damage = 25;
    stamina = 100;
    sprite = loadImage("ken.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    attack = loadImage("Kenattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
    spriteMirror = loadImage("kenmirrored.png");
    spriteMirror.resize(spriteMirror.width * 3, spriteMirror.height * 3);
    attackMirror = loadImage("Kenattackmirrored.png");
    attackMirror.resize(attackMirror.width * 3, attackMirror.height * 3);
    mugshot = loadImage("kenmugshot.png");
  }
  public Ken(PVector position)
  {
    super();
    speed = 1;
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("ken.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    pos = position;
    attack = loadImage("Kenattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
    spriteMirror = loadImage("kenmirrored.png");
    spriteMirror.resize(spriteMirror.width * 3, spriteMirror.height * 3);
    attackMirror = loadImage("Kenattackmirrored.png");
    attackMirror.resize(attackMirror.width * 3, attackMirror.height * 3);
    mugshot = loadImage("kenmugshot.png");
  }
}
