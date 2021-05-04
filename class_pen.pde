
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
          
          color c = somecolor();
          
//          int num_eraser = 1;
//          Eraser[] erasers = new Eraser[num_eraser];          

//------------------------------------------------------------------------------------------------------------------

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
          
//          for (int n=0; n<num_eraser; n++) {
//                erasers[n] = new Eraser();
//          }
              
}

//------------------------------------------------------------------------------------------------------------------

void draw(){
  
          noStroke();
          noFill();
          ellipse(Cx,Cy,R1,R1);
          
}

//------------------------------------------------------------------------------------------------------------------ 
 
void render(){
  
          if(step < waitCnt){
             step++;
          }else{

                  noFill();
                  strokeWeight(random(1,5));
                  stroke(red(c),green(c),blue(c),20);


  
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          int temp = (int)(Ang1) / angleUnit;
          
          if(temp != mainAngle) {
                if(Ang1 <= 360){
                  ellipse(rx,ry,R2,R2);
                }
          }
                
            mainAngle = temp;
            
          
            
          
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          
                if(Ang1 >= 360 && Ang2 <= 360){

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

//            for (int s=0; s<num_eraser; s++) {
//                  erasers[s].render();
//          }
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
