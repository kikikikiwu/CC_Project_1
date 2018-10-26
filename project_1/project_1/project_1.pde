/*
Current Idea: automately draw an automated maze pattern
Directions: random among left, right and up with no inteceptions
*/

//=================CODE============================

//create dots that constitute the moving lines
Dot [] dots = new Dot [20];
//record the life in frames of each line's movement
int [] frameCounter = new int [20];


void setup(){
  size (400,400);
  background(255);

//initialize arrays
  for (int i = 0; i < dots.length; i++){
    dots[i] = new Dot (random(0, width), random(0, height)); //create the dots instance and passing para.
  }
}

void draw(){
  for (int i = 0; i < dots.length; i++){ 
    dots[i].drawLine();
    dots[i].display();
    
    //check if dots die
    if (dots[i].totalLife == 0){
    dots[i] = new Dot (random(0, width), random(0, height));
    }
  }
}

class Dot{
  PVector origin; //intial location of each instance
  int life; //life of each turn
  int totalLife;
  PVector velocity = new PVector (0, 0);
  int previousDir;
  
  Dot(float xloc, float yloc){ //constructor
    origin = new PVector (xloc, yloc);
    life = 0;
    totalLife = (int)random(50,200);
  }

    void drawLine(){ //update location
     int turn = 1;
     
     if (life == 0){  //change directions
        int direction = (int)random(0, 4); 
        
      //check direction
      if (abs(direction - previousDir) == 2){ //opposite direction = move backward
          direction = (direction + 1) % 4; //change direction while keep the index between 0 to 4
         }
        
       if (direction == 0){ //direction: right
         velocity = new PVector (turn, 0);
          
       }else if (direction == 1){ //direction: up
         velocity = new PVector (0, -turn);
          
       }else if (direction == 2){ //direction: left
         velocity = new PVector (-turn, 0);
          
       }else if (direction == 3){ //direction: down
         velocity = new PVector (0, turn);
       }
        
        previousDir = direction; //store the current direction as previous direction
        
   //life of each line
     life = (int)random(1,20);
      }
    
    //move the dots
     origin.add(velocity);
      
   //life reduces 1 frame per dot is drawn
     life -= 1;
     totalLife -= 1;
     }
    
    void display(){
      fill(0,0,255,10);
      noStroke();
      ellipse(origin.x, origin.y, 3, 3);     
    }
}
