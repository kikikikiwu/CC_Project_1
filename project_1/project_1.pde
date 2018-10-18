//array of ellipse locations
  int[] countNum = new int [100]; 
  float[] xpos = new float [100];
  float[] ypos = new float [100];
  int index;
  
//ellipse data
  float x = 10;
  float y = 10;
  float r = 10;
  

void setup(){
  size(800,800);
  //leave moving trace
  background(255);
  
  //initialize the array
  for(int i=0; i<countNum.length; i++){
    countNum[i]=i;
    index=countNum[i];
  }
  for (int i=0; i<countNum.length; i++){
    xpos[i]=0;
    ypos[i]=0;
  }
}

void draw(){
  //new location values of each array slot shift down
   for (int i=0; i<countNum.length; i++){
     xpos[i] = xpos[i+1];
     ypos[i] = ypos[i+1];
   }
   
 //update new value in the last array slot for passing down
  float newX;
  float newY;
  float stepSize = random (1,5);
  float currentX = newX;
  float currentY = newY;
  
  newY = ypos[countNum.length - 1];
   
  //new location directions are decided randomly
  //create cases for the 4 direction options
  String[] directions = {"east", "south", "west", "north"};
  String r_direction = directions[(int)random(1,4)];
  
    switch(r_direction){
      case "east":
        newX = currentX + stepSize;
        xpos[countNum.length - 1] = newX;
      break;
      case "south":
      
      break;
      case "west":
      break;
      case "north":
        ypos[countNum.length -1] = newY;
      break;
    }
    
    fill(255-index*5);
    stroke(1);
    ellipse(x, y,r,r);

}

//the ellispe trace will fade out at its "tails"
//and change color when it intersects with others
//ellispe will not move backward
//(newX,newY) doesn't intersect with the (previous X, previousY)
//mouse press will change the directions as well
