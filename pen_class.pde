
//OBJECTS
//------------------------------------------------------------------------------------------------------------------
public class Pen{
          float Cx, Cy;
          float Rx,Ry;
          float X,Y;
          float Ang1, Ang2;
          float R1, R2, R3;
          float Rot1, Rot2;
          
//          float vx,vy;
    

Pen(float r, float cx, float cy, float rot1, float rot2){
//construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = r/2;
          R3 = r/10;
          Rot1 = rot1;
          Rot2 = rot2;
}

//void reset( float r ){
//          Ang1 = Ang2 =0;
//          R1 = r;
//          R2 = r/2;
//          R3 = r/10;
//}

void draw(){
          noStroke();
          noFill();
          ellipse(Cx,Cy,R1,R1);
}
 
void render(){
  noStroke();
          fill(60,30,30,10);
          strokeWeight(2);
          
for(int j=0; j<3; j++){

  
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
  
           if(Ang2 >=360 && R1 < 1000){
             Ang2 = 0;
             Rot1 /= 1.5;
             R1 += 50;
            this.draw();
            this.render();
            }

}

//
//          
          
//          
//          line( );
          
//}
//void move(){
//Cx += vx;
//Cy += vy;
//
//vx +=5;


}

}
