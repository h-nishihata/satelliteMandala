
class MyLayer extends Layer {

  MyLayer(PApplet parent) {
    super(parent); // This is necessary!
  }
  
  
  void setup(){
               
 
  }

void draw(){
//  move pens  
          for(int j=0; j<num; j++){
                pens[j].render();
                pens[j].move();
                

          }
               for (int s=0; s<num_eraser; s++) {
                  erasers[s].render();
          }
//                              background(255,0);
//                                   // clear the background every time, but be transparent
//                                  // now draw something
//                                  int x = int(random(width));
//                                      int y = int(random(height));
//                              fill(0,0,100);
//                              rect(x,y,50,50);
}
}
