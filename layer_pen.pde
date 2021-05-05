class Layer_pen extends Layer {
  
          float Cx, Cy;
          float R1, R2;
          float Ang1;
          float Rot1;
          int al;
          
//------------------------------------------------------------------------------------------------------------------
Layer_pen(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){

//  arrange linearly
          colorMode(RGB,100);
          Cx = 50 + noise(random(width))*width;
          Cy = 30 + noise(random(height))*height;
          R1 = 50;
          Ang1 = 0;
          Rot1 = 5;
          al = 100;
          ellipseMode(RADIUS);
          noStroke();
          noFill();
          ellipse(Cx, Cy, R1, R1);
          
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
          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );

          if(al > 0){ al --; }else{ al = 50;}
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
