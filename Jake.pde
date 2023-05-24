public class Jake extends Characters
{
  public Jake()
  {
    super();
    speed = 50;
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 2, sprite.height * 2);
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 2, attack.width * 2);
  }
  public Jake(PVector position)
  {
    super();
    speed = 50;
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 2, sprite.height * 2);
    pos = position;
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 2, attack.width * 2);
  }
}
