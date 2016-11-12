/*Author: Ben Ryan
  Date started: 29/10/16
  Description: Assignment for Object Oriented Programming DT228
 */
 
 //BUTTON VARIABLES
ArrayList<button> menu = new ArrayList<button>();
String[] buttonNames = {"Star Map","Sytem Map","Ship Status","Planet Data","Lock System"};


//STAR VARIABLES
ArrayList<Star> stars = new ArrayList<Star>();
Table t;

//MAIN WINDOW VARIABLE
int windowState = 0;
float x1;
float y1;
float x2;
float y2;
 
float windowWidth;
float windowHeight;

//STAR MAP GRID VARIABLES
float halfway;
float border = 100;

//PLOT STAR VARIABLES
float starX1;
float starX2;
float starY1;
float starY2;

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

//IMAGES
PImage bg;



void setup()
{
  fullScreen(P3D,2);
  
  for(int i=0 ;i<5;i++)
  {
   button pos = new button(buttonNames[i],0); 
   menu.add(pos);
  }
 //FONTS
  spaceAge = createFont("font1.ttf",50);
  arcon = createFont("font5.otf",50);
  
  //IMAGES
  bg = loadImage("background.tif");
  icarus = new Logo(logoOpacity,0,0,"icarus.png");
  
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
  
  //STAR MAP GRID VARIABLES
  halfway = x1+(windowWidth/2);
  
  //PLOT STAR VARIABLES
  starX1 = x1+border;
  starX2 = halfway-border;
  starY1 = y1+border;
  starY2 = y1+windowHeight-border;
  
  
  //FUNCTION CALLS
  loadData();
}

void draw()
{
  textFont(spaceAge);
  background(0);
  drawMenu();
  drawMainWindow();
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
  box mainWindow = new box();
 
  //main window colours
  noFill();
  stroke(234,223,104);
  
  //draw box
  mainWindow.drawBox(x1,y1,windowWidth,windowHeight,0.95,0.9);

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
 //if buttons are clicked but window is still locked print locked, change to a padlock symbol later
 else
 {
  for(int i =0;i<menu.size();i++)
  {
   if(menu.get(i).value == 1)
   {
    text("Locked",width/4,height/4); 
   }
  }
 }
 
 windowState =3;
 //controlling which window state is being drawn
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
    textFont(arcon,70);
    String ready = "Welcome Back Commander";
    drawDots();
   
    text(ready,(width/2)-(textWidth(ready)/2),height/2);
    textFont(spaceAge,50);
    break;
  }
  case 3://first menu item
  {
    line(x1+(windowWidth/2),y1,x1+(windowWidth/2),y1+windowHeight);
   
    drawGrid(x1,y1,windowWidth,windowHeight);
    plotStars();
    starInfo();
    
    break;
  }
  case 4://second menu item
  {
    drawDots();
    text("in second option",width/2,height/2);
    break;
  }
  case 5://third menu item
  {
    drawDots();
    text("in third option",width/2,height/2);
    break;
  }
  case 6://fourth menu item
  {
    drawDots();
    text("in fourth option",width/2,height/2);
    break;
  }
  case 7://lock window
  {
    //resetting variables so system can be locked
    windowState = 0;
    boxOp = 150;
    textOp = 255;
    icarus.opacity = 0;
    check =false;
    break;
  }
  default://no window state selected
  {
    drawDots();
    text("Error 404 : Page not found",width/2,height/2); 
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
  box loginWindow = new box();
  button submitButton = new button("Login",0);
  
  //colour and weight of login box
  stroke(234,223,104,boxOp);
  strokeWeight(3);
  fill(100,0,0,boxOp);
  
  //draw the login box
  loginWindow.drawBox(loginX,loginY,loginWidth,loginHeight,0.9,0.8);

  //draw the box title
  fill(255,255,255,textOp);
  textSize(20);
  text(loginTitle,safeX,safeY);
  line(safeX,safeY*1.01,safeX+textWidth(loginTitle),safeY*1.01);
  
  //draw username box
  textSize(17);
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

void drawGrid(float x1, float y1, float windowWidth, float windowHeight)
{
  //gap between lines
  float lineGapX = ((windowWidth/2)-(border*2))/10;
  float lineGapY =((windowHeight)-border*2)/10;
  
  //for labeling the sides (parsecs)
  int i = -5;
  
  //line thickness and font
  strokeWeight(1);
  textFont(arcon,15);

  //drawing vertical lines
  for(float x = x1+border; x <= halfway-(border-1); x+=lineGapX)
  {
   line(x,y1+border,x,y1+windowHeight-border); 
   text(i++,x,y1+border-20);
  }
  
  //reset i for labelling the other side
  i = -5;
  
  //drawing horizontal lines
  for(float y = y1+border; y <= y1+windowHeight-border;y+=lineGapY)
  {
   line(x1+border,y,halfway-border,y); 
   text(i++,x1+border-30,y);
  }
}

void loadData()
{
  //load table from file containing star data
  t = loadTable("HabHYG15ly.csv","header");
 
  //create object for each star and store them in and arraylist
  for(TableRow row:t.rows())
  {
    Star s = new Star(row,starX1,starX2,starY1,starY2);
    stars.add(s);
  }
}

//plotting stars on the grid 
void plotStars()
{
  for(int i=0;i<stars.size();i++)
  {
    String starName = stars.get(i).DisplayName;
      
    //drawing greed cross at each stars location
    stroke(0,255,0);
    line(stars.get(i).x-5,stars.get(i).y,stars.get(i).x+5,stars.get(i).y);
    line(stars.get(i).x,stars.get(i).y-5,stars.get(i).x,stars.get(i).y+5);
      
    //drawing red circle around each stars location the size of the star
    noFill();
    stroke(255,0,0);
    ellipse(stars.get(i).x,stars.get(i).y,stars.get(i).AbsMag,stars.get(i).AbsMag);
      
    //displaying the stars name to the right of each star
   // fill(255);
    text(starName,stars.get(i).x+10,stars.get(i).y);
  }
}

void starInfo()
{
  Star star1 = null;
  Star star2 = null;
  for(int i=0;i<stars.size();i++)
  {
    stars.get(i).isSelected();
   
    //if current star is selected and both star1 and star2 are not occupied 
    if(stars.get(i).selected == true && star1 == null && star2 == null)
    {
      //assign current star to star1
      star1 = stars.get(i);
      line(star1.x,star1.y,mouseX,mouseY);
    }
    //if current star is select and star1 is occupied and star2 is not
    else if(stars.get(i).selected == true && star1 != null && star2 == null)
    {
      //assign current star to star2
      star2 = stars.get(i); 
      line(star1.x,star1.y,star2.x,star2.y);
    }
    //otherwise if star is not selected
    else
    {
        //reset star1 and star2 to null
        star1 = null;
        star2 = null;
    
    }
  }
  
  
}