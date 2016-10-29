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
   fill(255);
   stroke(255,0,0);
   
   float widthTen = buttonWidth*0.1;
   
   line(x+20,y,x+200,y);
   line(x+200,y,x+220,y+20);
   line(x+220,y+20,x+220,y+60);
   line(x+220,y+60,x+200,y+80);
   line(x+200,y+80,x+20,y+80);
   line(x+20,y+80,x,y+60);
   line(x,y+60,x,y+20);
   line(x,y+20,x+20,y);
  
 }
 String toString()
 {
  return label + "\t" + value; 
 }
 
}