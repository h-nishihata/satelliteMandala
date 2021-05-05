class Layer_time extends Layer {
  
          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int al;
          
          int h;
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

          h = 0;
          s = 0;
          b = 100;
          a = 0.6;
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
//  >> sunset[red](0,100,100) 
          if(waiting_1 < 2000){
                waiting_1++;
          }else{
                fading(h, s, b, a);
                s =100;
                end_1 = true;
                changeSound(0,1);
          }
//  sunset(0,100,100) >> night[black](0,0,0)
          if(end_1 == true){
          if(waiting_2 < 100){
                waiting_2++;
                if(waiting_2 >= 1500) changeSound(1,2);
          }else{  
                fading(h, s, b, a);
                s=0;  
                b=0;
                a=3;
                end_2 = true;
                changeSound(0,0);
          }
          }
//  night(0,0,0) >> dawn[cyan](180,100,100)
          if(end_2 == true){
          if(waiting_3 < 100){
                waiting_3++;
          }else{
                fading(h, s, b, a);   
                h=180;
                s=50;
                b=80;
                a=0.5;
                end_3 = true;
                changeSound(0,0);
          } 
          }
//  dawn(180,100,100) >> morning[yellow](60,100,100)
          if(end_3 == true){
          if(waiting_4 < 100){
                waiting_4++;
          }else{
                fading(h, s, b, a);   
                h=60;
                end_4 = true;
                changeSound(0,3);
          } 
          }
//  morning(60,100,100) >> midday[white](0,0,100)
          if(end_4 == true){
          if(waiting_5 < 100){
                waiting_5++;
          }else{
                fading(h, s, b, a);   
                h=0;
                s=0;
                b=100;
                a=0;
                end_5 = true;
                changeSound(0,2);
          } 
          }
//  midday >> afternoon[violet](300,100,100)
          if(end_5 == true){
          if(waiting_6 < 100){
                waiting_6++;
          }else{
                fading(h, s, b, a);   
                h=300;
                s=100;
                a=0.6;
                end_6 = true;
                changeSound(2,4);
          } 
          }          
          
          if(end_6 == true){
          if(waiting_7 < 100){
                waiting_7++;
          }else{
                waiting_1 = waiting_2 = waiting_3 = waiting_4 = waiting_5 = waiting_6 = waiting_7 = 0;
                end_1 = end_2 = end_3 = end_4 = end_5 = end_6 = false;
          }
          }
          
          
          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          if(al > 0) al --; else al = 35;
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
