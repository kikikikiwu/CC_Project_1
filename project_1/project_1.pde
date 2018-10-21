/*
Current Idea: automately draw an automated maze pattern
Directions: random among left, right and down with no inteception
*/

//create array for target directions
PVector [] targets = new PVector [20];
//create array for starting points
PVector [] origins = new PVector [20];
float ox, oy;

void setup(){
  size (400,400);
  background(255);

//initialize arrays
    for (int i = 0; i < origins.length; i++){
    targets[i] = new PVector();
    origins[i]= new PVector();;
  }
}

void draw(){
//store data into array
  for (int i = 0; i < origins.length; i++){
  origins[i] = new PVector (i*(width/origins.length), 0);
  move(origins[i], targets[i]);  
//pass the original location data from "move" to "drawLine"
  drawLine(origins[i]);
  }
}

void move(PVector origins_, PVector targets_){
//acceleration
  PVector acc = new PVector (random(-3,3),1);
//update original locations for every move
  origins_.add(targets_);
  targets_.add(acc);
}

void drawLine(PVector origins_){
  fill(0,0,255);
  noStroke();
  ellipse(origins_.x, origins_.y, 5,5);
}
