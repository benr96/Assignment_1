class Planet
{
  String name;
  float size;
  float origSize;
  float angle;
  float rot;
  float rotSpeed;
  float rotSpeedSave;
  float orbitRadius;
  color orbitCol;
  PVector location = new PVector(0,0,0);
  PImage texture;
  PShape planet;
  boolean probeCheck = false;
  boolean clicked = false;
 
 Planet()
 {
   name = "Default";
   size = 0;
   location.x =location.y = location.z = 0;
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
   location.x = 0 + orbitRadius;// * cos(angle);
   location.y = 0; 
   this.orbitCol = orbitCol;
   this.texture = texture;
   noStroke();
   planet = createShape(SPHERE,size);
   rotSpeedSave = this.rotSpeed;
   origSize = this.size;
 }

 void drawPlanet()
 {
   pushMatrix();
   
   translate(location.x,0,location.z);
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
    location.x = 0 + orbitRadius *cos(rot);
    location.z = 0 + orbitRadius *sin(rot);
  }
 
  void isClicked()
  {
    float onScreenX = screenX(location.x,location.y,location.z);
    float onScreenY = screenY(location.x,location.y,location.z);
  
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
      +"\t" + location.x
      +"\t" + location.y
      +"\t" + location.z
      );
  }
}