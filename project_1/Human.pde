class Human{
  float xloc;
  float yloc;
  float size;
  float f;
  float birthFrame;
  
  Human(float xloc_, float yloc_, float size_, float index_){  //constructor
    xloc = xloc_;
    yloc = yloc_;
    size = size_;
    f = index_/10;
}    


void exist(){
    fill(205,0,0,f);
    stroke(205,100,100,f/2);
    strokeWeight(3);
    ellipse(xloc, yloc, size, size);
 
  }
}
