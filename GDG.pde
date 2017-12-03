/* @pjs preload="Clevergirl.png","Cloud.png","Dino2.png","Dinosaur1.png","Dinosaur2.png","endGame.png","Goldblum.png","JurassicPark8bit.mp3","Newman.png","Title.png","welcome.png","JurassicPark.mp3","bing.png","Jump.mp3"; */
/* Driver class for the Google Dinosaur Game. Name is tentative. 
   Game created by Benjamin Li. Took some time. All sprites and images found on Google Images.
   No C++ reference this time unfortunately. 
   Warning: Game contains audio. In fact, there are two main theme mp3s that can be used, either a regular or 8-bit version.
   Press SPACE to start, w to jump, ESC to exit, and p to pause.
   Have some relevant ASCII art.
                                                     ____
       ___                                      .-~. /_"-._
      `-._~-.                                  / /_ "~o\  :Y
          \  \                                / : \~x.  ` ')
           ]  Y                              /  |  Y< ~-.__j
          /   !                        _.--~T : l  l<  /.-~
         /   /                 ____.--~ .   ` l /~\ \<|Y
        /   /             .-~~"        /| .    ',-~\ \L|
       /   /             /     .^   \ Y~Y \.^>/l_   "--'
      /   Y           .-"(  .  l__  j_j l_/ /~_.-~    .
     Y    l          /    \  )    ~~~." / `/"~ / \.__/l_
     |     \     _.-"      ~-{__     l  :  l._Z~-.___.--~
     |      ~---~           /   ~~"---\_  ' __[>
     l  .                _.^   ___     _>-y~
      \  \     .      .-~   .-~   ~>--"  /
       \  ~---"            /     ./  _.-'
        "-.,_____.,_  _.--~\     _.-~
                    ~~     (   _}       
                           `. ~(
                             )  \
                            /,`--'~\--'~\
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Actual code starts on line after next. */

//Imports and allows use of audio files.
import ddf.minim.*;
AudioPlayer audioPlayer;
AudioPlayer audioPlayer1;
Minim minim;
Minim minim1;
private PImage bg;
Player player = new Goldblum(100,90);
Player tracker = new Dinosaur(10,90);
//Stages are set with 0 = title, 1 = gameState, 2 = endGame.
private int stage = 0;
private int score;
float obstacleSpeed;
float obstacleSpeedModifier;
boolean noLoop;
//ArrayList that contains all the obstacles in view.
ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>();
//ArrayList that contains all the scenery in view.
ArrayList<Scenery> scenery = new ArrayList<Scenery>();
//144 Hz baby
void setup() {
  frameRate(144);
  size(1000,200);
  //delay(2000);
  //Plays the intro.
  minim = new Minim(this);
  audioPlayer = minim.loadFile("welcome.mp3");
  audioPlayer.play();
  //Plays the Jurassic Park Theme.
  minim = new Minim(this);
  audioPlayer = minim.loadFile("JurassicPark8bit.mp3");
  audioPlayer.play();
}
void draw() {
  //Title.
  if (stage == 0) {
    bg = loadImage("Title.png");
    background(bg);
  //gameState.
  } else if (stage == 1) { 
    background(210);
    fill(#808080);
    rect(0,170,1000,2);
    player.update();
    tracker.update();
    player.display();
    tracker.display();
    //Every two seconds, an obstacle is created at random.
    if (frameCount % 244 == 0) {
      int obstacle = (int)random(0,3);
      obstacleSpeed = random(3 + obstacleSpeedModifier,5 + obstacleSpeedModifier);
      if (obstacle == 0) {
        obstacles.add(new Newman(950,100,obstacleSpeed));
        obstacleSpeedModifier += 0.3;
      } else if (obstacle == 1) {
        obstacles.add(new Clevergirl(950,100,obstacleSpeed));
        obstacleSpeedModifier += 0.6;
      } else if (obstacle == 2) {
        obstacles.add(new Bing(950,100,obstacleSpeed));
        obstacleSpeedModifier += 0.55;
      }
    }
    //Every three seconds, a cloud is created at a random y position.
    if (frameCount % 432 == 0) {
      scenery.add(new Cloud(1000, (int)random(0,41)));
    }
    //Every 1/12 of a second, a rock is created at a random y position.
    if (frameCount % 12 == 0) {
      scenery.add(new Ground(1000, (int)random(170, 201), (int)random(1,5)));
    }
    //Displays and updates each scenery.
    for (Scenery scenery : scenery) {
      scenery.display();
      scenery.update();
    }
    //Displays and updates each obstacle.
    for (Obstacles obstacle : obstacles) {
      obstacle.display();
      obstacle.update();
    }
    gameOver();
    delete(); 
    score++;
    System.out.println("Full Run");
    textSize(24);
    text("SCORE: " + score, 820, 40);
  }
  //Displays the end game screen.
  if (stage == 2) {
    bg = loadImage("endGame.png");
    background(bg);
  }
}
//Shows the game over screen when player touches obstacle.
void gameOver() {
  for (Obstacles obstacle : obstacles) {
    if ((player.getY() + 78 > obstacle.getY() && player.getY() + 78 < obstacle.getY() + 78) && (player.getX() + 70 > obstacle.getX() + 20 && player.getX() + 70 < obstacle.getX() + 70)) {
      stage = 2;
    }
  }
}
//If the obstacle is past the screen, remove from ArrayList.
void delete() {
  for (int index=0; index < obstacles.size()-1; index++) {
    if (obstacles.get(index).getX() <= 30) {
      obstacles.remove(index);
      index--;
    }
  }
  for (int index=0; index < scenery.size()-1; index++) {
    if (scenery.get(index).getX() <= 0) {
      scenery.remove(index);
      index--;
    }
  }
  System.out.print(obstacles);
  System.out.print(scenery);
}
//Does actions based on what key is pressed.
void keyPressed() {
  //Player and tracker jump if w is pressed.
  if (key == 'w') {
    //System.out.println("w");
    player.jump();
    player.cry();
    tracker.jump();
  }
  //Goes to the game screen if SPACE is pressed.
  if (key == ' ') {
    stage = 1;
    player.jump();
    player.cry();
    tracker.jump();
  }
  //Exits the sketch if ESC is pressed.
  if (keyCode == ESC) {
    exit();
  }
  //Pauses the game is p is pressed.
  if (key == 'p') {
    if (noLoop == false) {
      noLoop = true;
      noLoop();
    } else {
      noLoop = false;
      loop();
    }
  }
}