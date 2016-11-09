class Logo
{
 float opacity;
 float cX;
 float cY;
 String location;
 PImage img;
 
 Logo()
 {
  this.opacity = 255;
  this.cX = (width/2);
  this.cY = (height/2);
  this.location = "missingTexture.jpg";
 }
 
 Logo(float opacity, float cX, float cY, String location)
 {
  this.opacity = opacity;
  this.cX = cX;
  this.cY = cY;
  this.location = location;
  this.img = loadImage(this.location);
 }
 
 void drawImage()
 {
   
   tint(255,this.opacity);
   image(img,cX,cY);
 }
 
 void rotateImage()
 {
  
   
   translate(width/2,height/2);
   rotateY(frameCount*0.05);
   translate(-width/2,-height/2);
   
 }
 
 String toString()
 {
  return "Opacity =" + opacity + "\t" + "centre = " +  cX + "," + cY +  "\t" + "Location =" +location ;
 }
   
 
}