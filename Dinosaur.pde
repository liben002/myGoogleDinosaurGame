public class Dinosaur implements Player {
  private PImage img;
  private int x;
  private int y;
  int imageCounter = 0;
  //Gravity and velocity simulate jumping and falling.
  float gravity = 0.05;
  float velocity = 0;
  float lift = -7;
  //Default Constructor.
  public Dinosaur() {
    this.x = 0;
    this.y = 0;
  }
  //Used Constructor.
  public Dinosaur(int x, int y) {
    this.x = x;
    this.y = y;
  }
  //Displays the Dinosaur. Image changes based on actions.
  public void display() {
    if (imageCounter == 0) {
      if (frameCount % 2 == 0) {
        img = loadImage("Dinosaur1.png");
        image(img, x-2, y);
      } else {
        img = loadImage("Dinosaur2.png");
        image(img, x, y+1);
      }
    } else if (imageCounter == 1) {
      
    }
  }
  //changes the Dinosaur's position and velocity. If the Dinosaur hits a boundary velocity is reset.
  public void update() {
    velocity += gravity;
    y += velocity;
    if (y > 110) {
      y = 110;
      velocity = 0;
    }
    if (y < 0) {
      y = 0;
      velocity = 0;
    }
  }
  //Dinosaur "jumps".
  public void jump() {
    velocity += lift;
    imageCounter = 0;
  }
  //Plays the voiceline of the tracker. 
  public void cry() {
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}