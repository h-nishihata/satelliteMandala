class Layer_eraser extends Layer {
//    float x;
//  float y;
//  float vx;
//  float vy;
          float Cx, Cy;
          float R1,R2;
          float Ang1;
          float Rot1;
//          int r;
//          int g;
//          int b;
         
//          
//          int mainAngle;
//          int angleUnit;
Layer_eraser(PApplet parent) {
          super(parent);
}

void setup(){
colorMode(RGB,100);
//background(150,150,0,0);
//
//x = 500;
//y = 500;
//  r = 255;
//  g = 255;
//  b = 255;
  


          Cx = 50 + noise(random(width))*width;
          Cy = 30 + noise(random(height))*height;
          R1 = 50;
//          R2 = 100; 
          Ang1 = 0;
          Rot1 = 5;
          
//          angleUnit = 5;
          
          ellipseMode(RADIUS);
          noStroke();
noFill();
          ellipse(Cx,Cy,R1,R1);

}

void draw(){
noStroke();
noFill();
fadeToWhite();
//ellipse(x,y,30,30);
//vx = random(-5,5);
//vy = random(-5,5);
//x += vx;
//y += vy;

          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
//          int temp = (int)(Ang1) / angleUnit;
//                
//          if(temp != mainAngle) {
//
//          ellipse(rx,ry,R2,R2);
//for(int n=255; n>=0; n--){
// stroke(255,255,255,n);
//}
//for(int n=0; n<=255; n++){
// stroke(255,255,255,n);
//}
 stroke(255,255,255,50);
                      strokeWeight(1);
          line(Cx,Cy,rx,ry);

//          if(Ang1 <= 360){

//          }
          moveEraser();
//          }
}

void moveEraser(){
  float Vx = random(-10,10);
  float Vy = random(-10,10);
  
  Cx += Vx;
  Cy += Vy;
}

}
void fadeToWhite(){
  noStroke();
//   r+=50;
//   if(r == 255 && r>0) r-=50;
//      g+=50;
//   if(g == 255 && g>0) g-=50;
//      b+=50;
//   if(b == 255 && b>0) b-=50;
  
  
  fill(255,255,255,1);
rectMode(CORNER);
rect(0,0,width,height);


}
