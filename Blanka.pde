public class Blanka extends Characters
{
  public Blanka()
  {
    super();
    speed = 25;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("Screen_Shot_2023-05-25_at_12.47.21_PM-removebg-preview.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
  public Blanka(PVector position)
  {
    super();
    speed = 25;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("Screen_Shot_2023-05-25_at_12.47.21_PM-removebg-preview.png");
    sprite.resize(sprite.width * 3, sprite.height * 3);
    pos = position;
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize(attack.width * 3, attack.height * 3);
  }
}
