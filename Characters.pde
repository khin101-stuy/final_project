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
    if (0 < pos.x - 15*speed/frameRate)
    pos.add(-15 * speed, 0);
  }
  void moveRight()
  {
    if (width > pos.x + sprite.width + 15*speed/frameRate)
    pos.add(15 * speed, 0);
  }
  void moveUp()
  {
    if (587 - sprite.height  < pos.y -  15*speed / frameRate)
      {
        pos.add(0, -15 * speed);
      }
  }
  void moveDown()
  {
    if (height - sprite.height > pos.y + 15*speed / frameRate)
     {
        pos.add(0, 15 * speed);
     }
  }
  
  
}
