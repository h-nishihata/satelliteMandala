
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
          int waitCnt;
          int step;
          

Pen(float r, float cx, float cy, float rot1, float rot2, int au, int wc){
  
//construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = random(r/5,r/2);
          R3 = random(r/10,r/5);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          waitCnt = wc;
          step = 0;
          
}


void draw(){
  
          noStroke();
          noFill();
          ellipse(Cx,Cy,R1,R1);
          
}
 
 
void render(){
  
          if(step < waitCnt){
             step++;
          }else{
//
//          noFill();
//          noStroke();


  
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          int temp = (int)(Ang1) / angleUnit;
          
          if(temp != mainAngle) {
                if(Ang1 <= 360){
                  fill(random(60,200),random(30,50),random(0,30),10);

                  ellipse(rx,ry,R2,R2);
                }
          }
                
            mainAngle = temp;
            
          
            
          
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          
                if(Ang1 >= 360 && Ang2 <= 360){
                   fill(random(60,200),random(30,50),random(0,30),10);

                   ellipse(X,Y,R3,R3);
                }
  
           if(Ang2 >=360 && R1 < 1000){
             Ang1 = 0;
             Ang2 = 0;
//             Rot1 /= 1.5;
             R1 += 20;
            this.draw();
            this.render();
            }
//          stroke(random(60,200),random(30,50),random(0,30),10);  
//          strokeWeight(1);
//          line(Cx,Cy,rx,ry);
          }
     }
//------------------------------------------------------------------------------------------------------------------
void move(){
  float vx = random(-1.2, 1.2);
  float vy = random(-0.5, 0.5);
              Cx+=vx;
              Cy+=vy;
}
}
