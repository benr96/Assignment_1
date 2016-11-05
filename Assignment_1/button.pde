class button
{
 String label;
 int value;//0 = not pressed 1 = pressed
 
 button()
 {
  label = "Default";
  value = 0;
 }
 
 button(String label, int value)//Assigning values
 {
   this.label = label;
   this.value = value;
 }
 
 void drawButton(float x, float y, float buttonWidth, float buttonHeight,int boxOpacity, int textOpacity)
 { 
   fill(0,0,40,boxOpacity);
   stroke(255,255,255,boxOpacity);
   
   isClicked(x,y,buttonWidth,buttonHeight);
   
   box Box = new box();
   
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
   }
 }
 
 String toString()
 {
  return label + "\t" + value; 
 }
 
}