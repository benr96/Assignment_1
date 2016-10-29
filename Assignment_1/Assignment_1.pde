/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> menu = new ArrayList<Button>();
Button pos1,pos2,pos3,pos4,pos5;


void setup()
{
// size(800,800);
 fullScreen(P3D,2);
  smooth(8);
  
 pos1 = new Button();
 pos2 = new Button();
 pos3 = new Button();
 pos4 = new Button();
 pos5 = new Button();
 
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
  float buttonHeight = 100;

  stroke(0,0,200);
  
  for(int i = 0;i<size;i++)
  {
    if(i==2)
    {
      menu.get(i).drawButton(x,0,buttonWidth,buttonHeight+y+25);
    }
    else
    {
       menu.get(i).drawButton(x,y,buttonWidth,buttonHeight);
    }
    
    x+=width/size-1;
  }
  
}
  