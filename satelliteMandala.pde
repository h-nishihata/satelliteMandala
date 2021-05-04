//DIGITAL MANDALA _ v008


//dimensions
int num = 100;
Pen[] pens;

//MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){

          size(1000,1000,P3D);
          ellipseMode(RADIUS);
          colorMode(RGB,100);
          
          background(150,100,80);
//        takecolor("sat_data.jpg");
          frameRate(100);
          smooth();
          noStroke();
          
          pens = new Pen[num];
          
          for(int i=0; i<num; i++){
            
                float r = random(10,30);
                float cx =  random(width);
                float cy = random(height);
                float rot1 = random(1,30);
                float rot2 = 0.8;
                int au = 5;
                
                pens[i] = new Pen( r,cx,cy,rot1,rot2,au, (int)(random(1,500)) );
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
  
          for(int j=0; j<num; j++){
                pens[j].render();
                pens[j].move();
          }
          
}

//------------------------------------------------------------------------------------------------------------------

