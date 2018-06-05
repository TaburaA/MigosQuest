//Sound Setup
import processing.sound.*;
SoundFile stir;
SoundFile walk;
SoundFile drip;
String StirFry= "StirFry.mp3";
String WalkIt= "Walk.mp3";
String dripdrip= "Drip.mp3";
String path;
String path1;
String path2;
int lim=0;

boolean Migos=true;


float speed = 100;
int cx, cy;

int moveX = 0;
int moveY = 0;
int snakeX = 0;
int snakeY = 0;
int foodX = -1;
int foodY = -1;
boolean check = true;
int []snakesX;
int []snakesY;
int snakeSize = 1;
int windowSize = 720;
boolean gameOver = false;
void setup() {
  size(720, 720, P3D);
  background(0);
    path = sketchPath(StirFry);
  path1 =sketchPath(WalkIt);
  path2=sketchPath(dripdrip);
  stir = new SoundFile(this, path);
  walk = new SoundFile(this,path1);
  drip = new SoundFile(this,path2);

  speed = 100;
  speed=speed/frameRate;
  snakesX = new int[100];
  snakesY = new int[100];

  cx = width/2;
  cy = height/2;

  snakeX = cx-5;
  snakeY = cy-5;
  foodX = -1;
  foodY = -1;
  gameOver = false;
  check = true;
  snakeSize =1;
}

void draw() {

  if (speed%10 == 0) {
    background(0);
    runGame();
  }
  speed++;
  if(Migos){
   textSize(50);
   text("MigosSnake",215,200);
  }
}
void reset() {
  snakeX = cx-5;
  snakeY = cy-5;
  gameOver = false;
  check = true;
  snakeSize =1; 
  moveY = 0;
  moveX = 0;
}
void runGame() {
  if (gameOver== false) {

    drawfood();
    drawSnake();
    snakeMove();
    ateFood();
    checkHitSelf();
  } else {
    String modelString = "Game Over";
    textAlign (CENTER);
    textSize(50);
    text(modelString, 350, 200);
    text("Press r to reset",350,250);
    text("Press 1,2,3 to listen to \n Migos Music",350,300);
  }
}
void checkHitSelf() {
  for (int i = 1; i < snakeSize; i++) {
    if (snakeX == snakesX[i] && snakeY== snakesY[i]) {
      gameOver = true;
    }
  }
}
void ateFood() {
  if (foodX == snakeX && foodY == snakeY) {
    check = true;
    snakeSize++;
    int x = (int)random(6)+1;
    if(x==1){
      rect(500,500,500,500);
    }
    if(x==2){
      ellipse(500,500,500,500);
    }
    if(x==3){
    }
    if(x==4){
      
    }
    if(x==5){
      
    }
    if(x==6){
      
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
  snakeX += moveX;
  snakeY += moveY;
  if (snakeX > windowSize-5 || snakeX < 5||snakeY > windowSize-5||snakeY < 5) { 
    gameOver = true;
  }
  snakesX[0] = snakeX;
  snakesY[0] = snakeY;
}

void keyPressed() {
  if (keyCode == UP) {  
    if (snakesY[1] != snakesY[0]-10) {
      moveY = -10; 
      moveX = 0;
      Migos=false;
    }
  }
  if (keyCode == DOWN) {  
    if (snakesY[1] != snakesY[0]+10) {
      moveY = 10; 
      moveX = 0;
      Migos=false;
    }
  }
  if (keyCode == LEFT) { 
    if (snakesX[1] != snakesX[0]-10) {
      moveX = -10; 
      moveY = 0;
      Migos=false;
    }
  }
  if (keyCode == RIGHT) { 
    if (snakesX[1] != snakesX[0]+10) {
      moveX = 10; 
      moveY = 0;
      Migos=false;
    }
  }
  if (keyCode == 'R') {
    reset();
  }
   if(key=='1'){
    stir.stop();
    walk.stop();
    drip.stop();
    lim=0;
    while(lim<1){
 stir.play();
 lim=1;
}
}
if(key=='2'){
  lim=0;
  stir.stop();
    walk.stop();
    drip.stop();
  while(lim<1){
    walk.play();
    lim=1;
}
}
if(key=='3'){
  lim=0;
  stir.stop();
    walk.stop();
    drip.stop();
  while(lim<1){
   drip.play();
   lim=1;
}
if(key=='4'){

stir.stop();
    walk.stop();
    drip.stop();
}
}
}
void playNoise(){
  
}