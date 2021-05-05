class Layer_pen extends Layer {

  //------------------------------------------------------------------------------------------------------------------
Layer_pen(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){
//  arrange linearly          
          pens = new Pen[num];
          for(int i=0; i<num; i++){
                float r = random(6,45);
                float cx = random(width);
                float cy = random(height);
                float rot1 = random(-8,8);
                float rot2 = 0.8;
                int au = 5;
                pens[i] = new Pen( r,cx,cy,rot1,rot2,au, (int)(random(1,700)) );
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
//  move pens  
          for(int j=0; j<num; j++){
                pens[j].draw();
                pens[j].render();
                pens[j].move();
          }
 }
}
