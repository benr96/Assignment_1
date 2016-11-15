class Planet
{
 float size;
 float x;
 float y;
 float angle;
 float rot;
 color strokeCol;
 color fillCol;
 float orbitRadius;
 
 Planet()
 {
   size = 0;
   x = 0;
   y = 0;
   angle = 0;
   strokeCol = color(255);
   fillCol = color(0);
   orbitRadius = 0;
   
 }
 
 Planet(float size, color strokeCol, color fillCol,float orbitRadius)
 {
   this.strokeCol = strokeCol;
   this.fillCol = fillCol;
   this.size = size;
   this.orbitRadius = orbitRadius;
   x = 0 + orbitRadius * cos(angle);
   y = 0 + orbitRadius * sin(angle);
 }

 void drawPlanet()
 {
   stroke(strokeCol);
   fill(fillCol);
   strokeWeight(0.5);
   
   pushMatrix();
   translate(x,y);
   rotateY(angle);
   sphere(size);
   popMatrix();
 }
 
 void updatePlanet()
 {
   rot = frameCount;
   pushMatrix();
   translate(sunX,sunY);
   rotate(frameCount*0.005);
   popMatrix();
   
 }
  
 String toString()
 {
   return (size 
      +"\t" + x
      +"\t" + y
      +"\t");
 }
 
}