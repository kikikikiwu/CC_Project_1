class Dotline{
  PVector origin; //intial location of each instance
  int index;
  int life; //life of each turn
  int totalLife;
  PVector velocity = new PVector (0, 0);
  int previousDir;
  float fade;
  
  Dotline(float xloc, float yloc, int index_){ //constructor
    origin = new PVector (xloc, yloc);
    index = index_;
    life = 0;
    totalLife = (int)random(50,500);
  }

    void drawLine(){ //update location
     float turn = 0.5;
     
     if (life == 0){  //change directions when each turn is done
        int direction = (int)random(0, 4); 
        
      //check direction, no backward
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
        
   //life of each turn
     life = (int)random(1,60);
      }
    
   //move the dots
     origin.add(velocity);
      
   //life reduces 1 frame per dot is drawn
     life -= 1;
     totalLife -= 1;
     }
    
    void display(){ 
      int lineColor = index % 4;
      fade = 50 % (index+1);
            println(dots.size(), index, fade);
      if (lineColor == 0){
        fill(mouseX/3,mouseY/3,255, fade); 
      } else if (lineColor == 1){
        fill(mouseX/3,80,mouseY/3, fade); 
      } else if (lineColor == 2){
        fill(255,mouseY/2,mouseX/2, fade); 
      } else if (lineColor == 3){
        fill(mouseY/2,mouseX/2,180, fade); 
      }
 
   
      
      noStroke();
      ellipse(origin.x, origin.y, 3, 3);
    }
}
