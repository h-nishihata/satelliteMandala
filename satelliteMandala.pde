//DIGITAL MANDALA _ v002

//dimensions
int num = 10;
Pen[] pens;

//MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){
          size(1000,1000,P3D);
          ellipseMode(RADIUS);
          colorMode(RGB,100);
          background(150,100,80,10);
          frameRate(15);
          smooth();
          noFill();
          
          pens = new Pen[num];
          
          for(int i=0; i<num; i++){
            
                float r = random(10,100);
                float cx =  random(width);
                float cy = random(height);
                float rot1 = 20;
                float rot2 = 0.8;
                
                pens[i] = new Pen( r,cx,cy,rot1,rot2 );
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
          for(int j=0; j<num; j++){
          pens[j].render();
          }
}

//------------------------------------------------------------------------------------------------------------------

