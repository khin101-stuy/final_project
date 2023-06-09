public class Curry extends Characters
{
  public Curry()
  {
    super();
    speed = 2;
    hp = 100.0;
    damage = 15;
    sprite = loadImage("Screen Shot 2023-05-30 at 12.52.15 PM.png");
    sprite.resize(sprite.width * 4 / 5, sprite.height * 4 / 5);
    attack = loadImage("Screen Shot 2023-05-30 at 12.52.22 PM.png");
    attack.resize(attack.width * 4 / 5, attack.height * 4 / 5);
  }
  public Curry(PVector position)
  {
    super();
    speed = 2;
    hp = 100;
    damage = 15;
    sprite = loadImage("Screen Shot 2023-05-30 at 12.52.15 PM.png");
    sprite.resize((sprite.width * 4) / 5, sprite.height * 4 / 5);
    pos = position;
    attack = loadImage("Screen Shot 2023-05-30 at 12.52.22 PM.png");
    attack.resize((attack.width * 4) / 5, attack.height * 4 / 5);
  }
}
