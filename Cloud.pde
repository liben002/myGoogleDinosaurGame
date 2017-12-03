public class Cloud implements Scenery {
  private PImage img;
  private int x;
  private int y;
  //Default Constructor.
  public Cloud() {
    this.x = 0;
    this.y = 0;
  }
  //Used Constructor.
  public Cloud(int x, int y) {
    this.x = x;
    this.y = y;
  }
  //Displays the scenery.
  public void display() {
    img = loadImage("Cloud.png");
    image(img, x, y);
  }
  //Moves the scenery.
  public void update() {
    x -= 3;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}