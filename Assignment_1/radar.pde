class radar
{
  float speed = 1;
  int trail = 50;
  float cX;
  float cY;
  float radius; 
  float diameter;
  
  radar(float cX, float cY, float radius)
  {
   this.cX = cX;
   this.cY = cY;
   this.radius = radius;
   this.diameter = radius*2;
  }

  void drawRadar()
  {
    strokeWeight(5);
    stroke(255,0,0); 
    point(cX,cY);
    
    
    stroke(234,223,104);
    noFill();
    ellipse(cX,cY,diameter,diameter);
    strokeWeight(1);
    if(radius*2 >= diameter )
    {
       radius = 0;
    }
    println(radius);
    radius = radius+speed;
    
    float intensityChange = 255/(trail/2);
    for(int i=0;i<trail;i++)
    {
      float rad = radius;
       if(rad >= 20)
       {
          rad = (radius-i);
       }
       
       stroke(234-(i*intensityChange), 223 - (i * intensityChange), 104 - (i * intensityChange));
       
       ellipse(cX,cY,rad*2,rad*2);
    }
      
    
  }
    





}