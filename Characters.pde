public class Characters
{
  public float speed;
  public int hp;
  public int damage;
  public int stamina;
  public PVector pos;
  public PImage sprite;
  public PImage attack;
  public Characters()
  {
    int speed;
    int hp;
    int damage;
    int stamina;
    int pos;
  }
  void moveLeft()
  {
    pos.add(-20 * speed, 0);
  }
  void moveRight()
  {
    pos.add(20 * speed, 0);
  }
  void moveUp()
  {
    if (587 - sprite.height - 20*speed  < pos.y -  20*speed)
      {
        pos.add(0, -20 * speed);
      }
  }
  void moveDown()
  {
    pos.add(0, 20 * speed);
  }
  
  
}
