//Migos Snake by AJ Tabura
//Snake Game inspired Anson Liang's Version

//Sound Declarations
PImage migos;
import processing.sound.*;
SoundFile stir;
SoundFile walk;
SoundFile drip;
SoundFile Grah;
SoundFile Skrt;
SoundFile SkrtSkrt;
SoundFile Splash;
SoundFile  Thotho;
SoundFile  Woowoo;
String StirFry= "StirFry.mp3";
String WalkIt= "Walk.mp3";
String dripdrip= "Drip.mp3";
String grah = "Grah.wav";
String skrt = "skrt.wav";
String skrtskrt= "skrtskrt.wav";
String splash = "splash.wav";
String thothotho = "thothotho.wav";
String woowoo = "woowoo.wav";
String path;
String path1;
String path2;
String GrahPath;
String SkrtPath;
String SkrtSkrtPath;
String SplashPath;
String thothothoPath;
String woowooPath;
int lim=0;
int adlib=0;

//Starting Text Declaration
boolean Migos=true;

//Gamplay Declarations
float speed = 100;
int x, y;

int moveonX = 0;
int moveonY = 0;
int snakeX = 0;
int snakeY = 0;
int foodX = -1;
int foodY = -1;
boolean check = true;
int []snakesX;
int []snakesY;
int snakeSize = 1;
int windowSize = 500;
boolean dead = false;
void setup() {
  //General Setup
  size(500, 500, P3D);
  background(0);
  
  //Sound Setup
  path = sketchPath(StirFry);
  path1 =sketchPath(WalkIt);
  path2=sketchPath(dripdrip);
  GrahPath =sketchPath(grah);
  SkrtPath = sketchPath(skrt);
  SkrtSkrtPath=sketchPath(skrtskrt);
  SplashPath=sketchPath(splash);
  thothothoPath =sketchPath(thothotho);
  woowooPath=sketchPath(woowoo);
  stir = new SoundFile(this, path);
  walk = new SoundFile(this, path1);
  drip = new SoundFile(this, path2);
  Grah= new SoundFile(this, GrahPath);
  Skrt= new SoundFile(this, SkrtPath);
  SkrtSkrt= new SoundFile(this, SkrtSkrtPath);
  Splash = new SoundFile(this, SplashPath);
  Thotho = new SoundFile(this, thothothoPath);
  Woowoo = new SoundFile(this, woowooPath);

//img setup
  migos = loadImage("migos8bit.jpg");

//gameplay setup
  speed = 100;
  speed=speed/frameRate;
  snakesX = new int[100];
  snakesY = new int[100];

  x = width/2;
  y = height/2;

  snakeX = x-5;
  snakeY = y-5;
  foodX = -1;
  foodY = -1;
  dead = false;
  check = true;
  snakeSize =1;
}

void draw() {

  if (speed%10 == 0) {
    background(0);
    runGame();
  }
  speed++;
  if (Migos) {
    textAlign(CENTER);
    textSize(50);
    text("MigosSnake", 250, 200);
  }
}
void reset() {
  //resets to original position and declarations
  snakeX = x-5;
  snakeY = y-5;
  dead = false;
  check = true;
  snakeSize =1; 
  moveonY = 0;
  moveonX = 0;
}
void runGame() {
  if (dead== false) {
//checks gamechanges
    drawfood();
    drawSnake();
    snakeMove();
    ateFood();
    checkHitSelf();
  } else {
    //endcard.
    String modelString = "Game Over";
    textAlign (CENTER);
    textSize(35);
    text(modelString, 250, 200);
    text("Your Score:" +snakeSize,250,400);
    text("Press r to reset", 250, 250);
    text("Press 1, 2, or 3 to listen to \n Migos Music", 250, 300);
    image(migos, 150, -50, 200, 200);
  }
}
void checkHitSelf() {
  for (int i = 1; i < snakeSize; i++) {
    if (snakeX == snakesX[i] && snakeY== snakesY[i]) {
      dead = true;
    }
  }
}
void ateFood() {
  if (foodX == snakeX && foodY == snakeY) {
    check = true;
    snakeSize++;
    int x = (int)random(6)+1;
    
    //the following if statements play a randomized Migos Adlib
    if (x==1) {
      adlib=0;
      while (adlib<1) {
        Grah.play();
        adlib=1;
      }
    }
    if (x==2) {
      adlib=0;
      while (adlib<1) {
        Skrt.play();
        adlib=1;
      }
    }
    if (x==3) {
      adlib=0;
      while (adlib<1) {
        SkrtSkrt.play();
        adlib=1;
      }
    }
    if (x==4) {
      adlib=0;
      while (adlib<1) {
        Splash.play();
        adlib=1;
      }
    }
    if (x==5) {
      adlib=0;
      while (adlib<1) {
        Thotho.play();
        adlib=1;
      }
    }
    if (x==6) {
      adlib=0;
      while (adlib<1) {
        Woowoo.play();
        adlib=1;
      }
    }
  }
}
void drawfood() {

  while (check) {
    int x = (int)random(1, windowSize/10);
    int y =  (int)random(1, windowSize/10);
    foodX = 5+x*10;
    foodY = 5+y*10;

    for (int i = 0; i < snakeSize; i++) {
      if (x == snakesX[i] && y == snakesY[i]) {
        check = true;
        i = snakeSize;
      } else {
        check = false;
      }
    }
  }

  rect(foodX-5, foodY-5, 10, 10);
}
void drawSnake() {

  for (int i = 0; i < snakeSize; i++) {
    int X = snakesX[i];
    int Y = snakesY[i];
    rect(X-5, Y-5, 10, 10);
  }

  for (int i = snakeSize; i > 0; i--) {
    snakesX[i] = snakesX[i-1];
    snakesY[i] = snakesY[i-1];
  }
}

void snakeMove() {
  snakeX += moveonX;
  snakeY += moveonY;
  if (snakeX > windowSize-5 || snakeX < 5||snakeY > windowSize-5||snakeY < 5) { 
    dead = true;
  }
  snakesX[0] = snakeX;
  snakesY[0] = snakeY;
}

void keyPressed() {
  if (keyCode == UP) {  
    if (snakesY[1] != snakesY[0]-10) {
      moveonY = -10; 
      moveonX = 0;
      Migos=false;
    }
  }
  if (keyCode == DOWN) {  
    if (snakesY[1] != snakesY[0]+10) {
      moveonY = 10; 
      moveonX = 0;
      Migos=false;
    }
  }
  if (keyCode == LEFT) { 
    if (snakesX[1] != snakesX[0]-10) {
      moveonX = -10; 
      moveonY = 0;
      Migos=false;
    }
  }
  if (keyCode == RIGHT) { 
    if (snakesX[1] != snakesX[0]+10) {
      moveonX = 10; 
      moveonY = 0;
      Migos=false;
    }
  }
  if (keyCode == 'R') {
    Migos=true;
    reset();
  }
  
  //Song selection
  if (key=='1') {
    stir.stop();
    walk.stop();
    drip.stop();
    lim=0;
    while (lim<1) {
      stir.play();
      lim=1;
    }
  }
  if (key=='2') {
    lim=0;
    stir.stop();
    walk.stop();
    drip.stop();
    while (lim<1) {
      walk.play();
      lim=1;
    }
  }
  if (key=='3') {
    lim=0;
    stir.stop();
    walk.stop();
    drip.stop();
    while (lim<1) {
      drip.play();
      lim=1;
    }    
    }
  }
