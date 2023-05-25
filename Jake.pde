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
    sprite.resize(sprite.width * 3, sprite.height * 3);
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
  public Jake(PVector position)
  {
    super();
    speed = 50;
    hp = 100;
    damage = 25;
    stamina = 100;
    sprite = loadImage("sprite1.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    pos = position;
    attack = loadImage("Jakeattack.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
}
