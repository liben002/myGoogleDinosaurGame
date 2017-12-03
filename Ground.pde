public class Ground implements Scenery {
  private int x;
  private int y;
  private int length;
  public Ground(int x, int y, int length) {
    this.x = x;
    this.y = y;
    this.length = length;
  }
  //Displays the scenery.
  public void display() {
    fill(#808080);
    rect(x, y, length, 1);
  }
  //Moves the scenery.
  public void update() {
    x -= 6;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}