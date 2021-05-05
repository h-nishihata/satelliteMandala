
//  OBJECTS
class Eraser{
//------------------------------------------------------------------------------------------------------------------  
Eraser(){
  
}

//------------------------------------------------------------------------------------------------------------------
void render(){
          loadPixels();
        
          int x = int(random(b.width));
          int y = int(random(b.height));

          int pos = (y * b.height) + x;
          pixels[pos] = b.pixels[pos];
          updatePixels();
 }
}
