class radar
{
  float speed = 1;
  int trail = 50;
  float cX;
  float cY;
  float radius; 
  float diameter;
  float pX = 50;
  float pY = 50;
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
   pX = random(-(diameter/3),(diameter/3));
   pY = random(-(diameter/3),(diameter/3));
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
      
      if(pX > -(diameter/2) && pX < (diameter/2) && pY > -(diameter/2) && pY < (diameter/2))
      {
        println("adding");
        pX += random(-40,40);  
        pY += random(-40,40); 
      }
      else
      {
        println("new");
        pX = random(-(diameter/2),(diameter/2));
        pY = random(-(diameter/2),(diameter/2));
      }

      distPoint = dist(0,0,pX,pY);
      popMatrix();
    }
   println(pX+","+pY);

    
    
    radius = radius+speed;

    ellipse(cX,cY,radius*2,radius*2);

   // println(radius+"\t"+ distPoint);
    if(distPoint < radius)
    {
      pushMatrix();
      translate(cX,cY);
      strokeWeight(5);
      stroke(255,0,0);
      point(pX, pY);
      popMatrix();
    }

    
  }
    





}