
//OBJECTS
//------------------------------------------------------------------------------------------------------------------
public class Pen{
          float Cx, Cy;
          float Rx,Ry;
          float X,Y;
          float Ang1, Ang2;
          float R1, R2, R3;
          float Rot1, Rot2;
    

Pen(float r, float cx, float cy, float rot1, float rot2){
//construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          Rot1 = rot1;
          Rot2 = rot2;
}

void draw(){
          stroke(80,30,10,30);
          ellipse(Cx,Cy,R1,R1);
}
 
void render(){
          stroke(80,30,10,30);
          strokeWeight(2);
          
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          R2 = R1/2;
          if(Ang1 <= 360)
          ellipse(rx,ry,R2,R2);
          
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          R3 = R1/10;
          if(Ang2 <= 360)
          ellipse(X,Y,R3,R3);
          
//          line( );
          
}

}
