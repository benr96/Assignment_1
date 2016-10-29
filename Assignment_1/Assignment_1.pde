/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> menu = new ArrayList<Button>();
Button pos1,pos2,pos3,pos4,pos5;


void setup()
{
 //size(800,800);
 fullScreen(P3D,2);
 smooth(8);
  
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
 
 float windowWidth = sqrt((x1-x2)*(x1-x2)+(y1-y1)*(y1-y1));
 float windowHeight = sqrt((x1-x1)*(x1-x1)+(y1-y2)*(y1-y2));
 
 line(x1*2,y1,windowWidth,y1);//top
 line(windowWidth,y1,windowWidth+x1,height-windowHeight);//top right
 line(x2,height-windowHeight,x2,y2*0.95);//right
 line(x2,y2*0.95,windowWidth,y2);//bottom right
 line(windowWidth,y2,x1*2,y2);//bottom
 line(x1*2,y2,x1,y2*0.95);//bottom left
 line(x1,y2*0.95,x1,height-windowHeight);//left
 line(x1,height-windowHeight,x1*2,y1);//top left
 
 switch(windowState)
 {
  case 0://locked
  {
    for(float i =x1*2 ; i<windowWidth;i+=windowWidth/30)
    {
      line(i,y1,i,y2);
    }
    for(float i = height-windowHeight; i<y2*0.95; i+=windowHeight/30)
    {
      line(x1,i,x2,i);
    }
    
    fill(255);
    
    
  }
  case 1://enter credentials
  {
    
  }
  case 2://unlocked main work space
  {
    
  }
 }
}
  
  