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
 }
 
 //parameterised constructor
 Star(TableRow row)
 {
  this.hab = row.getFloat("Hab?");
  this.DisplayName = row.getString("Display Name");
  this.Distance = row.getFloat("Distance");
  this.Xg = row.getFloat("Xg");
  this.Yg = row.getFloat("Yg");
  this.Zg = row.getFloat("Zg");
  this.AbsMag = row.getFloat("AbsMag");
 }
 
 //for printing
 String toString()
 {
  return hab + "\t" +DisplayName +"\t" +Distance+"\t" +Xg+"\t" +Yg+"\t" +Zg+"\t" +AbsMag;
 }
 
}