class Planet
{
  String name;
  float size;
  float x;
  float y;
  float z;
  float angle;
  float rot;
  float rotSpeed;
  float rotSpeedSave;
  float orbitRadius;
  color orbitCol;
  boolean clicked = false;
  PImage texture;
  PShape planet;
  boolean probeCheck = false;
 
 Planet()
 {
   name = "Default";
   size = 0;
   x = 0;
   y = 0;
   z = 0;
   angle = 0;
   rot = 0;
   rotSpeed = 0;
   orbitRadius = 0;
   
 }
 
 Planet(String name, float size,float orbitRadius, float rot, float rotSpeed,color orbitCol, PImage texture)
 {
   this.name = name;
   this.size = size;
   this.orbitRadius = orbitRadius;
   this.rot = rot;
   this.rotSpeed = rotSpeed;
   x = 0 + orbitRadius;// * cos(angle);
   y = 0; 
   this.orbitCol = orbitCol;
   this.texture = texture;
   noStroke();
   planet = createShape(SPHERE,size);
   rotSpeedSave = this.rotSpeed;
 }

 void drawPlanet()
 {
   pushMatrix();
   translate(x,0,z);
   planet.rotateY(rotSpeed);
   planet.setTexture(texture);
   shape(planet);
   popMatrix();

 }
 
 void drawOrbit()
 {
   noFill();
   stroke(orbitCol);
   strokeWeight(1);
   
   ellipse(0,0,orbitRadius*2,orbitRadius*2);
 }
 
 void updatePlanet()
 {
   rot+=rotSpeed;
   x = 0 + orbitRadius *cos(rot);
   z = 0 + orbitRadius *sin(rot);
 }
 
void isClicked()
{
  float onScreenX = screenX(x,y,z);
  float onScreenY = screenY(x,y,z);
  
  if(mousePressed)
  {
    if(mouseX > onScreenX-size && mouseX < onScreenX+size && mouseY > onScreenY-size && mouseY < onScreenY+size)
    {
      clicked = true;
    }
  }

}

 String toString()
 {
   return (size 
      +"\t" + x
      +"\t" + y
      +"\t");
 }
 
}