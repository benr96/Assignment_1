class Button
{
 String label;
 int value;//0 = not pressed 1 = pressed
 
 Button()
 {
  label = "Default";
  value = 0;
 }
 
 Button(String label, int value)//Assigning values
 {
   this.label = label;
   this.value = value;
 }
 
 void drawButton(float x, float y, float buttonWidth, float buttonHeight)
 {
   stroke(255);
   strokeWeight(1);
   
   float width10 = buttonWidth*0.1;
   float width90 = buttonWidth*0.9;
   
   float height20 = buttonHeight*0.2;
   float height80 = buttonHeight*0.8;
   
   isClicked(x,y,buttonWidth,buttonHeight);
  
   line(x+width10,y,x+width90,y);//top line
   line(x+width90,y,x+buttonWidth,y+height20);//top right
   line(x+buttonWidth,y+height20,x+buttonWidth,y+height80);//right
   line(x+buttonWidth,y+height80,x+width90,y+buttonHeight);//bottom right
   line(x+width90,y+buttonHeight,x+width10,y+buttonHeight);//bottom
   line(x+width10,y+buttonHeight,x,y+height80);//bottom left
   line(x,y+height80,x,y+height20);//left
   line(x,y+height20,x+width10,y);//top left
   
   fill(255);
   textSize(buttonWidth/7);
   text(label,x+buttonWidth/4,y+buttonHeight/1.5);
 }
 
 void isClicked(float x, float y,float buttonWidth, float buttonHeight)
 {
   
   if(mouseX>x && mouseX<(x+buttonWidth) && mouseY>y && mouseY<y+buttonHeight)
   {
     stroke(255,0,0);
     
     if(mousePressed)
     {
      this.value = 1; 
      stroke(0,255,0);
     }
   }
 }
 
 String toString()
 {
  return label + "\t" + value; 
 }
 
}