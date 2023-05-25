public class Blanka extends Characters
{
  public Blanka()
  {
    super();
    speed = 25;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
  public Blanka(PVector position)
  {
    super();
    speed = 25;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    pos = position;
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
}
