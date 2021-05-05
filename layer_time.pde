class Layer_time extends Layer {

          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int al;
          
          int h,t;
          int s;
          int b;
          float a;
          boolean end_1 = false;
          boolean end_2 = false;
          boolean end_3 = false;
          boolean end_4 = false;
          boolean end_5 = false;
          boolean end_6 = false;

//------------------------------------------------------------------------------------------------------------------  
Layer_time(PApplet parent) {
          super(parent);
  }

//------------------------------------------------------------------------------------------------------------------
void setup() {
          colorMode(RGB,100);
          Cx = 50 + noise(random(width))*width;
          Cy = 30 + noise(random(height))*height;
          R1 = 50;
          Ang1 = 0;
          Rot1 = 5;
          al = 0;
          ellipseMode(RADIUS);
          noStroke();
          noFill();
          ellipse(Cx, Cy, R1, R1);

          h = t = 0;
          s = 30;
          b = 100;
          a = 0.8;
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
// setting
          if(waiting_1 < 10){
                waiting_1++;
          }
          if(waiting_1 == 2){
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }                
          if(waiting_1 >= 10){
                h = t;
                fading(h, s, b, a);
                end_1 = true;
                changeSound(0,0);   
          }
//  phase 1
          if(end_1 == true){
          if(waiting_2 < 2000){
                waiting_2++;
                if(waiting_2 >= 1300) changeSound(0,2);
          }
          if(waiting_2 == 1900){  
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }
          if(waiting_2 >= 2000){
                h = t;
                end_2 = true;
                fading(h, s, b, a);
                changeSound(0,0);               
          }
          }
//  phase 2
          if(end_2 == true){
          if(waiting_3 < 2000){
                waiting_3++;
          }
          if(waiting_3 == 1900){
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }                
          if(waiting_3 >= 2000){
                h = t;
                end_3 = true;
                fading(h, s, b, a);
                changeSound(0,0);
          }       
          }
//  phase 3
          if(end_3 == true){
          if(waiting_4 < 2000){
                waiting_4++;
          }
          if(waiting_4 == 1900){
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }                  
          if(waiting_4 >= 2000){
                h = t;
                end_4 = true;
                fading(h, s, b, a);
                changeSound(0,3);
          }  
          }
//  phase 4
          if(end_4 == true){
          if(waiting_5 < 2000){
                waiting_5++;
          }
          if(waiting_5 == 1900){
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }                 
          if(waiting_5 >= 2000){
                h = t;
                end_5 = true;
                fading(h, s, b, a);
                changeSound(0,2);
          }
          }
//  phase 5
          if(end_5 == true){
          if(waiting_6 < 2000){
                waiting_6++;
          }
          if(waiting_6 == 1900){
                if(epx+epy+epz+emx+emy+emz > 0.4){  
                      t=(int)random(0,60);
                }else{
                      t=(int)random(120,360);
                }
          }                 
           if(waiting_6 >= 2000){
                h = t;
                end_6 = true;
                fading(h, s, b, a);
                changeSound(2,4);   
          } 
          }          
//  reset          
          if(end_6 == true){
          if(waiting_7 < 2000){
                waiting_7++;
          }else{
                waiting_1 = waiting_2 = waiting_3 = waiting_4 = waiting_5 = waiting_6 = waiting_7 = 0;
                end_1 = end_2 = end_3 = end_4 = end_5 = end_6 = false;
          }
          }
          
          
          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          if(al > 0) al --; else al = 30;
          stroke(255,255,255,al);
          strokeWeight(1);
          line(Cx, Cy, rx, ry);
          moveEraser();
  }

//------------------------------------------------------------------------------------------------------------------
  void moveEraser() {
          float Vx = random(-10, 10);
          float Vy = random(-10, 10);
      
          Cx += Vx;
          Cy += Vy;
          if (Cx > width || Cx < 0 || Cy > height || Cy < 0) {
                Cx = width/2;
                Cy = height/2;
          }
  } 
}
