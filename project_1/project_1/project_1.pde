//QUESTION
//How can I make the dots keep moving and become lines?

/*
Current Idea: automately draw an automated maze pattern
Directions: random among left, right and up with no inteceptions
*/

//=================CODE============================

//array of line starters' lcoations
PVector [] origins = new PVector [20];
//create dots that constitute the moving lines
Dot [] dots = new Dot [20];
//record the life in frames of each line's movement
int [] frameCounter = new int [20];


void setup(){
  size (400,400);
  background(255);

//initialize arrays
    for (int i = 0; i < origins.length; i++){
    origins[i] = new PVector(random(0,width), random(0,height));
  }
}

void draw(){
  for (int i = 0; i < origins.length; i++){ 
    dots[i] = new Dot (origins[i]); //create the dots instance and passing para.
    
    dots[i].drawLine();
    dots[i].display();
  }
}

class Dot{
  PVector loc; //location of each instance
  int life; //life of each line
  
  Dot(PVector origins_){ //constructor
    loc = origins_;
    life = 0;
  }

    void drawLine(){ //update location
     PVector velocity = new PVector (0, 0);
     int turn = 1;
     int previousDir;
     
      while (life == 0){  //change directions
        int direction = (int)random(0, 4); 
        
        if (direction == 0){ //direction: right
          velocity = new PVector (turn, 0);
        }
        else if (direction == 1){ //direction: up
          velocity = new PVector (0, -turn);
        }
        else if (direction == 2){ //direction: left
          velocity = new PVector (-turn, 0);
        }
        else if (direction == 3){ //direction: down
          velocity = new PVector (0, turn);
        }
        
        previousDir = direction;
        if (abs(direction - previousDir) == 2){ //opposite direction = move backward
          direction = (direction + 1) % 4; //change direction while keep the index between 0 to 4
        }
        
   //life of each line
     life = (int)random(0,20);
     
   //move the dots
     loc.add(velocity);
      }
   //life reduces 1 frame per dot is drawn
     life-=1;
     }
    
    void display(){
      fill(0,0,255);
      noStroke();
      ellipse(loc.x, loc.y, 3, 3);     
    }
}
