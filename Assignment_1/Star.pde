class Star
{
 //fields
 float hab;
 String DisplayName;
 float Distance;
 float Xg;
 float Yg;
 float Zg;
 float AbsMag;
 float x;
 float y;
 float radius;
 boolean selected;
 
 //default constructor
 Star()
 {
  this.hab = 0;
  this.DisplayName ="Default";
  this.Distance = 0;
  this.Xg = 0;
  this.Yg = 0;
  this.Zg = 0;
  this.AbsMag = 0;
  this.x = 0;
  this.y = 0;
  this.radius = 0;
  this.selected = false;
 }
 
 //parameterised constructor
 Star(TableRow row,float starX1,float starX2, float starY1, float starY2)
 {
  this.hab = row.getFloat("Hab?");
  this.DisplayName = row.getString("Display Name");
  this.Distance = row.getFloat("Distance");
  this.Xg = row.getFloat("Xg");
  this.Yg = row.getFloat("Yg");
  this.Zg = row.getFloat("Zg");
  this.AbsMag = row.getFloat("AbsMag");
  this.x = map(Xg,-5,5,starX1,starX2);
  this.y = map(Yg,-5,5,starY1,starY2);
  this.radius = AbsMag/2;
  this.selected = false;
 }
 
 void isSelected()
 {
  if(mousePressed)
  {
   if(mouseX>x-radius && mouseX < x+radius && mouseY > y-radius && mouseY < y+radius)
   {
    this.selected = true;
   }
   else
   {
    this.selected = false; 
   }
  }
 }
 
 //for printing
 String toString()
 {
  return hab + "\t" +DisplayName +"\t" +Distance+"\t" +Xg+"\t" +Yg+"\t" +Zg+"\t" +AbsMag;
 }
 
}