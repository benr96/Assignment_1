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
 
 Planet(float size, color fillCol,float orbitRadius)
 {

   this.fillCol = fillCol;
   this.size = size;
   this.orbitRadius = orbitRadius;
   x = 0 + orbitRadius * cos(angle);
   y = 0 + orbitRadius * sin(angle);
 }

 void drawPlanet()
 {
   noStroke();
   fill(fillCol);
   strokeWeight(0.5);
   
   pushMatrix();
   translate(x,y);
   rotateY(rot);
   sphere(size);
   popMatrix();

 }
 
 void drawOrbit()
 {
   noFill();
   stroke(255,0,0);
   strokeWeight(1);
   
   ellipse(0,0,orbitRadius*2,orbitRadius*2);
 }
 
 void updatePlanet()
 {
   rot = frameCount*0.005;   
 }
 
 void displayInfo()
 {
   textSize(70);
   fill(255,0,0);
   this.fillCol = color(255);
 }
  
 String toString()
 {
   return (size 
      +"\t" + x
      +"\t" + y
      +"\t");
 }
 
}