/*Author: Ben Ryan
  Student Number: C15507277
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */
void setup()
{
  n = millis();
  m = millis();
  o = millis();
  //used for some ui features
  controlP5 = new ControlP5(this);
  
  welcome = new SoundFile(this,"welcome.mp3");
  ambient = new SoundFile(this,"ambient.wav");
  errorS = new SoundFile(this,"sound2.mp3");
  
  ambient.loop();

  //fullScreen(P3D,2);//render in 3d fullscreen
  size(1366,768,P3D);
  smooth(8);//AA x1
  imageMode(CENTER);
  
  border = width/19.2;
 

  //initialising buttons and adding them to an arrayList
  for(int i=0 ;i<5;i++)
  {
   button pos = new button(buttonNames[i],0); 
   menu.add(pos);
  }
  
  //filling selectedStars with null so to avoid array out of bounds exception
  for(int i=0;i<39;i++)
  {
    selectedStars.add(null);
  }
  
  //FONTS
  spaceAge = createFont("font1.ttf",50);//used for buttons
  arcon = createFont("font5.otf",50);//used for information
  number = createFont("font6.ttf",50);//used for numbers on the star map
  
  //IMAGES
  icarus = new Logo(logoOpacity,width/2,height/2,"icarus.png");//loading screen
  
  //MAIN WINDOW VARIABLES
  
  //top left
  x1 = width/25;
  y1 = height/5;
  
  //bottom right
  x2 = width-x1;
  y2 = height*0.95;
 
 //main window dimensions
  windowWidth = sqrt((x1-x2)*(x1-x2)+(y1-y1)*(y1-y1));
  windowHeight = sqrt((x1-x1)*(x1-x1)+(y1-y2)*(y1-y2));
  
  //useful variables
  halfway = x1+(windowWidth/2);
  rightSplit = (halfway+(halfway/2)-border/2);
  
  //PLOT STAR VARIABLES
  starX1 = x1+border;
  starX2 = halfway-border;
  starY1 = y1+border;
  starY2 = y1+windowHeight-border;
  
  //FUNCTION CALLS
  loadData();
 
  //LOCAL SOLAR SYSTEM VARIABLES
  
  //centre sun in middle of main window
  sunX = x1+(windowWidth/2);
  sunY = y1+(windowHeight/2);
  
  sunSize = windowWidth/20;

  //slider used to tilt view of solar system
  sliderWidth = border/2;
  sliderHeight = windowHeight-(border*2);
  sliderX = x1+border;
  sliderY = y1+border;
  localMapSlider = controlP5.addSlider("Tilt Map",0,10,5,(int)sliderX,(int)sliderY,(int)sliderWidth,(int)sliderHeight) .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57)).hide();
  
  //planet info box 
  PIBX = x2-(border*3);
  PIBY = y1+border;
  PIBW = windowWidth/7;
  PIBH = windowHeight/2;
  
  planetInfoBox = new box(PIBX,PIBY,PIBW,PIBH,0.83,0.9);
 
  float orbitRadius = sunSize;
  
  earth = loadImage("earth.jpg");
  dust = loadImage("venus.gif");
  ice = loadImage("ice.jpg");
  jupiter = loadImage("jupiter.jpg");
  sun = loadImage("sun.png");
  
  noStroke();
  sunS = createShape(SPHERE,sunSize);
  sunS.setTexture(sun);
  
  textures.add(earth);
  textures.add(dust);
  textures.add(ice);
  textures.add(jupiter);  
    
  planNum =4;//(int)random(2,5);//random amount of planets between 2 and 5
    
   for(int i=0;i<planNum;i++)
   {
     float size = random((windowWidth/100),sunSize/2);//random size
     float diameter = (size*2);//used in limited the random range of the next planets orbit radius
     float rot = random(0,TWO_PI);//random start position
     float rotSpeed = random(0.001,0.01);//random rotation speed
     orbitRadius = random(orbitRadius+(diameter*2), windowWidth/15);//random orbit radius limited by the previous orbit radius and the size of the last planet so they don't overlap
     
     //creating and adding planets to the arrayList
     Planet p = new Planet(planetNames[i],size,orbitRadius,rot,rotSpeed,color(255,0,0),textures.get(i));
     planets.add(p);
   }    
   
   barsStart = x1+border*1.8;
   
   localMapSliderRot = controlP5.addSlider("Simulation Speed")
                     .setPosition(x1+(border*5),y1+(windowHeight*0.9))
                     .setSize((int)(windowWidth*0.40),(int)(windowHeight/20))
                     .setRange(-5,5)
                     .setColorBackground(color(255))
                     .setColorActive((color(0,0,57)))
                     .setColorForeground(color(0,0,57))
                     .setValue((int)0)
                     .hide();
                       
   
   enginePowerSlider = controlP5.addSlider("Engine Power")
                   .setPosition(barsStart-20,y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(100)
                   .hide();
                   
  engineCoolingSlider = controlP5.addSlider("Engine Cooling")
                   .setPosition(barsStart+(windowWidth/25)*2,y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(200)
                   .hide();
                   
 shipVelocitySlider = controlP5.addSlider("Ship Speed")
                   .setPosition(barsStart+((windowWidth/25)*4),y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(300)
                   .hide();
                   
 weaponPowerSlider = controlP5.addSlider("Weapon Power")
                   .setPosition(barsStart+((windowWidth/25)*6),y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(0)
                   .hide();
                   
  weaponCoolingSlider = controlP5.addSlider("Weapons Cooling")
                   .setPosition(barsStart+((windowWidth/25)*8),y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(0)
                   .hide();
                   
  shieldPowerSlider = controlP5.addSlider("Shield Power")
                   .setPosition(barsStart+((windowWidth/25)*10),y1+(windowHeight/2)+20)
                   .setSize((int)(windowWidth/25),(int)((windowHeight/2)-border))
                   .setRange(0,800)
                   .setColorBackground(color(255))
                   .setColorActive((color(0,0,57)))
                   .setColorForeground(color(0,0,57))
                   .setValue(400)
                   .hide();
               
  shieldToggle = controlP5.addToggle("Shields")
                .setPosition(barsStart+((windowWidth/25)*12),y1+(windowHeight/2)+20)
                .setSize((int)(windowWidth/20),(int)(windowHeight/20))
                .setValue(false)
                .setMode(ControlP5.SWITCH)
                .hide();
                
  engineToggle = controlP5.addToggle("Engine")
                .setPosition(barsStart+((windowWidth/25)*12),y1+(windowHeight/2)+100)
                .setSize((int)(windowWidth/20),(int)(windowHeight/20))
                .setValue(false)
                .setMode(ControlP5.SWITCH)
                .hide();
                
  weaponToggle = controlP5.addToggle("Weapons")
                .setPosition(barsStart+((windowWidth/25)*12),y1+(windowHeight/2)+180)
                .setSize((int)(windowWidth/20),(int)(windowHeight/20))
                .setValue(false)
                .setMode(ControlP5.SWITCH)
                .hide();
                
                picW = width/2;
                picH = height/2;
                rot = 0;
                rad =new radar(x1+(windowWidth*0.84),y1+(windowHeight*0.775),windowWidth/12);
                
}


import processing.sound.*;
SoundFile welcome;
boolean soundCheckWelcome= false;
SoundFile ambient;
SoundFile errorS;
boolean soundCheckerrorS = false;



import controlP5.*;//used in creating the sliders
ControlP5 controlP5;
controlP5.Slider localMapSlider;//slider for solar system tilt
controlP5.Slider localMapSliderRot;

controlP5.Slider enginePowerSlider;
controlP5.Slider engineCoolingSlider;
controlP5.Slider shipVelocitySlider;
controlP5.Toggle engineToggle;

controlP5.Slider weaponPowerSlider;
controlP5.Slider weaponCoolingSlider;
controlP5.Toggle weaponToggle;

controlP5.Slider shieldPowerSlider;
controlP5.Toggle shieldToggle;


float sliderWidth;
float sliderHeight;
float sliderX;
float sliderY;
boolean sliderCheck = false;
int Rotate_Map = 5;//slider default value
 
 //BUTTON VARIABLES
ArrayList<button> menu = new ArrayList<button>();//holds buttons
String[] buttonNames = {"Star Map","Local System","Controls","Probes","Lock System"};//button labels

//STAR VARIABLES
ArrayList<Star> stars = new ArrayList<Star>();//holds stars drawn
Star currentStar = null;//used to hold the current star you are at
Table t;//used for loading star info from file

//MAIN WINDOW VARIABLE
int windowState = 0;//start as locked
float x1;//left border
float y1;//top border
float x2;//right border
float y2;//bottom border
float windowWidth;
float windowHeight;
float halfway;
float border;
float rightSplit;
float leftSplit;

//PLOT STAR VARIABLES
//grid borders to map the coordinates to
float starX1;
float starX2;
float starY1;
float starY2;

//SELECTED STARS VARIABLES
ArrayList<Star> selectedStars = new ArrayList<Star>();
int selected =-1;
boolean selectionCheck = false;
int page = 1;
int current = 0;

//LOGIN WINDOW VARIABLES
int boxOp = 150;
int textOp = 255;

//TRANSITION VARIABLES
int logoOpacity = 0;
Logo icarus;
boolean check = false;

//FONTS
PFont spaceAge;
PFont arcon;
PFont number;

//IMAGES
PImage bg;

//LOCAL SYSTEM MAP VARIABLES  
ArrayList<Planet> planets = new ArrayList<Planet>();
String[] planetNames = {"Miranda", "Ariel", "Persephone", "Osiris"};//planet names
Planet select = null;//used for saving the selected planet

float sunSize;//radius of sun
int planNum;//amount of planets

//sun coordinates
float sunX;
float sunY;

//camera position controls
float camX = 0;
float camY = 0;

//planet info box
float PIBX;
float PIBY;
float PIBW;
float PIBH;
box planetInfoBox;

float n;
float m;
float o;
float barsStart;
boolean error = false;
boolean critical = false; 

ArrayList<PImage> textures = new ArrayList<PImage>();
PImage earth;
PImage dust;
PImage ice;
PImage sun;
PImage jupiter;
PShape sunS;

float e;
float picW;
float picH;
PShape selectedPlanet;
float rot;
Table t1;
ArrayList<probeInfo> probeinfo = new ArrayList<probeInfo>();
ArrayList<Planet> probes = new ArrayList<Planet>();
radar rad;

boolean lockedCheck = false;
button probe = new button("Launch Probe",0);

void draw()
{
  textFont(spaceAge);
  background(0);
   
  
  drawMenu();//draw the buttons
  drawMainWindow();//draw the main window and control its contents
}

void loadData()
{
  //load table from file containing star data
  t = loadTable("starData.csv","header");
  t1 = loadTable("probeData.csv","header");
 
  //create object for each star and store them in and arraylist
  for(TableRow row:t.rows())
  {
    Star s = new Star(row,starX1,starX2,starY1,starY2);
    stars.add(s);
  }
  
  for(TableRow row:t1.rows())
  {
    probeInfo p = new probeInfo(row);
    probeinfo.add(p);
  }
  
  //choosing current star
  for(int i=0;i<stars.size();i++)
  {
    if(stars.get(i).DisplayName.equals("Solaris"))
    {
      currentStar = stars.get(i);
    }
  }
  
}

void drawMenu()
{
  //amount of buttons
  int size = menu.size();
 
  //button dimensions
  float buttonWidth = (width/size-1)*0.95;
  float buttonHeight = (width/22)*0.95;
  
  //start positon of button(0.025 because the buttonWidth is leaving 5% or 2.5% on each side of screen
  float x = (buttonWidth*0.025);
  float y = height/20;
  
  //loop for drawing buttons
  for(int i = 0;i<size;i++)
  {
    //draw the middle button bigger
    if(i==2)
    {
      menu.get(i).drawButton(x,0,buttonWidth,buttonHeight+y*2,150,255);
    }
    else
    {
       menu.get(i).drawButton(x,y,buttonWidth,buttonHeight,150,255);
    }
    
    //increment the start position of the button to where next button should start
    x+=(width/size-1);
  }
}

void drawMainWindow()
{ 
  //new box object to draw the main window
  box mainWindow = new box(x1,y1,windowWidth,windowHeight,0.95,0.9);
 
  //main window colours
  noFill();
  stroke(234,223,104);
  
  //draw box
  mainWindow.drawBox();

  //to make sure buttons can't be pressed when window is locked or in transition
  if(windowState != 0 && windowState !=1)
  {
    //to check if a button has been clicked and to draw the correct window state for that button
    for(int i =0;i<menu.size();i++)
    {
      if(menu.get(i).value == 1)
      {
        //change window state according to what button is pressed, +3 because window state 0 1 and 2 are not for buttons
        windowState = i+3; 
      }
   }
  
}
  //if buttons are clicked but window is still locked
  else
  {
    for(int i =0;i<menu.size();i++)
    {
      if(menu.get(i).value == 1 || lockedCheck == true)
      {
        fill(255,0,0);
        if(soundCheckerrorS == false)
        {
           errorS.play();
           soundCheckerrorS = true;
        }

       if (millis()-m <= 1000)
       {  
         lockedCheck = true;
       }
       else
       {
         lockedCheck = false;
         soundCheckerrorS = false;
         m = millis();
       }
      }
    }
  }
  
  windowControl();
}

void windowControl()
{
  enginePowerSlider.hide();
  engineCoolingSlider.hide();
  enginePowerSlider.hide();
  engineCoolingSlider.hide();
  shipVelocitySlider.hide();
  weaponPowerSlider.hide();
  weaponCoolingSlider.hide();
  shieldPowerSlider.hide();
  shieldToggle.hide();
  engineToggle.hide();
  weaponToggle.hide();
  localMapSliderRot.hide();
  
  localMapSlider.hide();
  
  switch(windowState)
  {
    case 0://locked
    {
      drawDots();
      drawLogin();
      break;
    }
    case 1://transitioning
    {    
      String initial = "Initializing Please Wait";
      text(initial,x1+(windowWidth/2)-(textWidth(initial)/2),(y1+windowHeight)*0.85);
    
      //if box opacity hasn't reached 0 keep decrementing it
      if(boxOp != 0)
      {
        boxOp-=2;
      }
    
      //if text opacity hasn't reached 0 keep decrementing it
      if(textOp != 0)
      {
        textOp-=3;
      }
    
      //once login has fully faded start drawing the logo
      if(boxOp == 0 && textOp == 0)
      {
        //increase up to 400 (the actual transparency will cap at 255, going to 400 is for leaving it on the screen longer)
        if(icarus.opacity>=0 && icarus.opacity<400 && check == false)
        {
          icarus.opacity += 2; 
        }
        else
        {
          check = true;
          icarus.opacity -=2; 
        }
      
        //when logo has fully faded and check is true the transition state is complete, move on.
        if(icarus.opacity == 0 && check == true)
        {
          windowState = 2; 
        }
      
        //used to draw and rotate image
        icarus.rotateImage();
        icarus.drawImage();
      }
      else//otherwise keep drawing the fading login screen
      {
        drawLogin();
        drawDots();
      }
      break;
    }
    case 2://unlocked
    { 
      tint(255);
      
      if(soundCheckWelcome == false)
      {
        welcome.play();
        soundCheckWelcome = true;
      }
      
      textFont(arcon,windowWidth/25);
      String ready = "System Initialized";
      String report = "Systems Report Summary: ";
      String security = "System Security Level: ";
      String systems = "Critical Systems Report: ";
      String seeMore = "See other systems in the 'Controls' menu";
      String ok = "1.0";
      String current = "Current Location: "+currentStar.DisplayName;
      String inhabited = "Inhabited System";
      String status = "Security Status: ";
      
      //drawDots();
      //consider adding report on this page, something about security, systems report etc
      fill(0,255,0);
      text(ready,(width/2)-(textWidth(ready)/2),y1+border*1);
      
      fill(0,0,255);
      text(report,x1+border,y1+border*2);
      
      textSize(windowWidth/35);
      fill(255);
      text(security,x1+border,y1+border*3);
      text(systems,x1+border,y1+border*3.5);
      
      textSize(windowWidth/40);
      text(seeMore,x1+border,y1+border*4);
      text(inhabited,x1+border,y1+border*5.5);
      text(status,x1+border,y1+border*6);
      
      textSize(windowWidth/35);
      text(current,x1+border,y1+border*5);
      
      
      
      fill(0,255,0);
      text(ok,x1+border+textWidth(security),y1+border*3);
      text(ok,x1+border+textWidth(systems),y1+border*3.5);
      textSize(windowWidth/40);
      text(ok,x1+border+textWidth(status),y1+border*6);
      break;
    }
    case 3://Star Map
    {  
      //reset button clears selected stars
      float resetWidth = windowWidth/10;
      float nextWidth = windowWidth/11;
      button reset = new button("Reset",0);
      reset.drawButton(halfway-resetWidth-border,y1+windowHeight-(border*0.75),resetWidth,windowHeight/15,150,255);
    
      if(reset.value == 1)
      {
        //clear the arrayList an reinitailise to null
        selectedStars.clear();
        for(int i=0;i<40;i++)
        {
          selectedStars.add(null);
        }
        
        //reset some variables
        selected = -1;
        current = 0;
        page=1;
      }
      
      //next and previous page buttons
      button nextPage = new button("Next Pg",0);
      button prevPage = new button("Previous Pg",0);
    
      prevPage.drawButton(rightSplit+20,y1+windowHeight-(border*0.75),nextWidth,windowHeight/15,150,255);
      nextPage.drawButton(rightSplit+40+nextWidth,y1+windowHeight-(border*0.75),nextWidth,windowHeight/15,150,255);
    
      //change page by 4 because of how drawing each page works, it goes from the value of page+3, so each page prints 4 from the arrayList
      if(nextPage.value == 1 && page < selectedStars.size()-6)
      {
        page+=4;
        delay(250);
      }
      else if(prevPage.value == 1 && page > 1)
      {
        page-=4;
        delay(250);
      }
      
      //line down middle
      line(halfway,y1,halfway,y1+windowHeight);
    
      //line down right middle
      line(rightSplit,y1,rightSplit,y2);
   
      drawGrid(x1,y1,windowWidth,windowHeight);
      plotStars();
      drawLine();
      starInfo();
    
      break;
    }
    case 4://second menu item
    {

      localMapSlider.show();
      localMapSliderRot.show();
      
      for(int i=0;i<planets.size();i++)
      {
        planets.get(i).rotSpeed = planets.get(i).rotSpeedSave + localMapSliderRot.getValue()/100;
      }
      
      pushMatrix();
      
      //lerp camera position to the value of the slider which is mapped to a new range
      float rotMap = map(localMapSlider.getValue(),0,10,-500,500);
      camY = lerp(camY,rotMap,0.01);
      camera(camX,-camY,750,sunX,sunY,0,0,1,0);

      pushMatrix();
      translate(sunX,sunY);//translate to where sun will be drawn
      rotateY(-frameCount*0.001);//rotate sun
      shape(sunS);
      pointLight(255,255,255,0,0,0);//to simulate sun light
      ambientLight(50,50,50);//to help light up the scene a bit more so the parts of planets not facing sun can be seen
      popMatrix();

      pushMatrix();
      translate(sunX,sunY);//translate to sun centre
      
      //loop through planets arrayList doing various things
      for(int i=0;i<planets.size();i++)
      {
        planets.get(i).isClicked();//check if the planet is clicked
        
        planets.get(i).drawPlanet();//draw the planet
        planets.get(i).updatePlanet();//update the planets position
      }
      popMatrix();
    
      pushMatrix();
      
      translate(sunX,sunY);//translate to sun centre
      
      rotateX(-1.6);//rotate about the x axis
    
      //draw the orbits of the planets
      for(int i=0;i<planets.size();i++)
      {
        planets.get(i).drawOrbit();
      }
    
      popMatrix();
      popMatrix();
  
      planetInfo();  
      break;
    }
    case 5://Ship Status
    {
                              
      int weaponHeatLevel;
      ArrayList<String> errors = new ArrayList<String>();
      String error1 = "Engine Power Overload";
      String error2 = "Engine Overheating";
      String error3 = "Weapons Power Overload";
      String error4 = "Weapons Overheating";
      String error5 = "Shield Power Overload";
      String error6 = "Shield Integrity Failing";
      String error7 = "Reactor Failure has Occured";
      String error8 = "Reactor Failure Imminent";
      
      enginePowerSlider.show();
      engineCoolingSlider.show();
      enginePowerSlider.show();
      engineCoolingSlider.show();
      shipVelocitySlider.show();
      weaponPowerSlider.show();
      weaponCoolingSlider.show();
      shieldPowerSlider.show();
      shieldToggle.show();
      engineToggle.show();
      weaponToggle.show();
      
      if(enginePowerSlider.getValue() < shipVelocitySlider.getValue()-200)
      {
        enginePowerSlider.setValue(shipVelocitySlider.getValue()-200);
      }
      
      if(shieldToggle.getValue() == 1)
      {
        shieldPowerSlider.setValue(0);
        error = false;
      }
      
      if(engineToggle.getValue() == 1)
      {
        enginePowerSlider.setValue(0); 
        shipVelocitySlider.setValue(0);
        engineCoolingSlider.setValue(0);
        
        error = false;
      }
      
      if(weaponToggle.getValue() == 1)
      {
         weaponPowerSlider.setValue(0);
         weaponCoolingSlider.setValue(0);
         weaponHeatLevel= 0;
         error = false;
      }
      else
      {
         weaponHeatLevel= (int)((weaponPowerSlider.getValue() - weaponCoolingSlider.getValue())/100)+2;
      }
      
      int engineHeatLevel = (int)((enginePowerSlider.getValue()+shipVelocitySlider.getValue() - engineCoolingSlider.getValue())/100);
      int enginePowerLevel = (int)enginePowerSlider.getValue()/100;
      int weaponPowerLevel= (int)weaponPowerSlider.getValue()/100;
      int shieldIntLevel= (int)((shieldPowerSlider.getValue())/100);
      int shieldPowerLevel=(int)(shieldPowerSlider.getValue()/100);
      
      
      box lower = new box(x1+20,y1+(windowHeight/2),windowWidth-40,(windowHeight/2)-20,0.95,0.8);
      box upper = new box(x1+20,y1+20,windowWidth-40,(windowHeight/2)-30,0.95,0.8);
      
      bars engineHeat = new bars(barsStart,y1+40,"Engine Temp",engineHeatLevel);
      bars enginePower = new bars(barsStart*2,y1+40,"Engine Power",enginePowerLevel);
      bars weaponHeat = new bars(barsStart*3,y1+40,"Weapon Temp",weaponHeatLevel);
      bars weaponPower = new bars(barsStart*4,y1+40,"Weapon Power",weaponPowerLevel);
      bars shieldInt = new bars(barsStart*5,y1+40,"Shield Integrity",shieldIntLevel);
      bars shieldPower = new bars(barsStart*6,y1+40,"Shield Power",shieldPowerLevel);
    
      
      lower.drawBox();
      upper.drawBox();
      
      engineHeat.drawBars();
      enginePower.drawBars();
      weaponHeat.drawBars();
      weaponPower.drawBars();
      shieldInt.drawBars();
      shieldPower.drawBars();
      
      if((enginePowerLevel+weaponPowerLevel+shieldPowerLevel) > 20 || critical == true)
      {
         error = true;
         errors.add(error7);
         shieldToggle.setValue(1);
         engineToggle.setValue(1);
         weaponToggle.setValue(1);
         critical = true;
      }
      else
      {
        if((enginePowerLevel+weaponPowerLevel+shieldPowerLevel) > 15)
        {
          error = true; 
          errors.add(error8);
        }
        
        if(engineHeatLevel > 5)
        {
          error = true; 
          errors.add(error2);
        }
        else
        {
          error = false; 
        }
        
        if(enginePowerLevel > 5)
        {
          error = true;
          errors.add(error1);
        }
        
        if(weaponHeatLevel > 5)
        {
          error = true;
          errors.add(error4);
        }
        
        if(weaponPowerLevel > 5)
        {
          error = true;
          errors.add(error3);
        }
        
        if(shieldPowerLevel > 5)
        {
          error = true;
          errors.add(error5);
        }
        
        if((shieldIntLevel <4 && shieldToggle.getValue() ==0))
        {
          error = true;
          errors.add(error6);
        }
      
      }

      textFont(arcon,windowWidth/60);
      String ok = "All Systems Ok";
      String warning = "WARNING";
      String criticalS = "System Critical";
      
      fill(255,0,0);
      
      for(int i=0;i<errors.size();i++)
      {
        text(errors.get(i), rightSplit-border,(y1+(windowHeight*0.80)+(textAscent()*i)));
      }
      
      if(error != true && critical !=true)
      {
        fill(0,255,0);
        stroke(0,255,0);
        text(ok,(rightSplit-border)+(windowWidth/4)/2-textWidth(ok)/2,(y1+windowHeight*0.60)+(windowHeight/8)/2+textAscent()/2);
      }
      else if( error == true && critical !=true)
      {
        fill(0);
        stroke(0);
      
        if (millis() - n <= 500)
        {  
          fill(255,0,0);
          stroke(255,0,0);
        }
        else if (millis() - n >= 1000)
        {
          n = millis();
        }
        
        text(warning,(rightSplit-border)+(windowWidth/4)/2-textWidth(warning)/2,(y1+windowHeight*0.60)+(windowHeight/8)/2+textAscent()/2);
      }
      else if(critical == true)
      {
        text(criticalS,(rightSplit-border)+(windowWidth/4)/2-textWidth(warning)/2,(y1+windowHeight*0.60)+(windowHeight/8)/2+textAscent()/2);

      }
      
      noFill();
      box SystemCheck = new box(rightSplit-border,y1+windowHeight*0.60,windowWidth/4,windowHeight/8,0.9,0.9);
      

      
      SystemCheck.drawBox();
      break;
    }
    case 6:
    {
      probes = new ArrayList<Planet>();
      boolean clickCheck = false;
      
      textFont(arcon,width/80);
      for(int i=0;i<planets.size();i++)
      {
        if(planets.get(i).probeCheck == true)
        {
          Planet p = planets.get(i);
          probes.add(p);
        }
      }
      
      if(probes.size() !=0)
      {
        for(int i=0;i<probes.size();i++)
        {
          pushMatrix();
          translate(x1+border,(y1+border)+(windowHeight/4)*i);
          if(mouseX > x1+border-planets.get(i).origSize && mouseX < x1+border+planets.get(i).origSize && mouseY > ((y1+border)+(windowHeight/4)*i)-planets.get(i).origSize && mouseY < ((y1+border)+(windowHeight/4)*i)+planets.get(i).origSize && mousePressed)
          {
            probes.get(i).clicked = true;
            for(int j = 0;j<probes.size();j++)
            {
              if(probes.get(j) != probes.get(i))
              {
                probes.get(j).clicked = false;
              }
            }
          }
          
          text(probes.get(i).name,-textWidth(probes.get(i).name)/2,probes.get(i).origSize*2);
          shape(probes.get(i).planet);
          popMatrix();
          
          if(probes.get(i).clicked  == true)
          {
            pushMatrix();
            clickCheck = true;
            
            if(e == -1 && probes.get(i).size < windowHeight/3)
            {
             probes.get(i).size+=30;
             e=0;
            }
            else if(e == 1 && probes.get(i).size>windowHeight/10)
            {
              probes.get(i).size-=30;
              e=0;
            }
           
            noStroke();
            selectedPlanet = createShape(SPHERE,probes.get(i).size);
            selectedPlanet.setTexture(probes.get(i).texture);
            pushMatrix();
            translate(x1+(windowWidth/2),y1+(windowHeight/2));
            rotateY(rot);
            shape(selectedPlanet);
            popMatrix();
            popMatrix();
            
            probeInfo();
          }
        }       
      }
      else
      {
        textSize(windowWidth/30);
        String probeLaunch = "No Probes Launched. Launch probes from Local System Menu";
        text(probeLaunch,x1+(windowWidth/2)-textWidth(probeLaunch)/2,height/2); 
      }
      
      if(clickCheck == false && probes.size()!=0)
      {
        textSize(windowWidth/30);
        String selectProbe = "Select a planet to view data";
        text(selectProbe,x1+(windowWidth/2)-textWidth(selectProbe)/2,height/2); 
      }


      break;
    }
    case 7://lock window
    {

      //clear the arrayList an reinitailise to null
      selectedStars.clear();
      for(int i=0;i<40;i++)
      {
        selectedStars.add(null);
      }
       
      //reset some variables
      selected = -1;
      current = 0;
      page=1;
      windowState = 0;
      boxOp = 150;
      textOp = 255;
      icarus.opacity = 0;
      check =false;
      soundCheckWelcome = false;
      break;
    }
    default://no window state selected
    {
      drawDots();
      text("Error 404 : Page not found",width/2,height/2); 
    }
  }
}

void drawDots()
{
  for(float x = x1+windowWidth*0.05; x < x1+windowWidth*0.96;x+=windowWidth*0.9/20)
  {
    for(float y = y1+windowHeight*0.1;y<y1+windowHeight*0.91;y+=windowHeight*0.8/20)
    {
      point(x,y); 
    }
  }
}

void drawLogin()
{
  //login box dimensions
  float loginWidth = width/5;
  float loginHeight = height/5;
  
  //where login box starts drawing
  float loginX = loginWidth*2;
  float loginY = loginHeight*2.2;
  
  //safe coords to draw within the login box
  float safeX = loginX+loginWidth*0.1;
  float safeY = loginY+loginHeight*0.2;
  
  //login labels
  String loginTitle = "System Locked";
  String userName = "Username: ";
  String password = "Password: ";
 
  //creating objects for login box and button
  box loginWindow = new box(loginX,loginY,loginWidth,loginHeight,0.9,0.8);
  button submitButton = new button("Login",0);
  
  //colour and weight of login box
  stroke(234,223,104,boxOp);
  if(lockedCheck == true)
  {
    if (millis() - n <= 100)
    {  
      strokeWeight(3);
      stroke(234,223,104,boxOp);
    }
    else if (millis() - n >= 200)
    {
      stroke(255);
      strokeWeight(5);
      n = millis();
    }
  }

  
  
  fill(100,0,0,boxOp);
  
  //draw the login box
  loginWindow.drawBox();

  //draw the box title
  fill(255,255,255,textOp);
  textSize(width/100);
  text(loginTitle,safeX,safeY);
  line(safeX,safeY*1.01,safeX+textWidth(loginTitle),safeY*1.01);
  
  //draw username box
  textSize(loginWidth/23);
  text(userName,safeX,safeY*1.1);
  fill(0,0,75,boxOp);
  rect(safeX+textWidth(userName),(safeY*1.1)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  //Default text
  fill(255,255,255,textOp);
  text("Administrator",safeX+textWidth(userName)+5,(safeY*1.1));
  
  //draw password box
  fill(255,255,255,textOp);
  text(password,safeX,safeY*1.17);
  fill(0,0,75,boxOp);
  rect(safeX+textWidth(password),(safeY*1.17)-(textAscent()+textDescent()),loginWidth/2,loginHeight/8);
  //Default text
  fill(255,255,255,textOp);
  text("*************",safeX+textWidth(password)+5,(safeY*1.17));
  
  //draw submit button
  submitButton.drawButton(safeX+(loginWidth*.15),safeY*1.25,loginWidth/2,loginHeight/6,boxOp,textOp);
  
  //if login button is clicked change window state to transitionign
  if(submitButton.value == 1)
  {
    windowState = 1;
  }
}

void drawGrid(float x1, float y1, float windowWidth, float windowHeight)
{
  //gap between lines
  float lineGapX = ((windowWidth/2)-(border*2))/10;
  float lineGapY =((windowHeight)-border*2)/10;
  
  //for labeling the sides (parsecs)
  int i = -5;
  
  //line thickness and font
  strokeWeight(1);
  textFont(arcon,width/110);

  //drawing vertical lines
  for(float x = x1+border; x <= halfway-(border-1); x+=lineGapX)
  {
    line(x,y1+border,x,y1+windowHeight-border); 
    text(i++,x,y1+border-20);
  }
  
  //reset i for labelling the other side
  i = -5;
  
  //drawing horizontal lines
  for(float y = y1+border; y <= y1+windowHeight-(border-1);y+=lineGapY)
  {
    line(x1+border,y,halfway-border,y); 
    text(i++,x1+border-30,y);
  }
}

void plotStars()
{
  for(int i=0;i<stars.size();i++)
  {
    if(stars.get(i).DisplayName.equals(currentStar.DisplayName))
    {
      fill(255,0,0); 
    }
    else
    {
      fill(30,144,255); 
    }
    
    String starName = stars.get(i).DisplayName;
   
    //drawing red circle around each stars location the size of the star
    noStroke();
    ellipse(stars.get(i).x,stars.get(i).y,stars.get(i).AbsMag,stars.get(i).AbsMag);
      
    //displaying the stars name to the right of each star
    fill(255);
    textSize(windowWidth/90);
    text(starName,stars.get(i).x+10,stars.get(i).y);
  }
}

void drawLine()
{
  stroke(255);
  textFont(number);
  textSize(width/110);

  //if a star has been selected remove the current node from the arrayList(which is null) and add the selected star in its place
  if(selected != -1 && current < 39)
  {
    selectedStars.remove(current);
    selectedStars.add(current,stars.get(selected));
    current++;//move to next position in arrayList
    selected = -1;//to make it only add the selected star once
  }
  else
  {
    for(int i=0;i<selectedStars.size()-4;i++)
    {
      //due to the way selectStars and drawing lines works I need a seperate text draw for the first ones number
      if(selectedStars.get(0) != null)
      {
        fill(0,255,0);
        text("1",(selectedStars.get(0).x)-(selectedStars.get(0).radius)*3,(selectedStars.get(0).y)+(selectedStars.get(0).radius));
      }
       
      //if star i and the next on are selected draw a line between them and write the number beside the second one
      if(selectedStars.get(i) != null && selectedStars.get(i+1) != null)
      {
        float x1 = selectedStars.get(i).x; 
        float y1 = selectedStars.get(i).y;
        float x2 = selectedStars.get(i+1).x;
        float y2 = selectedStars.get(i+1).y;
        float rad2= selectedStars.get(i+1).radius;
   
        line(x1,y1,x2,y2);
        fill(0,255,0);
        text(i+2,x2-rad2*3,y2+rad2);
      }
    }
  }
}

void starInfo()
{
  float midpointLeft =((halfway+rightSplit)/2);
  float midpointRight= ((rightSplit+x2)/2);
  String title = "Selection ";
  String name = "Name: ";
  String distance = "Distance: ";
  String current  = "Current System : ";
  String currMag = "Absolute Magnitude: ";
  String coords = "Coordinates: ";
  String hab = "Habitable: ";
  String gliese = "Gliese Name: ";
  String spectrum = "Spectral Class: ";
  String age = "Age: ";
  String constellation = "Constellation: ";
  String sRadius = "Solar Radius: ";
  float rightY = 1;
  float yVal = y1+(border/2);
  
  textFont(arcon);
  
  //Current system data
  fill(255);
  textSize(windowWidth/90);
  text(current,x1+border,y1+windowHeight-(border*0.75));
  text(currentStar.DisplayName,x1+border+textWidth(current),y1+windowHeight-(border*0.75));
  text(hab + currentStar.hab,(x1+border),(y1+windowHeight-(border*0.50)));
  text(coords + "("
      +(currentStar.Xg) + ", "
      +(currentStar.Yg) + ", "
      +(currentStar.Zg) + ")"
      ,(x1+border),(y1+windowHeight-(border*0.25)));
  textSize(windowWidth/70);
  
  if(selectedStars.get(0) == null)
  {
    text("Select a star to see its information",halfway+20,yVal);
  }
  textSize(width/65);
  //draw the left side (first two) sets of info 
  for(int i = page;i<page+2;i++)
  {
    
    
    //again due to the way selectedStars works I need a seperate if to make sure it still draws even if there is only one selected star
    if(selectedStars.get(i-1) != null && selectedStars.get(i) == null)
    {
      //TITLES
      fill(255);
      text(title+i,midpointLeft-(textWidth(title)/2),rightY*yVal);
      text(name,halfway+20,rightY*yVal+textAscent()*1.3);    
      text(distance, halfway+20,rightY*yVal+textAscent()*2.6);
      text(currMag,halfway+20,rightY*yVal+textAscent()*3.9);
      text(coords,halfway+20,rightY*yVal+textAscent()*5.2);
      text(hab,halfway+20,rightY*yVal+textAscent()*6.5);
      text(gliese,halfway+20,rightY*yVal+textAscent()*7.8);
      text(spectrum,halfway+20,rightY*yVal+textAscent()*9.1);
      text(age,halfway+20,rightY*yVal+textAscent()*10.4);
      text(constellation,halfway+20,rightY*yVal+textAscent()*11.7);
      text(sRadius,halfway+20,rightY*yVal+textAscent()*13);
      
      //INFO
      fill(30,144,255); 
      text(selectedStars.get(i-1).DisplayName,halfway+20+textWidth(name),rightY*yVal+textAscent()*1.3);  
      text((String.format("%.3f",selectedStars.get(i-1).currDist)),halfway+20+textWidth(distance),rightY*yVal+textAscent()*2.6);
      text("Parsecs",halfway+95+textWidth(distance),rightY*yVal+textAscent()*2.6);
      text(selectedStars.get(i-1).AbsMag,halfway+20+textWidth(currMag),rightY*yVal+textAscent()*3.9);
      text("("
        +(selectedStars.get(i-1).Xg) + ", "
        +(selectedStars.get(i-1).Yg) + ", "
        +(selectedStars.get(i-1).Zg) + ")"
        ,(halfway+20+textWidth(coords)),rightY*yVal+textAscent()*5.2);
      text(selectedStars.get(i-1).hab,(halfway+20+textWidth(hab)),rightY*yVal+textAscent()*6.5);
      text(selectedStars.get(i-1).Gliese,(halfway+20+textWidth(gliese)),rightY*yVal+textAscent()*7.8);
      text(selectedStars.get(i-1).Spectrum,(halfway+20+textWidth(spectrum)),rightY*yVal+textAscent()*9.1);
      text(selectedStars.get(i-1).Age,(halfway+20+textWidth(age)),rightY*yVal+textAscent()*10.4);
      text(selectedStars.get(i-1).Constellation,(halfway+20+textWidth(constellation)),rightY*yVal+textAscent()*11.7);
      text(selectedStars.get(i-1).SolarRadius,(halfway+20+textWidth(sRadius)),rightY*yVal+textAscent()*13);
    }
    else if(selectedStars.get(i-1) != null && selectedStars.get(i) != null)
    {
      //TITLE
      fill(255);
      text(title+i,midpointLeft-(textWidth(title)/2),rightY*yVal);
      text(name,halfway+20,rightY*yVal+textAscent()*1.3);    
      text(distance, halfway+20,rightY*yVal+textAscent()*2.6);
      text(currMag,halfway+20,rightY*yVal+textAscent()*3.9);
      text(coords,halfway+20,rightY*yVal+textAscent()*5.2);
      text(hab,halfway+20,rightY*yVal+textAscent()*6.5);
      text(gliese,halfway+20,rightY*yVal+textAscent()*7.8);
      text(spectrum,halfway+20,rightY*yVal+textAscent()*9.1);
      text(age,halfway+20,rightY*yVal+textAscent()*10.4);
      text(constellation,halfway+20,rightY*yVal+textAscent()*11.7);
      text(sRadius,halfway+20,rightY*yVal+textAscent()*13);
    
      //INFO
      fill(30,144,255); 
      text(selectedStars.get(i-1).DisplayName,halfway+20+textWidth(name),rightY*yVal+textAscent()*1.3);  
      text((String.format("%.3f",selectedStars.get(i-1).currDist)),halfway+20+textWidth(distance),rightY*yVal+textAscent()*2.6);
      text("Parsecs",halfway+95+textWidth(distance),rightY*yVal+textAscent()*2.6);
      text(selectedStars.get(i-1).AbsMag,halfway+20+textWidth(currMag),rightY*yVal+textAscent()*3.9);
      text("("
        +(selectedStars.get(i-1).Xg) + ", "
        +(selectedStars.get(i-1).Yg) + ", "
        +(selectedStars.get(i-1).Zg) + ")"
        ,(halfway+20+textWidth(coords)),rightY*yVal+textAscent()*5.2);
      text(selectedStars.get(i-1).hab,(halfway+20+textWidth(hab)),rightY*yVal+textAscent()*6.5);
      text(selectedStars.get(i-1).Gliese,(halfway+20+textWidth(gliese)),rightY*yVal+textAscent()*7.8);
      text(selectedStars.get(i-1).Spectrum,(halfway+20+textWidth(spectrum)),rightY*yVal+textAscent()*9.1);
      text(selectedStars.get(i-1).Age,(halfway+20+textWidth(age)),rightY*yVal+textAscent()*10.4);
      text(selectedStars.get(i-1).Constellation,(halfway+20+textWidth(constellation)),rightY*yVal+textAscent()*11.7);
      text(selectedStars.get(i-1).SolarRadius,(halfway+20+textWidth(sRadius)),rightY*yVal+textAscent()*13);
    }
    rightY+=1.4;
  }
  
  rightY = 1; //reset rightY for y value incrementing 
  
  //for drawing right side (second 2) sets of info
  for(int j=page+2;j<page+4;j++)
  {
    
    //again due to the way selectedStars works I need a seperate if to make sure it still draws even if there is only one selected staR
    if(selectedStars.get(j-1) != null && selectedStars.get(j) == null)
    {
      //TITLES
      fill(255);
      text(title+j,midpointRight-(textWidth(title)/2),rightY*yVal);
      text(name,rightSplit+20,rightY*yVal+textAscent()*1.2);
      text(distance, rightSplit+20,rightY*yVal+textAscent()*2.4);
      text(currMag,rightSplit+20,rightY*yVal+textAscent()*3.6);
      text(coords,rightSplit+20,rightY*yVal+textAscent()*4.8);
      text(hab,rightSplit+20,rightY*yVal+textAscent()*6);
      text(gliese,rightSplit+20,rightY*yVal+textAscent()*7.2);
      text(spectrum,rightSplit+20,rightY*yVal+textAscent()*8.4);
      text(age,rightSplit+20,rightY*yVal+textAscent()*9.6);
      text(constellation,rightSplit+20,rightY*yVal+textAscent()*10.8);
      text(sRadius,rightSplit+20,rightY*yVal+textAscent()*12);
      
      //INFO
      fill(30,144,255); 
      text(selectedStars.get(j-1).DisplayName,rightSplit+20+textWidth(name),rightY*yVal+textAscent()*1.2);  
      text((String.format("%.3f",selectedStars.get(j-1).currDist)),rightSplit+20+textWidth(distance),rightY*yVal+textAscent()*2.4);
      text("Parsecs",rightSplit+95+textWidth(distance),rightY*yVal+textAscent()*2.4);
      text(selectedStars.get(j-1).AbsMag,rightSplit+20+textWidth(currMag),rightY*yVal+textAscent()*3.6);
      text("("
        +(selectedStars.get(j-1).Xg) + ", "
        +(selectedStars.get(j-1).Yg) + ", "
        +(selectedStars.get(j-1).Zg) + ")"
        ,(rightSplit+20+textWidth(coords)),rightY*yVal+textAscent()*4.8);
      text(selectedStars.get(j-1).hab,(rightSplit+20+textWidth(hab)),rightY*yVal+textAscent()*6);
      text(selectedStars.get(j-1).Gliese,(rightSplit+20+textWidth(gliese)),rightY*yVal+textAscent()*7.2);
      text(selectedStars.get(j-1).Spectrum,(rightSplit+20+textWidth(spectrum)),rightY*yVal+textAscent()*8.4);
      text(selectedStars.get(j-1).Age,(rightSplit+20+textWidth(age)),rightY*yVal+textAscent()*9.6);
      text(selectedStars.get(j-1).Constellation,(rightSplit+20+textWidth(constellation)),rightY*yVal+textAscent()*10.8);
      text(selectedStars.get(j-1).SolarRadius,(rightSplit+20+textWidth(sRadius)),rightY*yVal+textAscent()*12);
        
    }
    else if(selectedStars.get(j-1) != null && selectedStars.get(j) != null)
    {
      //TITLES
      fill(255);
      text(title+j,midpointRight-(textWidth(title)/2),rightY*yVal);
      text(name,rightSplit+20,rightY*yVal+textAscent()*1.2);
      text(distance, rightSplit+20,rightY*yVal+textAscent()*2.4);
      text(currMag,rightSplit+20,rightY*yVal+textAscent()*3.6);
      text(coords,rightSplit+20,rightY*yVal+textAscent()*4.8);
      text(hab,rightSplit+20,rightY*yVal+textAscent()*6);
      text(gliese,rightSplit+20,rightY*yVal+textAscent()*7.2);
      text(spectrum,rightSplit+20,rightY*yVal+textAscent()*8.4);
      text(age,rightSplit+20,rightY*yVal+textAscent()*9.6);
      text(constellation,rightSplit+20,rightY*yVal+textAscent()*10.8);
      text(sRadius,rightSplit+20,rightY*yVal+textAscent()*12);
      
      //INFO
      fill(30,144,255); 
      text(selectedStars.get(j-1).DisplayName,rightSplit+20+textWidth(name),rightY*yVal+textAscent()*1.2);  
      text((String.format("%.3f",selectedStars.get(j-1).currDist)),rightSplit+20+textWidth(distance),rightY*yVal+textAscent()*2.4);
      text("Parsecs",rightSplit+95+textWidth(distance),rightY*yVal+textAscent()*2.4);
      text(selectedStars.get(j-1).AbsMag,rightSplit+20+textWidth(currMag),rightY*yVal+textAscent()*3.6);
      text("("
        +(selectedStars.get(j-1).Xg) + ", "
        +(selectedStars.get(j-1).Yg) + ", "
        +(selectedStars.get(j-1).Zg) + ")"
        ,(rightSplit+20+textWidth(coords)),rightY*yVal+textAscent()*4.8);
      text(selectedStars.get(j-1).hab,(rightSplit+20+textWidth(hab)),rightY*yVal+textAscent()*6);
      text(selectedStars.get(j-1).Gliese,(rightSplit+20+textWidth(gliese)),rightY*yVal+textAscent()*7.2);
      text(selectedStars.get(j-1).Spectrum,(rightSplit+20+textWidth(spectrum)),rightY*yVal+textAscent()*8.4);
      text(selectedStars.get(j-1).Age,(rightSplit+20+textWidth(age)),rightY*yVal+textAscent()*9.6);
      text(selectedStars.get(j-1).Constellation,(rightSplit+20+textWidth(constellation)),rightY*yVal+textAscent()*10.8);
      text(selectedStars.get(j-1).SolarRadius,(rightSplit+20+textWidth(sRadius)),rightY*yVal+textAscent()*12);
     
    }
    
    rightY+=1.4;
  }
}

void planetInfo()
{
  String radius = "Orbit Radius: ";
  String size = "Planet Radius: ";
  String probeText = "Probe Launched";
  String probeText2 = "See 'Probes' menu for data";
  String click = "Select a planet";
  noLights();
  fill(0,0,57);
  stroke(234,223,104);
  planetInfoBox.drawBox();
  
  fill(255);
  textSize(windowWidth/30);
  text("System: " +currentStar.DisplayName,x1+(windowWidth/2)-(textWidth("System: "+currentStar.DisplayName)/2),y1+(textAscent()-textDescent()));
  
  
  for(int i=0;i<planets.size();i++)
  {
    if(planets.get(i).clicked == true)
    {
      select = planets.get(i);
      planets.get(i).clicked = false;
    }    
  }
  
  fill(255,0,0);
  

  
  if(select != null)
  {
    textFont(arcon,30);
    fill(255);
    text(select.name,PIBX+(PIBW/2)-(textWidth(select.name)/2),PIBY+(textAscent()-textDescent()));
    stroke(255);
    strokeWeight(3);
    line(PIBX+(PIBW/2)-(textWidth(select.name)/2),PIBY+(textAscent()-textDescent())+5,PIBX+(PIBW/2)+(textWidth(select.name)/2),PIBY+(textAscent()-textDescent())+5);
    
    textSize(windowWidth/110);
    text(radius,PIBX+20,PIBY+100);
    text(select.orbitRadius, PIBX+20+textWidth(radius),PIBY+100);
    
    text(size,PIBX+20,PIBY+130);
    text(select.size,PIBX+20+textWidth(size),PIBY+130);
    
    if(probe.value == 1 || select.probeCheck == true)
    {
      textSize(PIBW/10);
      fill(0,255,0);
      text(probeText,PIBX+(PIBW/2)-textWidth(probeText)/2,PIBY+(PIBH*0.5));
      textSize(PIBW/15);
      text(probeText2,PIBX+(PIBW/2)-textWidth(probeText2)/2,PIBY+(PIBH*0.5)+textAscent());
      select.probeCheck = true;
      probe.value = 0;
    }
    else
    {          
      probe.drawButton(PIBX+(PIBW/4),PIBY+PIBH*0.5,PIBW/2,PIBH/8,150,255); 
    }

    
    pushMatrix();
    translate(PIBX+(PIBW/2),PIBY+PIBH*0.75);

    shape(select.planet);
    popMatrix();
    
    
  }
  else
  {
    textFont(arcon,PIBW/10);
    fill(255);
    text(click,PIBX+(PIBW/2)-(textWidth(click)/2),PIBY+(textAscent()-textDescent()));
  }
  
}

void probeInfo()
{
  probeInfo selectedProbe = new probeInfo();
  for(int i=0;i<probes.size();i++)
  {
    if(probes.get(i).clicked == true)
    {
      if(probes.get(i).texture == earth)
      {
        selectedProbe = probeinfo.get(0);
      }
      
      if(probes.get(i).texture == ice)
      {
        selectedProbe = probeinfo.get(1);
      }
      
      if(probes.get(i).texture == dust)
      {
        selectedProbe = probeinfo.get(2);
      }
     
      if(probes.get(i).texture == jupiter)
      {
        selectedProbe = probeinfo.get(3);
      }
    }
  }
  
  fill(0,0,57);
  stroke(234,223,104);
  
  float infoX = rightSplit;
  float infoY = y1+border/2;
  float infoW = windowWidth/5;
  float infoH = windowHeight/2;
  float half = infoX+(infoW/2);
  float top = infoY+border/2;
  
  String classification = "Classification: "+selectedProbe.type;
  String inhabited = "Inhabited: "+selectedProbe.inhabited;
  String intelligent = "Intelligent: "+selectedProbe.intelligent;
  String temperature = "Temperature: "+selectedProbe.temperature+"C";
  String oxygen = "Oxygen: " +selectedProbe.oxygen+"%";
  String nitrogen = "Nitrogen: " +selectedProbe.nitrogen+"%";
  String carbon = "Carbon Dioxide: " +selectedProbe.carbonDioxide+"%";
  String other = "Other: " +selectedProbe.other+"%";
  String breathe = "Breathable: " +selectedProbe.breathable;
  String water = "Water: " +selectedProbe.water;
  
  box probeBox = new box(infoX,infoY,infoW,infoH,0.9,0.9);
  probeBox.drawBox();
  
  fill(255);
  textSize(width/90);
  text(classification,half-textWidth(classification)/2,top+textAscent()*0);
  text(inhabited,half-textWidth(inhabited)/2,top+textAscent()*2);
  text(intelligent,half-textWidth(intelligent)/2,top+textAscent()*4);
  text(temperature,half-textWidth(temperature)/2,top+textAscent()*6);
  text(oxygen,half-textWidth(oxygen)/2,top+textAscent()*8);
  text(nitrogen,half-textWidth(nitrogen)/2,top+textAscent()*10);
  text(carbon,half-textWidth(carbon)/2,top+textAscent()*12);
  text(other,half-textWidth(other)/2,top+textAscent()*14);
  text(breathe,half-textWidth(breathe)/2,top+textAscent()*16);
  text(water,half-textWidth(water)/2,top+textAscent()*18);
  
  rad.drawRadar();
}

void mouseWheel(MouseEvent event)
{
 e = event.getCount(); 
}

void mouseDragged()
{
  float k = rot;
  float r = map(mouseX,0,width,0,TWO_PI);
  rot = lerp(k,r,0.05);
}

void mousePressed()
{
  for(int i=0; i<stars.size();i++)
  {    
    stars.get(i).isSelected();
    
    //if star i is selected
    if(stars.get(i).selected == true)
    {  
      if(selected == -1)
      {
        selected = i;
        break;
      }
    }   
  }
}