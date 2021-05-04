//COLORING ROUTINES


color somecolor() {
        return goodcolor[int(random(numpal))];
}

//------------------------------------------------------------------------------------------------------------------

void takecolor(String fn) {
        PImage b;
        b = loadImage(fn);
        image(b,0,0,width,height);
        b.loadPixels();
      
        loadPixels();
        for (int x=0;x<b.width;x++){
        for (int y=0;y<b.height;y++) {
//x = b.width;
//y = b.height;
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
        
}

