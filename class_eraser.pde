class Eraser{
  
Eraser(){
}


void render(){
          loadPixels();
        
      
        for(int s=0;s<100;s++){
          int x = int(random(b.width));
          int y = int(random(b.height));

          int pos = (y * b.height) + x;
          pixels[pos] = b.pixels[pos];
        }
            tint(200,0,0,0);
        
          updatePixels();

}

void erase(){


}
}
