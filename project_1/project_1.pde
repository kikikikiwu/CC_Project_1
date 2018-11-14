/*
Current Idea: automately draw an automated maze pattern
Directions: random among left, right and up with no inteceptions
*/

//=================CODE============================

//create dots that constitute the moving lines
ArrayList<Dotline> dots = new ArrayList<Dotline> ();

//create an array to store dots for fading effect
int fade = 0;
int i_;
Human [] history = new Human [20];
float [] xloc = new float [20];
float [] yloc = new float [20];
float [] ts = new float [20];
float [] birthFrame = new float [50];

Dotline dt;
Human human;

void setup(){
  size (400,400);
  background(255);

//initialize arrays, create initial locations
  for (int i = 0; i < 20; i++){
    dots.add(new Dotline(random(width), random(height), i));
  }
  for (int i = 0; i < history.length; i++){
    history [i] = new Human (xloc[i], yloc[i], ts[i], i);
  }
}

void draw(){
  for (int i = 0; i < dots.size(); i++){
    dt = dots.get(i); // get dt[i]
    dt.drawLine();
    dt.display();
    
    //check if dots die, new starting locations
    if (dt.totalLife == 0){
      dt.velocity = new PVector (0,0);
      dots.add(new Dotline(random(width), random(height), dots.size()));
      dots.remove(0);      
     //println("die");
    }
  }

     //the index number will be limited under 50
    if (dots.size() > 50){
      dots.remove(0);
    }
    
  for (int i = 0; i < history.length; i++){ 
    float resetZero = frameCount-birthFrame[fade];
    human = new Human(xloc[i], yloc[i], ts[i], resetZero);
    human.exist();
  }
}

void mousePressed(){
  i_ = i_ % xloc.length; //pass i_ to i above
  
  //click mouse to pass location data
  xloc[i_] = mouseX;
  yloc[i_] = mouseY;
  
  //associate fade rate with the frame, and reset birthframe when mouse clicked
  fade = fade % birthFrame.length; //less one per click
  birthFrame[fade] = frameCount;  //store the current frame for reset
  
  ts[i_] = (birthFrame[fade] % 10) +1; //size, avoid 0
  
  dots.add(new Dotline(mouseX, mouseY, dots.size()));
    //dots.remove(0);
}
   
void keyPressed(){ //eraser   
  size (400,400);
  background(255);
  ts[i_] = 0; //make the remain one transparent
}
