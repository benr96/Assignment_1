/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */
ArrayList<button> menu = new ArrayList<button>();
int windowState = 0;
int boxOp = 150;
int textOp = 255;
int logoOpacity = 0;
Logo icarus;

PImage bg;

void setup()
{
 //size(800,800,P3D);
 fullScreen(P3D,1);
  
  
  for(int i=0 ;i<5;i++)
  {
   button pos = new button(); 
   menu.add(pos);
  }
 
 
  bg = loadImage("background.tif");
  icarus = new Logo(logoOpacity,0,0,"icarus.png");
 // icarus = new Logo();

}


void draw()
{
  background(0);
  //drawBackground();
  drawMenu();
  drawMainWindow();
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
      menu.get(i).drawButton(x,0,buttonWidth,buttonHeight+y*2,150,255);
    }
    else
    {
       menu.get(i).drawButton(x,y,buttonWidth,buttonHeight,150,255);
    }
    
    x+=(width/size-1)+1;
  }
}


void drawMainWindow()
{
 stroke(255);
 
 float x1 = width/25;
 float y1 = height/5;
 float x2 = width-x1;
 float y2 = height*0.95;
 
 float windowWidth = sqrt((x1-x2)*(x1-x2)+(y1-y1)*(y1-y1));
 float windowHeight = sqrt((x1-x1)*(x1-x1)+(y1-y2)*(y1-y2));

 box mainWindow = new box();
 
 noFill();
 stroke(234,223,104);
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
    drawLogin(boxOp,textOp);
    break;
  }
  case 1://transitioning
  {
    
    if(boxOp != 0)
    {
      boxOp-=2;
    }
    
    if(textOp != 0)
    {
      textOp-=3;
    }
    
    if(boxOp == 0 && textOp == 0)
    {
      
      if(icarus.opacity != 255)
      {
        icarus.opacity+=3;
      }
     
      icarus.rotateImage();
      icarus.drawImage();
    }
    else
    {
      drawLogin(boxOp,textOp);
       for(float x = x1+windowWidth*0.05; x < x1+windowWidth*0.96;x+=windowWidth*0.9/20)
    {
      for(float y = y1+windowHeight*0.1;y<y1+windowHeight*0.91;y+=windowHeight*0.8/20)
      {
       point(x,y); 
      }
    }
    }
    break;
  }
  case 2://unlocked main work space
  {
    
  }
 }
 
    
}

void drawLogin(int boxOpacity,int textOpacity)
{
  float loginWidth = width/5;
  float loginHeight = height/5;
  float loginX = loginWidth*2;
  float loginY = loginHeight*2.2;
  
  float safeX = loginX+loginWidth*0.1;
  float safeY = loginY+loginHeight*0.2;
  
  String loginTitle = "System Locked";
  String userName = "Username: ";
  String password = "Password:  ";
  
  println("box opacity = " + boxOpacity + "\t" +"text opacity = " + textOpacity);
  
  box loginWindow = new box();
  button submitButton = new button("Login",0);
  stroke(234,223,104,boxOpacity);
  strokeWeight(3);
  
  //draw the login box
  fill(0,0,40,boxOpacity);
  loginWindow.drawBox(loginX,loginY,loginWidth,loginHeight,0.9,0.8);

  //draw the box title
  fill(255,255,255,textOpacity);
  textSize(20);
  text(loginTitle,safeX,safeY);
  line(safeX,safeY*1.01,safeX+textWidth(loginTitle),safeY*1.01);
  
  //draw username box
  textSize(17);
  text(userName,safeX,safeY*1.1);
  fill(0,0,75,boxOpacity);
  rect(safeX+textWidth(userName),(safeY*1.1)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  //Default text
  fill(234,223,104,textOpacity);
  text("Administrator",safeX+textWidth(userName)+5,(safeY*1.1));
  
  //draw password box
  fill(255,255,255,textOpacity);
  text(password,safeX,safeY*1.17);
  fill(0,0,75,boxOpacity);
  rect(safeX+textWidth(password),(safeY*1.17)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  //Default text
  fill(234,223,104,textOpacity);
  text("*************",safeX+textWidth(password)+5,(safeY*1.17));
  
  //draw submit button
  submitButton.drawButton(safeX,safeY*1.25,loginWidth/3,loginHeight/8,boxOpacity,textOpacity);
  
  //if clicked change window state
  if(submitButton.value == 1)
  {
    windowState = 1;
  }
    
  //draw override button  
  
}
  
  