/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */



void setup()
{
 fullScreen(1); 
}

void draw()
{
  drawBackground();
}

void drawBackground()
{
  noStroke();
  
  color outer = color(0,0,0);
  color inner = color(0,0,150);
  
  for(float i = 1.5;i > 0;i-=0.01)
  {
    outer = lerpColor(outer,inner,0.01);
    fill(outer);
    ellipse(width/2,height/2,width*i,height*i);
  }
  
  
  
  
  
  
  
  
  
  
}