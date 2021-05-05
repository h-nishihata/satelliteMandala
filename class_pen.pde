
//  OBJECTS
//------------------------------------------------------------------------------------------------------------------

//        float screenw = 1440;
//        float screenh = 900;
        float screenw = screen.width*2;
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
          R2 = random(r/8,r/5);
          R3 = random(r/12,r/10);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          
          waitCnt = wc;
          step = 0;
          a = 10;
          waiting = 0;
          
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
          
          
          boolean touching = false;
          for(int t=0; t<num; t++){
                Pen otherPen = pens[t];
                if(otherPen != this){
                      float dis = dist(Cx,Cy,otherPen.Cx,otherPen.Cy);
                      if((dis - R1 - otherPen.R1) < 0){

                      touching = true;
                      break;
                      }
                }
          }
          if(touching){
                      sample[int(random(0,numsound))].trigger();
          }
          
}

//------------------------------------------------------------------------------------------------------------------ 

  
  
  
void render(){

          if(a > 5) a --;
//          if(waiting < random(1,80)){
//                waiting++;
//          }
          else
                a = 20;
//          }

          strokeWeight(random(3,8));
          noFill();



    if(step < waitCnt){
          step++;
    }else{
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          
          float Ctemp1[] = screenToAngle(Cx,Cy);
          float Ctemp2[] = angleToSphere(Ctemp1[0], Ctemp1[1]);


          boolean zPlus = true;
          if(Ctemp2[2]<0) zPlus = false;
  
          int temp = (int)(Ang1) / angleUnit;
                
          if(zPlus){
                
                if(temp != mainAngle) {
                      if((Ang1 <= 360)||(Ang1 >= -360)){
                        
                            float temp1[] = screenToAngle(rx,ry);
                            float temp2[] = angleToSphere(temp1[0], temp1[1]);
                            stroke(hue(c),saturation(c+2)+100,brightness(c),a);         
                            ellipse(temp2[0] + screenw/4,
                                    temp2[1] + screenh/2,
                                    R2,R2);
//                            strokeWeight(1);
                            stroke(0,0,100,20);
                            line(Ctemp2[0] + screenw/4,
                                 Ctemp2[1] + screenh/2,
                                 temp2[0] + screenw/4,
                                 temp2[1] + screenh/2);
                      }
                }
          
          
          }else{      
               
                if(temp != mainAngle) {
                      if((Ang1 <= 360)||(Ang1 >= -360)){
                        
                        
                            float temp1[] = screenToAngle(rx,ry);
                            float temp2[] = angleToSphere(temp1[0], temp1[1]);
                            stroke(hue(c),saturation(c+2)+100,brightness(c),a);
                            ellipse(temp2[0]+ screenw*3/4,
                                    temp2[1]+screenh/2,
                                    R2,R2);
//                            strokeWeight(1);
                            stroke(0,0,100,20);
                            line(Ctemp2[0]+screenw*3/4,
                                 Ctemp2[1]+screenh/2,
                                 temp2[0]+screenw*3/4,
                                 temp2[1]+screenh/2);
                            
                      }
                 }
          
          }
                  
                
          mainAngle = temp;
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          
          float temp1[] = screenToAngle(rx,ry);
          float temp2[] = angleToSphere(temp1[0], temp1[1]);   
                      
                      
          if(zPlus){
                if(Ang1 >= 360 && Ang2 <= 360){
      
                            
                   float temp3[] = screenToAngle(X,Y);
                   float temp4[] = angleToSphere(temp3[0], temp3[1]);
                      stroke(hue(c),saturation(c+2)+100,brightness(c),a);
                      ellipse(temp4[0] + screenw/4,
                              temp4[1] + screenh/2,
                              R3,R3);
                      stroke(0,0,100,20);       
                      line(temp2[0] + screenw/4,
                                  temp2[1] + screenh/2,
                                  temp4[0] + screenw/4,
                                  temp4[1]+ screenh/2);
                }
          }else{
                if(Ang1 >= 360 && Ang2 <= 360){
                      float temp3[] = screenToAngle(X,Y);
                      float temp4[] = angleToSphere(temp3[0], temp3[1]);
                      stroke(hue(c),saturation(c+2)+100,brightness(c),a);
                      ellipse(temp4[0]+ screenw*3/4,
                              temp4[1]+screenh/2,
                              R3,R3);
                      stroke(0,0,100,20);
                      line(temp2[0]+screenw*3/4,
                           temp2[1]+screenh/2,
                           temp4[0]+screenw*3/4, 
                           temp4[1]+screenh/2);
                }
          }
  
  
  
          if(Ang2 >=360 && R1 < 200){
                c-=5;
                if(c <= 0) c=360;
                Ang1 = 0;
                Ang2 = 0;
                R1 += 20;
                
                this.draw();
                this.render();
          }



          if(R1 >= 200){
                c-=5;
                if(c <= 0) c=360;
                Cx = random(width);
                Cy = random(height);
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
