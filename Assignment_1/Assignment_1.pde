/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */

ArrayList<Button> buttons = new ArrayList<Button>();
Button pos1,pos2;


void setup()
{
 fullScreen(1);
 pos1 = new Button();
 pos2 = new Button();
 
 buttons.add(pos1);
 buttons.add(pos2);
 
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
  pos1.drawButton(250,250,100,150);
}
  