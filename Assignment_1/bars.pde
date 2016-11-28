class bars
{
   int amount = 8;
   int level;
   int current = amount;
   float barWidth = width/15;
   float barHeight = height/45;
   float x;
   float y;
   String label;
  
   bars(float x, float y, String label, int level)
   {
      this.x = x;
      this.y = y;
      this.label = label;
      this.level = level;
   }
   
   void drawBars()
   {
     textFont(arcon,windowWidth/60);
     
     float textPosX = x+(barWidth/2)-(textWidth(label)/2);
     float textPosY = y+((barHeight+10)*amount)+textAscent();

      
     fill(0);
     rect(x-10,y-10,barWidth+20,(barHeight+10)*amount+10);
     
     fill(255);
     text(label,textPosX,textPosY);
   
     for(int i=amount;i>0;i--)
     {
       current = i;

       colourCheck();

       box bar = new box(x,y,barWidth,barHeight,0.9,0.9);
       
       bar.drawBox();
       
       y+=barHeight+10;
       
     }
     fill(0);
     
     if(level > 5 && label != "Shield Integrity" || critical == true)
     {
       if (millis() - n <= 500)
       {  
         fill(255,0,0);
       }
       else if (millis() - n >= 1000)
       {
         n = millis();
       }
     }
     else if(level < 4 && label == "Shield Integrity" && shieldToggle.getValue() == 0)
     {
       if (millis() - n <= 500)
       {  
         fill(255,0,0);
       }
       else if (millis() - n >= 1000)
       {
         n = millis();
       }

     }
     else
     {
       fill(0,255,0); 
     }
     
     ellipse(textPosX-20,textPosY-10,20,20);
   }
   
   void colourCheck()
   {
     if(current <= level && current > 5 && label != "Shield Integrity")
     {
       fill(255,0,0); 
     }
     else if(current <= level && current > 3 && label == "Shield Integrity")
     {
       fill(0,255,0);
     }
     else if(current <= level && current <= 5 && label != "Shield Integrity")
     {
       fill(0,255,0);
     }
     else if(current <= level && current <= 3 && label == "Shield Integrity")
     {
       fill(255,0,0); 
     }
     else
     {
       fill(0); 
     }
   }
}