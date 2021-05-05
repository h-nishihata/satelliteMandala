class MyLayer extends Layer {

  MyLayer(PApplet parent) {
    super(parent); // This is necessary!
  }
void setup(){
colorMode(RGB,100);
//background(#998c3e,50);

}

  void draw() {
         
//background(150,150,0,150);
//   int x = int(random(width));
//int y = int(random(height));
    // clear the background every time, but be transparent
    // now draw something

 for(int j=0; j<num; j++){

//int x = int(random(width));
//int y = int(random(height));
//fill(0,0,200);
//rect(x,y,50,50);

                pens[j].render();
                
                pens[j].move();


          }
//if(pens[1].R1>40){
//background(255,255,255,0);
//
//}

  }
}

