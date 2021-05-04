
//OBJECTS
//------------------------------------------------------------------------------------------------------------------
public class Pen{
  
          float Cx, Cy;
          float Rx,Ry;
          float X,Y;
          float Ang1, Ang2;
          float R1, R2, R3;
          float Rot1, Rot2;
          
          int mainAngle;
          int angleUnit;
//          Pen child;
          boolean isAlive;
          int waitCnt;
          int step;
          

Pen(float r, float cx, float cy, float rot1, float rot2, int au, int wc){
  
//construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = r/2;
          R3 = r/10;
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          isAlive = false;
          waitCnt = wc;
          step = 0;
          
}


void beBorn(){
  
          isAlive = true;
          
}


void draw(){
  
          noStroke();
          noFill();
          ellipse(Cx,Cy,R1,R1);
          
}
 
 
void render(){
  
          if(step<waitCnt){
             step++;
          }else{
          
          noStroke();
          fill(60,30,30,10);
                  
                  
          
          
for(int j=0; j<3; j++){

  
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          int temp = (int)(Ang1)/angleUnit;
          
          if(temp != mainAngle) {
                if(Ang1 <= 360){
                      ellipse(rx,ry,R2,R2);
                }else{
                  
                  
                if(isAlive==true){
                    //child = new Pen( 10,X,Y,1,1,20  );
                    //child.beBorn();
                     isAlive = false;
                  }
              }
          }
                
            mainAngle = temp;
            
            if(isAlive==false){
               //child.render();
            }
          
          
//          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
//          
//                if(Ang2 <= 360)
//                ellipse(X,Y,R3,R3);
//  
//           if(Ang2 >=360 && R1 < 1000){
//             Ang2 = 0;
//             Rot1 /= 1.5;
//             R1 += 50;
//            this.draw();
//            this.render();
//            }



          }
         



          }
     }
}
