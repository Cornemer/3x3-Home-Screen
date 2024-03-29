//Global Variables
int appWidth, appHeight, largerDimension, smallerDimension;
Boolean OS_On=false, splashScreenStart=false;
Boolean nightMode=false; //Bonus #1: populate with sytem clock
color resetDefaultInk=#FFFFFF, white=#FFFFFF, blue=#4169e1, black=#000000;
//
float rect1X, rect1Y, rect1W, rect1H;
float rect2X, rect2Y, rect2W, rect2H;
float rect3X, rect3Y, rect3W, rect3H;
float rect4X, rect4Y, rect4W, rect4H;
float rect5X, rect5Y, rect5W, rect5H;
float rect6X, rect6Y, rect6W, rect6H;
float rect7X, rect7Y, rect7W, rect7H;
float rect8X, rect8Y, rect8W, rect8H;
//Ultimate Bonus, Gr 11: use API-sunrise for system clock start, API-sunset for system clock end
//Hint: https://processing.org/reference/hour_.html

/* Night Mode Comment
 Purple not for Night Mode, full BLUE
 resetDefaultInk is Night Mode friendly
 */
//
void setup() {
  size(1920, 1080);
  //fullScreen(); //displayWidth, displayHeight
  appWidth = width;
  appHeight = height;
  //Display Algorithm from Hello World
  display(); //Purpose: CANVAS fits in monitor & dimension size is known
  //smaller & larger dimension from Display Algorithm
  println("Smaller Dimension is", smallerDimension, "Larger Dimension is", largerDimension);
  population(); //Values based on DISPLAY
  textSetup();
  imageSetup();
}//End setup
//
void draw() {
  //Assignemnt #2: OS Level Mouse CLick and Splash Screen
  if ( OS_On==true && splashScreenStart==false ) splashScreen(); //OS Level MOUSE Click
  if ( splashScreenStart==true ) homeScreen();
  if ( splashScreenStart==true ) nineRect();
  println(splashScreenStart);
  //
}//End draw
//
void keyPressed() {
  //Splash Screen SPACE Bar
  if ( OS_On==true && key==' ' ) {
    splashScreenStart = true;
    backgroundImage();
  }//End Splash Screen SPACE Bar
  //
  //Key Board Short Cuts
  if ( splashScreenStart==true ) {//Home Screen Only Variables
    if ( key==CODED || keyCode==ESC ) exit();
    if ( key=='Q' || key=='q' ) exit();
    if ( key=='N' || key=='n' ) {
      if ( nightMode==false ) { 
        nightMode = true;
        backgroundImage();
        //Reminder: must redraw all of rectangles too, and Home Screen
      } else { 
        nightMode = false;
        backgroundImage();
        //Reminder: must redraw all of rectangles too, and Home Screen
      }
    }
  }//Home Screen Only
  //
}//End keyPressed
//
void mousePressed() {
  //OS Level MouseClick
  if ( OS_On==false ) OS_On=true;//End OS Level MouseClick
  if ( splashScreenStart==true ) {//Home Screen Only Variables
    if ( mouseX>=quitX && mouseX<=quitX+quitWidth && mouseY>=quitY && mouseY<=quitY+quitHeight ) exit();
  }//Home Screen Only
  //
}//End mousePressed
//
//End MAIN Program
