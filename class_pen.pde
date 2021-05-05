//  OBJECTS
          float screenw = screen.width;
          float screenh = screen.height;
        
public class Pen{
          float Cx, Cy;
          float rx,ry;
          float X,Y;
          float Ang1, Ang2;
          float R1, R2, R3;
          float Rot1, Rot2;
          
          int mainAngle;
          int angleUnit;
          int waitCnt;
          int step;
          int waiting;

          color c = somecolor();
          int a;
          
//------------------------------------------------------------------------------------------------------------------
Pen(float r, float cx, float cy, float rot1, float rot2, int au, int wc){
//  construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = random(r/10,r/8);
          R3 = random(r/20,r/15);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          waitCnt = wc;
          step = 0;
          a = 10;
          waiting = (int)(random(0,80));
}

//------------------------------------------------------------------------------------------------------------------
void draw(){

          noStroke();
          noFill();
          ellipse(Cx,Cy,R1,R1);
          
          boolean touching = false;
          for(int t=0; t<num; t++){
                Pen otherPen = pens[t];
                if(otherPen != this){
                      float dis = dist(Cx,Cy,otherPen.Cx,otherPen.Cy);
                      if((dis - R1 - otherPen.R1) < 0){
                            otherPen.c -= 50;
                            touching = true;
                            break;
                      }
                }
          }

          
          if(touching){
                int i = soundType[0];
                int i_ = soundType[1];
                int t = (int)(random(0,20000));
                if(t == 0 && i != 0){
                      sample[i].trigger();
                      fill(#FFFFFF,30);
                      ellipse(Cx,Cy,R1,R1);
                }
                if(t == 1 && i_ != 0){
                      sample[i_].trigger();
                      fill(#FFFFFF,30);
                      ellipse(Cx,Cy,R1,R1);
                }
          }     
}

//------------------------------------------------------------------------------------------------------------------ 
void render(){
          if(waiting < 80){
                waiting++;
          }else{
                if(a > 0) a --; else a = 20;
          }
          noFill();



  if(step < waitCnt){
          step++;
  }else{

//********** Phase 1 **********

          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          float Cx_A =  Cx + (R1/2 * cos(radians(Ang1-90)) );
          float Cx_B =  Cx + (R1/2 * cos(radians(Ang1+90)) );

          int temp = (int)(Ang1) / angleUnit;
         
          if(temp != mainAngle) {
                if((Ang1 < 360)||(Ang1 > -360)){
                      stroke(hue(c),saturation(c),random(0,50),a);
                      if(c<360)c++; else c=0;
                      strokeWeight(random(3,10));       
                      ellipse(rx,ry,R2,R2);
                      strokeWeight(random(1,3));
                      stroke(0,0,70,random(1,8));
                      line(Cx_A,Cy,rx,ry);
                      line(Cx_B,Cy,rx,ry);     
                      }
          }
       
          mainAngle = temp;    
                  
//********** Phase 2 **********    
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
         
                      
          if(Ang1 >= 360 && Ang2 < 360 || Ang1 <= -360 && Ang2 > -360){
                stroke(hue(c),saturation(c),brightness(c),a);
                if(c<360)c++; else c=0;
                strokeWeight(random(3,10));
                ellipse(X,Y,R3,R3);
          }
  
//********** Phase 3 **********  

          if(Ang2 >= 360 && R1 < 150 || Ang2 <= -360 && R1 < 150){
                Ang1 = 0;
                Ang2 = 0;
                R1 += 20;
                this.draw();
                this.render();                                         
          }

//********** Phase 4 **********

          if(R1 >= 150){
                float cx = 50 + noise(random(width))*width;
                float cy = 30 + noise(random(height))*height;
                Ang1 = 0;
                Ang2 = 0;
                R1 = random(8,45);
                
                this.draw();
                this.render();
          }
            

  }
}

//------------------------------------------------------------------------------------------------------------------
void move(){
//  add velocity to position
          float vx = random(-3, 3);
          float vy = random(-1.5, 1.5);
          Cx+=vx;
          Cy+=vy;
 }
}
