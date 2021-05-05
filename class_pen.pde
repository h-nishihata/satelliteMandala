
//  OBJECTS
//------------------------------------------------------------------------------------------------------------------

//        float screenw = 1280*2;
//        float screenh = 960;
          float screenw = screen.width;
          float screenh = screen.height;
        
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
          int waiting;

          color c = somecolor();
          int a;

          //int num = 1;
          //Spot[] sp; 
          
//------------------------------------------------------------------------------------------------------------------
Pen(float r, float cx, float cy, float rot1, float rot2, int au, int wc){
//  construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = random(r/6,r/4);
          R3 = random(r/20,r/15);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          
          waitCnt = wc;
          step = 0;
          a = 10;
          waiting = (int)(random(0,80));
          
//            sp = new Spot[num];
//  for(int n=0; n<num; n++){
//          sp[n] = new Spot();
//  }
}

//------------------------------------------------------------------------------------------------------------------

void draw(){
  
          noStroke();
          noFill();

          float temp[] = screenToAngle(Cx,Cy);
          float temp2[] = angleToSphere(temp[0], temp[1]);
          
          ellipse(temp2[0],temp2[1],R1,R1);
          
//          boolean touching = false;
//          for(int t=0; t<num; t++){
//                Pen otherPen = pens[t];
//                float temp1[] = screenToAngle(otherPen.Cx,otherPen.Cy);
//                if(otherPen != this){
//                      float dis = dist(temp[0], temp[1],temp1[0],temp1[1]);
//                      if((dis - R1 - otherPen.R1) < 0){
//
//                      touching = true;
//                      break;
//                      }
//                }
//          }
//          if(touching){
//                      sample[int(random(0,numsound))].trigger();
//          }
//          
}

//------------------------------------------------------------------------------------------------------------------ 
void render(){
          if(waiting < 80){
                waiting++;
          }else{
                if(a > 0) a --; else a = 35;
          }

          noFill();
//          color t = (int)(hue(c));
//          if(t > 0) t--; else t = 360;

  if(step < waitCnt){
          step++;
  }else{

//********** Phase 1 **********

          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          float Cx_A =  Cx + (R1/2 * cos(radians(Ang1-90)) );
          float Cx_B =  Cx + (R1/2 * cos(radians(Ang1+90)) );
          

          float Ctemp1[] = screenToAngle(Cx,Cy);
          float Ctemp2[] = angleToSphere(Ctemp1[0], Ctemp1[1]);
          float CtempA_1[] = screenToAngle(Cx_A,Cy);
          float CtempA_2[] = angleToSphere(CtempA_1[0], CtempA_1[1]);
          float CtempB_1[] = screenToAngle(Cx_B,Cy);
          float CtempB_2[] = angleToSphere(CtempB_1[0], CtempB_1[1]);
          float temp1[] = screenToAngle(rx,ry);
          float temp2[] = angleToSphere(temp1[0], temp1[1]);


          boolean zPlus = true;
          if(Ctemp2[2]<0) zPlus = false;
  
          int temp = (int)(Ang1) / angleUnit;
         
   if(zPlus){
                
                if(temp != mainAngle) {
                      if((Ang1 <= 360)||(Ang1 >= -360)){
                            stroke(hue(c),saturation(c+2),brightness(c),a);
                            if(c<360)c++; else c=0;
                            strokeWeight(random(3,8));       
                            ellipse(temp2[0] + screenw/4,
                                    temp2[1] + screenh/2,
                                    R2,R2);
                            strokeWeight(1);
                            stroke(0,0,100,a);
                            line(CtempA_2[0] + screenw/4,
                                 CtempA_2[1] + screenh/2,
                                 temp2[0] + screenw/4,
                                 temp2[1] + screenh/2);
                            line(CtempB_2[0] + screenw/4,
                                 CtempB_2[1] + screenh/2,
                                 temp2[0] + screenw/4,
                                 temp2[1] + screenh/2);     
                      }
                }
       
   }else{      
               
                if(temp != mainAngle) {
                      if((Ang1 <= 360)||(Ang1 >= -360)){
                            stroke(hue(c),saturation(c+2),brightness(c),a);
                            if(c<360)c++; else c=0;
                            strokeWeight(random(3,8));
                            ellipse(temp2[0]+ screenw*3/4,
                                    temp2[1]+screenh/2,
                                    R2,R2);
                            strokeWeight(1);
                            stroke(0,0,100,a);
                            line(CtempA_2[0]+screenw*3/4,
                                 CtempA_2[1]+screenh/2,
                                 temp2[0]+screenw*3/4,
                                 temp2[1]+screenh/2);
                            line(CtempB_2[0] + screenw*3/4,
                                 CtempB_2[1] + screenh/2,
                                 temp2[0] + screenw*3/4,
                                 temp2[1] + screenh/2);
                            
                      }
                }
          
   }
                  
//********** Phase 2 **********

          mainAngle = temp;
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          float temp3[] = screenToAngle(X,Y);
          float temp4[] = angleToSphere(temp3[0], temp3[1]);   
                      
                      
   if(zPlus){
                if(Ang1 >= 360 && Ang2 <= 360){
                            stroke(hue(c),saturation(c+2),brightness(c),a);
                            if(c<360)c++; else c=0;
                            strokeWeight(random(3,8));
                            ellipse(temp4[0] + screenw/4,
                                    temp4[1] + screenh/2,
                                    R3,R3);
                }
                
   }else{
     
                if(Ang1 >= 360 && Ang2 <= 360){
                      stroke(hue(c),saturation(c+2),brightness(c),a);
                      if(c<360)c++; else c=0;
                      strokeWeight(random(3,8));
                      ellipse(temp4[0]+ screenw*3/4,
                              temp4[1]+screenh/2,
                              R3,R3);
                }
                
   }
  
  
//********** Phase 3 **********  

          if(Ang2 >=360 && R1 < 100){
                
                Ang1 = 0;
                Ang2 = 0;
                R1 += 20;
                              
                this.draw();
                this.render();
          }


//********** Phase 4 **********

          if(R1 >= 200){
                float cx = 50 + noise(random(width))*width;
                float cy = 30 + noise(random(height))*height;
//                Cx = random(width);
//                Cy = random(height);
                Ang1 = 0;
                Ang2 = 0;
                R1 = random(8,45);
                
                this.draw();
                this.render();
          }
            
//            for(int n=0; n<num; n++){
//              sp[n].move_1();
//                sp[n].draw();
//  }
  
//              for(int n=0; n<1; n++){
//              sp[n].move_2();
//                sp[n].draw();
//  }
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

//------------------------------------------------------------------------------------------------------------------
float[] screenToAngle( float sx, float sy ){
  
          float angs[] = new float[2];
          
          angs[0] = 360.*sx/screenw;
          angs[1] = 90.+ 180. *(sy - (screenh/2.))/screenh;
          
          return angs;
}

//------------------------------------------------------------------------------------------------------------------
float[] angleToSphere( float lat, float lon){
  
          float pos[] = new float[3];
          float rad = screenh/2;
          float y = rad*sin(lat*3.1415926/180.f);
          float xz = rad*cos(lat*3.1415926/180.f);
          float x = xz*cos(lon*3.1415926/180.);
          float z = xz*sin(lon*3.1415926/180.);
          
          pos[0] = x;
          pos[1] = y;
          pos[2] = z;
          
          return pos;
}
