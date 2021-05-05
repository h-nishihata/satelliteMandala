
//  OBJECTS
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
          int a;

         

//------------------------------------------------------------------------------------------------------------------

Pen(float r, float cx, float cy, float rot1, float rot2, int au, int wc){
  
//  construct
          Cx = cx;
          Cy = cy;
          Ang1 = Ang2 =0;
          R1 = r;
          R2 = random(r/6,r/1.8);
          R3 = random(r/10,r/4);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          
          waitCnt = wc;
          step = 0;
          a = 255;
          

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
  
          if(a > 10) a -= 1;
          if(a == 10) a += 1;
          stroke(hue(c),saturation(c+2),brightness(c),a);
          strokeWeight(random(1,8));
          noFill();

    if(step < waitCnt){
          step++;
    }else{

          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
                
          int temp = (int)(Ang1) / angleUnit;
                
          if(temp != mainAngle) {
                if((Ang1 <= 360)||(Ang1 >= -360)){
                      ellipse(rx,ry,R2,R2);
                      strokeWeight(1);
                      stroke(random(0,360),50,100,a+20);
                      line(Cx,Cy,rx,ry);
                }
          }
                
          mainAngle = temp;
          
          Ang2 += Rot2;
          X = rx + (R2*cos(radians(Ang2)));
          Y = ry + (R2*sin(radians(Ang2)));
          
          if(Ang1 >= 360 && Ang2 <= 360){
                ellipse(X,Y,R3,R3);
                line(rx,ry,X,Y);
          }
  
          if(Ang2 >=360 && R1 < 200){
                c+=50;
                if(c == 360 && c>0) c-=50;
                
                Ang1 = 0;
                Ang2 = 0;
                R1 += 10;
                this.draw();
                this.render();
//drip(Cx,Cy);
          }
          
          if(R1 >= 200){
                a=100;
                Cx = random(width);
                Cy = random(height);
                Ang1 = 0;
                Ang2 = 0;
                R1 = random(10,30);
                this.draw();
                this.render();
          }
  }
}

//------------------------------------------------------------------------------------------------------------------
void move(){
//  add velocity to position
          float vx = random(-2, 2);
          float vy = random(-1, 1);
          
          Cx+=vx;
          Cy+=vy;
 }
}
//------------------------------------------------------------------------------------------------------------------
//void drip(float circleX,float circleY){
//              stroke(0);
//                      strokeWeight(2);
// float centerX, centerY;
//                    float r1,r2;
//                    float angle;
//
//                                float Vx;
//            float Vy;
//            int r;
// centerX = circleX;
//centerY = circleY;
//          r1 = 50;
//          angle = 0;
//           ellipseMode(RADIUS);
//
//
//          ellipse(centerX,centerY,r1,r1);
//          
//
//
//          angle++;
//                    r = (int)(random(1,10));
//          float rx = centerX + (r1 * cos(radians(angle)) );
//          float ry = centerY + (r1 * sin(radians(angle)) );
//
//          ellipse(rx,ry,r,r);
//Vx = random(-10,10);
//Vy = random(1,10);
//
//  
//  centerX += Vx;
//  centerY += Vy;
//}
//

