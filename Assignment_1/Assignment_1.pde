/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> menu = new ArrayList<Button>();
Button pos1,pos2,pos3,pos4,pos5,pos6;


void setup()
{
 fullScreen(1);
 pos1 = new Button();
 pos2 = new Button();
 pos3 = new Button();
 pos4 = new Button();
 pos5 = new Button();
 pos6 = new Button();
 
 menu.add(pos1);
 menu.add(pos2);
 menu.add(pos3);
 menu.add(pos4);
 menu.add(pos5);
 menu.add(pos6);
 
 
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
  color inner = color(0,0,175);
  
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
  float x = width/(size);
  float y = height/8;
  
  

  for(int i = 0;i<size;i++)
  {
    menu.get(i).drawButton(x-300,y,200,75);
    x+=width/size;
  }
  
}
  