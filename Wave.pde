class Wave {
  PImage image;
  float wavespeed;
  float theta;
  int x1, y1;
  float r;
  float speed;
  float dir;
  
  Wave(PImage image, float theta) {
    this(image,theta,20,10,1);
  }
  
  Wave(PImage image, float theta, float r) {
    this(image,theta,r,10,1);
    
  }
  Wave(PImage image, float theta, float r, float speed, int dir){
    this.theta = theta;
    this.image = image;
    this.r = r;
    this.wavespeed = speed;
    this.dir = dir;
  }
  
  void draw(int x1, int y1) {
    //println("theta: " + theta);
    float x = r * cos(theta);
    float y = r * sin(theta);
    imageMode(CENTER);
    image(image, x + x1, y + y1);
    theta += (dir)*wavespeed/100;
  }
}
