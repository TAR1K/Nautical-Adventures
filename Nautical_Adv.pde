//NAUTICAL ADVENTURE by Tarik El-Khateeb
//Code by Hart Reed and Tarik El-Khateeb

//Color Tracking adapted from "Simple Color Tracking" 
//by Daniel Shiffman. http://www.learningprocessing.com



//Assets
PImage sky;
Wave w1, w2, w3;
TrackingSprite island, mermaid, sun, pirate, ship;
FixedSprite clouds;
char ballChange = 'o';

import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 
ColorTracker redBall, yellowBall, pinkBall, blueBall, greenBall, grayBall;

boolean videoToggle = true;

void setup() {
  size(1440, 900);
  w1 = new Wave(loadImage("WAVE1.png"), 0, 20, 9, 1); //number= to make the assets not move in sync
  w2 = new Wave(loadImage("WAVE2.png"), 3, 20, 12, -1);
  w3 = new Wave(loadImage("WAVE3.png"), 10, 20, 7, 1);
  
  sky = loadImage("SKY.png");
  
  String[] cameras = Capture.list();
 
  video = new Capture(this, width, height); //for USB
  //video = new Capture(this, cameras[1]);  //for built-in cam
  video.start();
  
  redBall = new ColorTracker(color(187,33,44),video); //These objects track a specific color, they need a color as the first argument, then a reference to the video object
  greenBall = new ColorTracker(color (36,139,148),video);
  blueBall = new ColorTracker(color (73,133,225),video);
  yellowBall = new ColorTracker(color(185,183,74),video);
  pinkBall = new ColorTracker(color (211,96,174),video);
  //grayBall = new ColorTracker(color (155,129,124),video);
  
  loadColors();
  
  //redBall.setSmoothing(true);
  
  clouds = new FixedSprite(yellowBall,loadImage("CLOUDS.png"));
  clouds.fixY(180); //control the location
  sun = new TrackingSprite(yellowBall,loadImage("SUN.png"));
  island = new BobbingSprite(greenBall,loadImage("ISLAND.png"), 590);
  mermaid = new BobbingSprite(pinkBall,loadImage("MERMAID.png"),640);
  pirate = new BobbingSprite(redBall,loadImage("PIRATE.png"),660);
  ship = new BobbingSprite(blueBall,loadImage("SHIP.png"),550);
}

void draw() {
  video.loadPixels();
  if(!videoToggle){
    /*pushMatrix();
    scale(-1,1);
    translate(-width,0);
    image(video,width/2,height/2);
    popMatrix();*/
    image(video,width/2,height/2);
    redBall.update();
    redBall.drawMarker();
    yellowBall.update();
    yellowBall.drawMarker();
    greenBall.update();
    greenBall.drawMarker();
    blueBall.update();
    blueBall.drawMarker();
    //grayBall.update();
    //grayBall.drawMarker();
    pinkBall.update();
    pinkBall.drawMarker();
  }else{
    background(255);
    image(sky, width/2, height/2);
    sun.update();
    clouds.update();
    w3.draw(705, 727);
    ship.update();
    island.update();
    w2.draw(728, 790);
    mermaid.update();
    pirate.update();
    w1.draw(724, 820); //x,y,speed,direction (clockwise)
  }
}



