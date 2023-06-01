public class Blanka extends Characters
{
  public Blanka()
  {
    super();
    speed = 0.7;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("blanka.png");
    sprite.resize(sprite.width * 4 / 5, sprite.height * 4 / 5);
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize(attack.width * 4 / 5, attack.height * 4 / 5);
  }
  public Blanka(PVector position)
  {
    super();
    speed = 0.7;
    hp = 200;
    damage = 40;
    stamina = 75;
    sprite = loadImage("blanka.png");
    sprite.resize((sprite.width * 4) / 5, sprite.height * 4 / 5);
    pos = position;
    attack = loadImage("Screen_Shot_2023-05-25_at_12.47.46_PM-removebg-preview.png");
    attack.resize((attack.width * 4) / 5, attack.height * 4 / 5);
  }
}
