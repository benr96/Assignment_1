/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> menu = new ArrayList<Button>();
Button pos1,pos2,pos3,pos4,pos5;


void setup()
{
 //size(800,600,P3D);
 fullScreen(P3D,1);
 smooth(1);
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
}

void draw()
{
  drawBackground();
  drawMenu();
  drawMainWindow();
  
  
  if (frameCount % 60 == 0) {
    println(frameRate);
  }

}

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
 
 float loginWidth = width/5;
 float loginHeight = height/5;
 
 float windowWidth = sqrt((x1-x2)*(x1-x2)+(y1-y1)*(y1-y1));
 float windowHeight = sqrt((x1-x1)*(x1-x1)+(y1-y2)*(y1-y2));
 
 box mainWindow = new box();
 box loginWindow = new box();
 
 noFill();
 mainWindow.drawBox(x1,y1,windowWidth,windowHeight,0.95,0.9);
 
 switch(windowState)
 {
  case 0://locked
  {
    
    for(float x = x1*2; x <windowWidth;x+=windowWidth/30)
    {
      for(float y = height-windowHeight;y<y2*0.95;y+=windowHeight/30)
      {
       point(x,y); 
      }
    }
    fill(0,0,40,150);
    
    loginWindow.drawBox((width/5)*2,height/2.3,width/5,height/5,0.9,0.8);
  
  }
  case 1://enter credentials
  {
    
  }
  case 2://unlocked main work space
  {
    
  }
 }
}
  
  