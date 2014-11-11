int fadeDelay = 400;

class TrackingSprite {
  ColorTracker tracker;
  PImage sprite;
  
  TrackingSprite(ColorTracker tracker, PImage sprite){
    this.tracker = tracker;
    this.sprite = sprite;
  }
  
  void update(){
    tracker.update();
    if(tracker.visible){
      image(sprite, tracker.x, tracker.y);
    }else if(millis()-tracker.lastSeen<fadeDelay){
      image(sprite, tracker.x, tracker.y);
    }
  }
  
}

class BobbingSprite extends TrackingSprite {
  Wave waveSprite;
  int yPos;
  
  BobbingSprite(ColorTracker tracker, PImage sprite, int yPos){
    super(tracker,sprite);
    this.waveSprite = new Wave(sprite, 0, 10);
    this.yPos = yPos;
  }
  
  @Override void update() {
    tracker.update();
    if(tracker.visible){
      waveSprite.draw(tracker.x,yPos);
    }else if(millis()-tracker.lastSeen<fadeDelay){
      waveSprite.draw(tracker.x, yPos);
    }
  }
}

class FixedSprite extends TrackingSprite {
  int xPos;
  int yPos;
  boolean xFixed;
  boolean yFixed;
  
  FixedSprite(ColorTracker tracker, PImage sprite){
    this(tracker,sprite,0,0);
    this.xFixed = false;
    this.yFixed = false;
  }
  
  FixedSprite(ColorTracker tracker, PImage sprite, int xPos, int yPos){
    super(tracker,sprite);
    this.xPos = xPos;
    this.yPos = yPos;
    this.xFixed = true;
    this.yFixed = true;
  }
  
  @Override void update() {
    tracker.update();
    if(tracker.visible){
      if(xFixed&&yFixed){
        image(sprite, xPos, yPos);
      }else if(xFixed){
        image(sprite, xPos, tracker.y);
      }else if(yFixed){
        image(sprite, tracker.x, yPos);
      }else{
        image(sprite, tracker.x, tracker.y);
      }
      
    }else if(millis()-tracker.lastSeen<fadeDelay){
      if(xFixed&&yFixed){
        image(sprite, xPos, yPos);
      }else if(xFixed){
        image(sprite, xPos, tracker.y);
      }else if(yFixed){
        image(sprite, tracker.x, yPos);
      }else{
        image(sprite, tracker.x, tracker.y);
      }
    }
  }
  void clearX(){
    xFixed = false;
  }
  void clearY(){
    yFixed = false;
  }
  void fixX(int xFix){
    xFixed = true;
    xPos = xFix;
  }
  void fixY(int yFix){
    yFixed = true;
    yPos = yFix;
  }
}
