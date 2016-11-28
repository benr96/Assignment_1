class radar
{
  float speed = 1;
  int trail = 50;
  float cX;
  float cY;
  float radius; 
  float diameter;
  PVector dot = new PVector(50,50);
  float distPoint = 0;
  float intensity = 255;
  
  radar(float cX, float cY, float radius)
  {
   this.cX = cX;
   this.cY = cY;
   this.radius = radius;
   this.diameter = radius*2;
   pushMatrix();
   translate(cX,cY);
   dot.x = random(-(diameter/3),(diameter/3));
   dot.y = random(-(diameter/3),(diameter/3));
   popMatrix();
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
      pushMatrix();
      translate(cX,cY);
      
      if(dot.x > -(diameter/2) && dot.x < (diameter/2) && dot.y > -(diameter/2) && dot.y < (diameter/2))
      {
        dot.x += random(-40,40);  
        dot.y += random(-40,40); 
      }
      else
      {
        dot.x = random(-(diameter/2),(diameter/2));
        dot.y = random(-(diameter/2),(diameter/2));
      }

      distPoint = dist(0,0,dot.x,dot.y);
      popMatrix();
    }

    radius = radius+speed;

    ellipse(cX,cY,radius*2,radius*2);

    if(distPoint < radius)
    {
      pushMatrix();
      
      translate(cX,cY);
      strokeWeight(5);
      stroke(255,0,0);
      point(dot.x, dot.y);
      
      popMatrix();
    }

  }
}