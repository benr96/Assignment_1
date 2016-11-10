class button
{
 String label;
 int value;//0 = not pressed 1 = pressed
 
 button()
 {
  label = "default";
  value = 0;
 }
 
 button(String label, int value)//Assigning values
 {
   this.label = label;
   this.value = value;
 }
 
 void drawButton(float x, float y, float buttonWidth, float buttonHeight,int boxOpacity, int textOpacity)
 { 
   fill(0,0,57,boxOpacity);
   stroke(234,223,104,boxOpacity);
   strokeWeight(2);
   
   isClicked(x,y,buttonWidth,buttonHeight);
   
   box Box = new box();
   
   if(this.value == 1)
   {
     buttonWidth = buttonWidth*0.95;
     buttonHeight = buttonHeight*0.95;
     x = x +(buttonWidth*0.025);
     y = y +(buttonHeight*0.025);
   }
   
   Box.drawBox(x,y,buttonWidth,buttonHeight,0.9,0.8);
   
   fill(255,255,255,textOpacity);
   textSize(buttonWidth/7);
   text(label,x+buttonWidth/4,y+buttonHeight/1.5);
 }
 
 void isClicked(float x, float y,float buttonWidth, float buttonHeight)//if clicked change appearance
 {
   
   if(mouseX>x && mouseX<(x+buttonWidth) && mouseY>y && mouseY<y+buttonHeight)
   { 
     if(mousePressed)
     {
      this.value = 1; 
     }
     else
     {
      this.value = 0; 
     }
   }
 }
 
 String toString()
 {
  return label + "\t" + value; 
 }
 
}