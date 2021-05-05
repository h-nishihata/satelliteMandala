class Layer_eraser extends Layer {
  
          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int h;
          int s;
          int b;
          int step;
          int wc;

//------------------------------------------------------------------------------------------------------------------  
Layer_eraser(PApplet parent) {
          super(parent);
  }

//------------------------------------------------------------------------------------------------------------------
  void setup() {
    
          background(255, 255, 255, 0);
          wc = 500;
          step = 0;
          h = 0;
          s = 100;
          b = 100;

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
          if (h < 100) {
                fading(h, s, b);
                h ++;
          }
          if(h >= 100 && h < 300){
                if(step < wc){
                      step++;
                }else{
                      fading(h, s, b);
                      h ++;
                }
          }
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          stroke(255, 255, 255, 50);
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

//------------------------------------------------------------------------------------------------------------------
void fading(int h, int s, int b) {
  
          colorMode(HSB, 360, 100, 100, 100);
          noStroke();
          fill(h, s, b, 1);
          rectMode(CORNER);
          rect(0, 0, width, height);
}

