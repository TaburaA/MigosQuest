# MigosQuest

# NOTE

You must download the sound library and all files in the data folder for this game to work.

# Purpose

The purpose of this project is to have a workable Snake Game with a twist. This twist would be the implementation of Migos themes. Migos are a hip hop group, so I wanted to be able to add their vocals, music, and likeness to Snake. This was in an effort to make Snake just a little more interesting, while at the same time paying homage to one of my favorite rap groups.

### Difficulties or opportunities you encountered along the way.

The toughest part was getting the music to work. It required the keyPressed() method, along with a while loop to get around some of the problems I was facing. I had trouble being able to play the music without it repeating over and over again, so I had to make a system that would terminate the method before the file could be repeated over and over again. In addition, one hard part that I encountered was barely even code related. One of the aspects of MigosSnake was the 1-3 second audio clip of a Migos Song that would play if you ate one of the food. It took a long time to figure out how I would be able to collect that, and most importantly, actually implement the sound bite into processing.

### Most interesting piece of your code and explanation for what it does.

```Java
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
This is the code that would check to see if you ate the food, and then would increase the size of the snake. In addition, I also made a completely all original piece of code that would generate a random integer from 1 to 6 and then play the sound that matched up. In order to do this, the sound library had to be downloaded, the .play() method must have been used, and a self-terminating while loop was setup so the sound wasn't played infinetly by the if loop.

## Built With

* [Processing](https://processing.org/) - The IDE used

## Authors

* **Anthony "AJ" Tabura** 


## Acknowledgments

* Thank you to Anson Liang for creating the snake processing code that I used as a skeleton
* Shout out Migos for creating dope music.
* Thank you to 8bitbrand and 8bitUniverse for creating the images and music files, respectively. 
