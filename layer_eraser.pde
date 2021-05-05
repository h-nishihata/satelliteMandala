class Layer_eraser extends Layer {
  
          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int h;
          int s;
          int b;
          float a;
          int waiting_1;
          int waiting_2;
          int waiting_3;
          boolean end_1 = false;
          boolean end_2 = false;
          boolean end_3 = false;
          
//------------------------------------------------------------------------------------------------------------------  
Layer_eraser(PApplet parent) {
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
          h = 0;
          s = 0;
          b = 100;
          a = 0.6;
          waiting_1=0;
          waiting_2=0;
          waiting_3=0;
          
          ellipseMode(RADIUS);
          noStroke();
          noFill();

//          for(int n=0; n<3; n++){
          ellipse(Cx, Cy, R1, R1);
//          }
  }

//------------------------------------------------------------------------------------------------------------------
void draw() {

//  daytime(0,0,100) >> sunset(0,100,100) 
          if(waiting_1 < 1000){
                waiting_1++;
          }else{
                fading(h, s, b, a);
                s =100;
                end_1 = true;
          }
//  sunset(0,100,100) >> night(0,0,0)
          if(end_1 == true){
          if(waiting_2 < 1000){
                waiting_2++;
          }else{  
                fading(h, s, b, a);
                s=0;  
                b=0;
                a=10;
                end_2 = true;
          }
          }
          
//  night(0,0,0) >> dawn(0,0,100)
          if(end_2 == true){
          if(waiting_3 < 1000){
                waiting_3++;
          }else{
                fading(h, s, b, a);   
                h=0;
                s=0;
                b=100;
                a =0.6;
                end_3 = true;
          } 
          }
          
          if(end_3 == true){
                waiting_1 = waiting_2 = waiting_3 = 0;
                end_1 = end_2 = end_3 = false;
          }
          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          stroke(255,255,255,0);
          strokeWeight(1);
//          for(int n=0; n<3; n++){
          line(Cx, Cy, rx, ry);
          moveEraser();
//          }
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
