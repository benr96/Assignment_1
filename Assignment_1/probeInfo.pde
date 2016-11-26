class probeInfo
{
  String type;
  boolean inhabited;
  boolean intelligent;
  float temperature;
  float oxygen;
  float nitrogen;
  float carbonDioxide;
  float other;
  boolean breathable;
  boolean water;
  
  probeInfo()
  {
    type = "default";
    inhabited = false;
    intelligent = false;
    temperature = 0;
    oxygen = 0;
    nitrogen = 0;
    carbonDioxide = 0;
    other = 0;
    breathable = false;
    water = false;
  }
  
  probeInfo(TableRow row)
  {
    type = row.getString("Type");
    
    if(row.getInt("Inhabited") == 1)
    {
      inhabited = true;
    }
    else
    {
      inhabited = false; 
    }
    
    if(row.getInt("Intelligent") == 1)
    {
      intelligent = true;
    }
    else
    {
      intelligent = false; 
    }
    
    temperature = row.getFloat("Temperature");
    oxygen = row.getFloat("Oxygen");
    nitrogen = row.getFloat("Nitrogen");
    carbonDioxide = row.getFloat("Carbon Dioxide");
    other = row.getFloat("Other");
    
    if(row.getInt("Breathable") == 1)
    {
      breathable = true;
    }
    else
    {
      breathable = false;
    }
    
    if(row.getInt("Water") == 1)
    {
      water= true;
    }
    else
    {
      water = false;
    }

  }
  
  String toString()
  {
    return type
        +"\t" + inhabited
        +"\t" + intelligent
        +"\t" + temperature
        +"\t" + oxygen
        +"\t" + nitrogen
        +"\t" + carbonDioxide
        +"\t" + other
        +"\t" + breathable
        +"\t" + water;
  }
}