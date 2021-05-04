

//OBJECTS
//------------------------------------------------------------------------------------------------------------------
public class Pen{
      float Cx, Cy;
          float Rx,Ry;
          float X,Y;
          float Ang1, Ang2;
          float R1, R2, R3;
          float Rot1, Rot2;
    
//  float x;
//  float y;
//  float vx;
//  float vy;
//  int r;

Pen(float r){
//construct
          Cx = random(width);
          Cy = random(height);
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = 50;
          R3 = 10;
          Rot1 = 20;
          Rot2 = 3;
          
//          x = Cx;
//y = Cy;
          stroke(50,100,100,30);
          ellipse(Cx,Cy,R1,R1);
          
 
}


void render(){
    stroke(80,10,0);
          Ang1 += Rot1;
    
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          
          if(Ang1 <= 360)
          ellipse(rx,ry,R2,R2);
          
          
           Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          
       if(Ang2 <= 360)
          ellipse(X,Y,R3,R3);
          
//          if(Ang2 >=360){
//            fill(0);
//            
//r = (int)(random(8,20));
//          ellipse(x,y,r,r);
//vx = random(-5,5);
//vy = random(1,5);
//x += vx;
//y += vy;
//          }
          
          
}
}
