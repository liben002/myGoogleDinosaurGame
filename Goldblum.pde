public class Goldblum implements Player {
  private PImage img;
  private int x;
  private int y;
  int imageCounter = 0;
  //Gravity and velocity simulate jumping and falling.
  float gravity = 0.1;
  float velocity = 0;
  float lift = -7;
  //Default Constructor.
  public Goldblum() {
    this.x = 0;
    this.y = 0;
  }
  //Used Constructor.
  public Goldblum(int x, int y) {
    this.x = x;
    this.y = y;
  }
  //Displays the player. Image changes based on actions.
  public void display() {
    if (imageCounter == 0) {
      if (frameCount % 2 == 0) {
        img = loadImage("Goldblum.png");
        image(img, x, y);
      } else {
        img = loadImage("Goldblum.png");
        image(img, x, y);
      }
    } else if (imageCounter == 1) {
      
    }
  }
  //changes the player's position and velocity. If the player hits a boundary velocity is reset.
  public void update() {
    //System.out.println(velocity);
    velocity += gravity;
    y += velocity;
    if (y > 90) {
      y = 90;
      velocity = 0;
    }
    if (y < 0) {
      y = 0;
      velocity = 0;
    }
  }
  //Player "jumps".
  public void jump() {
    velocity += lift;
    //System.out.println(velocity);
    imageCounter = 0;
  }
  //Plays the voiceline of the player.
  public void cry() {
    minim1 = new Minim(this);
    audioPlayer1 = minim.loadFile("Jump.mp3");
    audioPlayer1.play();
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}