
void loadColors(){
  String[] colorValues = loadStrings("data/colors.txt");
  for (int i=0;i<colorValues.length;i++){
    String[] rgbVals = colorValues[i].split(",");
    switch(i){
      case 0:
      redBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
      case 1:
      greenBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
      case 2:
      blueBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
      case 3:
      yellowBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
      case 4:
      pinkBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
      case 5:
      grayBall.setColor(float(rgbVals[0]),float(rgbVals[1]),float(rgbVals[2]));
      break;
    }
  }
}

void storeColors(){
  String[] colorValues = new String[5];
  colorValues[0] = str(red(redBall.target))+","+str(green(redBall.target))+","+str(blue(redBall.target));
  colorValues[1] = str(red(greenBall.target))+","+str(green(greenBall.target))+","+str(blue(greenBall.target));
  colorValues[2] = str(red(blueBall.target))+","+str(green(blueBall.target))+","+str(blue(blueBall.target));
  colorValues[3] = str(red(yellowBall.target))+","+str(green(yellowBall.target))+","+str(blue(yellowBall.target));
  colorValues[4] = str(red(pinkBall.target))+","+str(green(pinkBall.target))+","+str(blue(pinkBall.target));
  //colorValues[5] = str(red(grayBall.target))+","+str(green(grayBall.target))+","+str(blue(grayBall.target));
  saveStrings("data/colors.txt",colorValues);
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = (mouseX) + mouseY*video.width;
  trackColor = video.pixels[loc];
  float r = red(trackColor);
  float g = green(trackColor);
  float b = blue(trackColor);
  println(r);
  println(g);
  println(b);
  if(ballChange!='o'){
    switch(ballChange){
      case 'r':
       redBall.setColor(r,g,b);
       break;
     case 'g':
       greenBall.setColor(r,g,b);
       break;
     case 'b':
       blueBall.setColor(r,g,b);
       break;
     case 'y':
       yellowBall.setColor(r,g,b);
       break;
     case 'p':
       pinkBall.setColor(r,g,b);
       break;
     case 'a':
       grayBall.setColor(r,g,b);
       break;
    }
    ballChange='o';
  }
}


void keyReleased()
{
   switch(key) {
     case 'v':
       videoToggle=!videoToggle;
       break;
     case 'r':
       ballChange = key;
       break;
     case 'g':
       ballChange = key;
       break;
     case 'b':
       ballChange = key;
       break;
     case 'y':
       ballChange = key;
       break;
     case 'p':
       ballChange = key;
       break;
     case 'a':
       ballChange = key;
       break;
   }
  
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}
