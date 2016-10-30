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
   isClicked(x,y,buttonWidth,buttonHeight);
   
   box Box = new box();
   
   Box.drawBox(x,y,buttonWidth,buttonHeight,0.9,0.8);
   
   fill(255);
   textSize(buttonWidth/7);
   text(label,x+buttonWidth/4,y+buttonHeight/1.5);
 }
 
 void isClicked(float x, float y,float buttonWidth, float buttonHeight)//if clicked change appearance
 {
   
   if(mouseX>x && mouseX<(x+buttonWidth) && mouseY>y && mouseY<y+buttonHeight)
   {
     stroke(255,0,0);
     strokeWeight(1);
     noFill();
     
     if(mousePressed)
     {
      this.value = 1; 
      stroke(0,255,0);
      strokeWeight(1);
      noFill();
     }
   }
   else
   {
    stroke(255);
    strokeWeight(1);
    noFill();
   }
 }
 
 String toString()
 {
  return label + "\t" + value; 
 }
 
}