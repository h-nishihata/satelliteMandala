int i = 1;

class Layer_map extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_map(PApplet parent) {
    super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup() {

}

//------------------------------------------------------------------------------------------------------------------
void draw() {
 
          if(waiting_5 > 50 && waiting_7 < 1){
                loadPixels();
                for (int s=0;s<1000;s++) {
                      int x = int(random(screen.width));
                      int y = int(random(screen.height));
                      int pos = (y * b.width) + x;
                      pixels[pos] = color(0,0,100,0);
                }
                updatePixels();
          }
          

          //                if(i == 4) i=0;         
          //                b =loadImage(i+".png");
          ////                if(b==null){
          ////                      i=0;
          ////                      b =loadImage(i+".png");
          ////                }
          //                image(b, 0, 0, width, height);
          //                i++;
          //                b.loadPixels();
          //                takecolor();
          
                
  }
}

//------------------------------------------------------------------------------------------------------------------
//void keyPressed() {
//        if ( key == ' ' ) {
//              saveFrame("sc_shot####.jpg");
//        }
//}  

