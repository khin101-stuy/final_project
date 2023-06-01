public class Characters
{
  public float speed;
  public float hp;
  public int damage;
  public int stamina;
  public PVector pos;
  public PImage sprite;
  public PImage spriteMirror;
  public PImage attack;
  public PImage attackMirror;
  public PImage mugshot;
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
    if (0 < pos.x - 7.5*speed/frameRate)
    pos.add(-7.5 * speed, 0);
  }
  void moveRight()
  {
    if (width > pos.x + sprite.width + 7.5*speed/frameRate)
    pos.add(7.5 * speed, 0);
  }
  void moveUp()
  {
    if (587 - sprite.height  < pos.y -  7.5*speed / frameRate)
      {
        pos.add(0, -7.5 * speed);
      }
  }
  void moveDown()
  {
    if (height - sprite.height > pos.y + 7.5*speed / frameRate)
     {
        pos.add(0, 7.5 * speed);
     }
  }
  
  
}
