class box
{
  float x;
  float y; 
  float boxWidth;
  float boxHeight;
  float XPercent;
  float YPercent;
  
 box(float x, float y, float boxWidth,float boxHeight,float XPercent,float YPercent)
 {
   this.x = x;
   this.y = y; 
   this.boxWidth = boxWidth;
   this.boxHeight = boxHeight;
   this.XPercent = XPercent;
  this.YPercent = YPercent;
   
 }
  
 void drawBox()
 {
  
   float width10 = boxWidth*(1-XPercent);
   float width90 = boxWidth*XPercent;
   
   float height20 = boxHeight*(1-YPercent);
   float height80 = boxHeight*YPercent;

   beginShape();
   vertex(x+width10,y);
   vertex(x+width90,y);
   
   vertex(x+width90,y);
   vertex(x+boxWidth,y+height20);
   
   vertex(x+boxWidth,y+height20);   
   vertex(x+boxWidth,y+height80);
   
   vertex(x+boxWidth,y+height80);
   vertex(x+width90,y+boxHeight);
   
   vertex(x+width90,y+boxHeight);
   vertex(x+width10,y+boxHeight);
   
   vertex(x+width10,y+boxHeight);
   vertex(x,y+height80);
   
   vertex(x,y+height80);
   vertex(x,y+height20);
   
   vertex(x,y+height20);
   vertex(x+width10,y);
   endShape(CLOSE);
 }
}