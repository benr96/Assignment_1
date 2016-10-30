class box
{
 void drawBox(float x, float y, float boxWidth,float boxHeight,float XPercent,float YPercent)
 {
   
   float width10 = boxWidth*(1-XPercent);
   float width90 = boxWidth*XPercent;
   
   float height20 = boxHeight*(1-YPercent);
   float height80 = boxHeight*YPercent;
   
   PShape boxShape;
   
   boxShape = createShape();
   
   boxShape.beginShape();
   boxShape.vertex(x+width10,y);
   boxShape.vertex(x+width90,y);
   
   boxShape.vertex(x+width90,y);
   boxShape.vertex(x+boxWidth,y+height20);
   
   boxShape.vertex(x+boxWidth,y+height20);
   boxShape.vertex(x+boxWidth,y+height80);
   
   boxShape.vertex(x+boxWidth,y+height80);
   boxShape.vertex(x+width90,y+boxHeight);
   
   boxShape.vertex(x+width90,y+boxHeight);
   boxShape.vertex(x+width10,y+boxHeight);
   
   boxShape.vertex(x+width10,y+boxHeight);
   boxShape.vertex(x,y+height80);
   
   boxShape.vertex(x,y+height80);
   boxShape.vertex(x,y+height20);
   
   boxShape.vertex(x,y+height20);
   boxShape.vertex(x+width10,y);
   boxShape.endShape(CLOSE);
   
   shape(boxShape);
 }
}