/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> menu = new ArrayList<Button>();
Button pos1,pos2,pos3,pos4,pos5;
PImage bg;


void setup()
{
 //size(800,800,P3D);
 fullScreen(P3D,1);
 smooth(4);
 frameRate(60);
  
 //objects
 pos1 = new Button();
 pos2 = new Button();
 pos3 = new Button();
 pos4 = new Button();
 pos5 = new Button();
 
 //adding objects to array list
 menu.add(pos1);
 menu.add(pos2);
 menu.add(pos3);
 menu.add(pos4);
 menu.add(pos5);
 
 bg = loadImage("background.tif");
}

void draw()
{
  background(bg);
  //drawBackground();
  drawMenu();
  drawMainWindow();
  
  
  if (frameCount % 60 == 0) {
    println(frameRate);
  }

}

//due to extreme lag caused by this code I have decided to instead use an image for the background
//this code is the code that was used to draw that image. This is a temporary solution as the image
//must always be the same res as the screen. seek more satisfactory solution
void drawBackground()
{
  noStroke();
  
  color outer = color(0,0,0);
  color inner = color(0,0,100);
  
  for(float i = 1.5;i > 0;i-=0.01)
  {
    outer = lerpColor(outer,inner,0.01);
    fill(outer);
    ellipse(width/2,height/2,width*i,height*i);
  }
}

void drawMenu()
{
  int size = menu.size();
  float x = 0;
  float y = height/20;
  
  float buttonWidth = width/size-1;
  float buttonHeight =width/22;

  stroke(0,0,200);
  
  for(int i = 0;i<size;i++)
  {
    if(i==2)
    {
      menu.get(i).drawButton(x,0,buttonWidth,buttonHeight+y*2);
    }
    else
    {
       menu.get(i).drawButton(x,y,buttonWidth,buttonHeight);
    }
    
    x+=(width/size-1)+1;
  }
}

void drawMainWindow()
{
 int windowState = 0;
 
 stroke(255);
 
 float x1 = width/25;
 float y1 = height/5;
 float x2 = width-x1;
 float y2 = height*0.95;
 
 float windowWidth = sqrt((x1-x2)*(x1-x2)+(y1-y1)*(y1-y1));
 float windowHeight = sqrt((x1-x1)*(x1-x1)+(y1-y2)*(y1-y2));
 
 box mainWindow = new box();
 
 
 noFill();
 mainWindow.drawBox(x1,y1,windowWidth,windowHeight,0.95,0.9);
 
 switch(windowState)
 {
  case 0://locked
  {
    
    for(float x = x1+windowWidth*0.05; x < x1+windowWidth*0.96;x+=windowWidth*0.9/20)
    {
      for(float y = y1+windowHeight*0.1;y<y1+windowHeight*0.91;y+=windowHeight*0.8/20)
      {
       point(x,y); 
      }
    }
    
    drawLogin();
  }
  case 1:
  {
    
  }
  case 2://unlocked main work space
  {
    
  }
 }
}

void drawLogin()
{
  float loginWidth = width/5;
  float loginHeight = height/5;
  float loginX = loginWidth*2;
  float loginY = loginHeight*2.2;
  String loginTitle = "Enter Login Details: ";
  String userName = "Username: ";
  String password = "Password: ";
 
  box loginWindow = new box();
  
  //draw the login box
  fill(0,0,40,150);
  loginWindow.drawBox(loginX,loginY,loginWidth,loginHeight,0.9,0.8);

  //draw the box title
  fill(255);
  textSize(20);
  text(loginTitle,loginX+loginWidth*0.1,loginY+loginHeight*0.2);
  line(loginX+loginWidth*0.1,loginY+loginHeight*0.22,loginX+loginWidth*0.1+textWidth(loginTitle),loginY+loginHeight*0.22);
  
  //draw username box
  textSize(17);
  text(userName,loginX+loginWidth*0.1,loginY+loginHeight*0.4);
  fill(0,0,75,150);
  rect((loginX+loginWidth*0.1)+textWidth(userName),(loginY+loginHeight*0.4)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  
  //draw password box
  fill(255);
  text(password,loginX+loginWidth*0.1,loginY+loginHeight*0.6);
  fill(0,0,75,150);
  rect((loginX+loginWidth*0.1)+textWidth(password),(loginY+loginHeight*0.6)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  
  //draw submit button
  
  
  //draw override button
  
  
  //call function to check if it is clicked
  
}
  
  