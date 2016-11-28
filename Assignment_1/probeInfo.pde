//for holding data from probeData file on each type of planet
class probeInfo
{
  String type;
  String inhabited;
  String intelligent;
  float temperature;
  float oxygen;
  float nitrogen;
  float carbonDioxide;
  float other;
  String breathable;
  String water;
  
  probeInfo()
  {
    type = "default";
    inhabited = "N/A";
    intelligent = "N/A";
    temperature = 0;
    oxygen = 0;
    nitrogen = 0;
    carbonDioxide = 0;
    other = 0;
    breathable = "N/A";
    water = "N/A";
  }
  
  probeInfo(TableRow row)
  {
    //interpreting data from file
    type = row.getString("Type");
    
    if(row.getInt("Inhabited") == 1)
    {
      inhabited = "Yes";
    }
    else
    {
      inhabited = "No"; 
    }
    
    if(row.getInt("Intelligent") == 1)
    {
      intelligent = "Yes";
    }
    else
    {
      intelligent = "No"; 
    }
    
    temperature = row.getFloat("Temperature");
    oxygen = row.getFloat("Oxygen");
    nitrogen = row.getFloat("Nitrogen");
    carbonDioxide = row.getFloat("Carbon Dioxide");
    other = row.getFloat("Other");
    
    if(row.getInt("Breathable") == 1)
    {
      breathable = "Yes";
    }
    else
    {
      breathable = "No";
    }
    
    if(row.getInt("Water") == 1)
    {
      water= "Yes";
    }
    else
    {
      water = "No";
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