public class Bing implements Obstacles {
  private PImage img;
  private int x;
  private int y;
  private float speed;
  int imageCounter = 0;
  //Default Constructor.
  public Bing() {
    this.x = 0;
    this.y = 0;
    this.speed = 0;
  }
  //Used Constructor.
  public Bing(int x, int y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  //Displays the obstacle. Image changes based on actions.
  public void display(){
    if (imageCounter == 0) {
      img = loadImage("bing.png");
      image(img, x, y);
    } else if (imageCounter == 1) {
      
    }
  }
  //Moves the obstacle.
  public void update() {
      x -= speed;
  }
  //Plays the voiceline of the obstacle.
  public void cry() {
    
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}
  