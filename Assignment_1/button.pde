class Button
{
 //FIELDS
 String label;
 int value;//0 = not pressed 1 = pressed
 
 //CONSTRUCTORS
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
   stroke(0,0,200);
   strokeWeight(5);
   
   float width10 = buttonWidth*0.1;
   float width90 = buttonWidth*0.9;
   
   float height20 = buttonHeight*0.2;
   float height80 = buttonHeight*0.8;
   
   
   line(x+width10,y,x+width90,y);
   line(x+width90,y,x+buttonWidth,y+height20);
   line(x+buttonWidth,y+height20,x+buttonWidth,y+height80);
   line(x+buttonWidth,y+height80,x+width90,y+buttonHeight);
   line(x+width90,y+buttonHeight,x+width10,y+buttonHeight);
   line(x+width10,y+buttonHeight,x,y+height80);
   line(x,y+height80,x,y+height20);
   line(x,y+height20,x+width10,y);
  
 }
 String toString()
 {
  return label + "\t" + value; 
 }
 
}