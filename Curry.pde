public class Curry extends Characters
{
  public Curry()
  {
    super();
    speed = 65;
    hp = 100;
    damage = 20;
    stamina = 120;
    sprite = loadImage("Screen Shot 2023-05-30 at 12.52.15 PM.png");
    sprite.resize(sprite.width * 4 / 5, sprite.height * 4 / 5);
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize(attack.width * 4 / 5, attack.height * 4 / 5);
  }
  public Curry(PVector position)
  {
    super();
    speed = 65;
    hp = 100;
    damage = 20;
    stamina = 120;
    sprite = loadImage("Screen Shot 2023-05-30 at 12.52.15 PM.png");
    sprite.resize((sprite.width * 4) / 5, sprite.height * 4 / 5);
    pos = position;
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize((attack.width * 4) / 5, attack.height * 4 / 5);
  }
}
