//  COLORING ROUTINES
color somecolor() {
          return goodcolor[int(random(numpal))];
}

//------------------------------------------------------------------------------------------------------------------
void takecolor() {
          loadPixels();
          for (int x=0;x<b.width;x++){
          for (int y=0;y<b.height;y++) {
  
                    x = int(random(b.width));
                    y = int(random(b.height));

                    int pos = (y * b.height) + x;
                    color c = b.pixels[pos];
                        
                    boolean exists = false;
          
                    for (int n=0;n<numpal;n++) {
                          if (c==goodcolor[n]) {
                                    exists = true;
                                    break;
                          }    
                    }
                
                    if (!exists) {
                          if (numpal<maxpal) {
                            goodcolor[numpal] = c;
                            numpal++;
                          }  
                    }
                    
        }
        }
          for (int x=0;x<8;x++) {
                goodcolor[x]=#FFFFFF;
         }
}

//------------------------------------------------------------------------------------------------------------------
void fading(int h, int s, int b, float a) {
          colorMode(HSB, 360, 100, 100, 100);
          noStroke();
          fill(h, s, b, a);
          rectMode(CORNER);
          rect(0, 0, width, height);
}

//------------------------------------------------------------------------------------------------------------------
void changeSound(int number){
          switch (number) {
                case 1:
                      soundType = 1;
                      break; 
                case 2:
                      soundType = 2;
                      break;
                default: 
                      soundType = 0;
                      break;
          }
}

//------------------------------------------------------------------------------------------------------------------
int soundEffect(){
          return soundType;
}



// h.nishihata   July, 2013
// Tokyo, Japan
