class Layer_eraser extends Layer {
  
          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int h;
          int s;
          int b;
          float a;
          int step;
          int step_2;
          int step_3;
          int wc;

//------------------------------------------------------------------------------------------------------------------  
Layer_eraser(PApplet parent) {
          super(parent);
  }

//------------------------------------------------------------------------------------------------------------------
  void setup() {
    
          colorMode(RGB,100);
          wc = 100;
          step = 0;
          step_2 = 0;
          step_3 = 0;
          h = 0;
          s = 0;
          b = 100;
          a = 0.5;

          Cx = 50 + noise(random(width))*width;
          Cy = 30 + noise(random(height))*height;
          R1 = 50;
          Ang1 = 0;
          Rot1 = 5;
          
          ellipseMode(RADIUS);
          noStroke();
          noFill();
          ellipse(Cx, Cy, R1, R1);
  }

//------------------------------------------------------------------------------------------------------------------
void draw() {
  
          noStroke();
          noFill();
//  daytime(0,0,100) >> sunset(0,100,100) 
          if(step < wc){
                step++;
          }else{
          if (s < 100) {
                fading(h, s, b, a);
                s ++;
          }
          }
//  sunset(0,100,100) >> night(0,100,0)
          if(s==100 && b>0 && s>0){
          if(step_2 < wc){
                step_2++;
          }else{
                fading(h, s, b, a);
                s--;  
                b--;
                a =1;
          }
          }
//  night(240,0,100) >> dawn(0,0,100)
          if(h ==240 && s==0 && h>0){
          if(step_3 < wc){
                step_3++;
          }else{
                fading(h, s, b, a);   
                h=s=0;
                b=100;
                a =0.5;
          } 
          }

          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          stroke(255,255,255,100);
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
