
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
          R2 = random(r/8,r/4);
          R3 = random(r/10,r/4);
          Rot1 = rot1;
          Rot2 = rot2;
          angleUnit = au;
          
          waitCnt = wc;
          step = 0;
          a = 12;
          waiting = 0;
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

          if(a > 5) a --;
          if(waiting < random(1,80)){
                waiting++;
          }else{
          if(a == 5) a = 12;
          }
          stroke(hue(c),saturation(c+2)+80,brightness(c),a);

          strokeWeight(random(3,8));
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
                      stroke(0,0,100,a+10);
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
                c-=10;
                if(c == 0)c=360;
                Ang1 = 0;
                Ang2 = 0;
                R1 += 20;
                this.draw();
                this.render();
          }
          
          if(R1 >= 200){
                Cx = random(width);
                Cy = random(height);
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
