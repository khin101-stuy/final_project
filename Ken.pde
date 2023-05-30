public class Ken extends Characters
{
  public Ken()
  {
    super();
    speed = 1;  // default 20 walkspeed
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    attack = loadImage("Kenattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
  public Ken(PVector position)
  {
    super();
    speed = 1;
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    pos = position;
    attack = loadImage("Kenattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
}
