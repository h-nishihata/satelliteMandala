
//  OBJECTS
//------------------------------------------------------------------------------------------------------------------
public class Eraser{
  
          float Cx, Cy;
          float R1,R2;
          float Ang1;
          float Rot1;
          
          int mainAngle;
          int angleUnit;
      
//------------------------------------------------------------------------------------------------------------------  
Eraser(){
  frameRate(10);
          Cx = random(width);
          Cy = random(height);
          R1 = random(30,100);
          R2 = 100; 
          Ang1 = 0;
          Rot1 = random(-30,30);
          angleUnit = 5;
          
          ellipseMode(RADIUS);
          stroke(60,100,100,100);
          strokeWeight(random(1,10));
          ellipse(Cx,Cy,R1,R1);
          
}

//------------------------------------------------------------------------------------------------------------------
void render(){
  
          fill(60,100,100,100);
          strokeWeight(random(10,30));
          noFill();
          Ang1 += Rot1;
          float rx = Cx + (R1 * cos(radians(Ang1)) );
          float ry = Cy + (R1 * sin(radians(Ang1)) );
          
          int temp = (int)(Ang1) / angleUnit;
                
          if(temp != mainAngle) {
          if(Ang1 <= 360)
          ellipse(rx,ry,R2,R2);
          
          }
  
  
          //          loadPixels();
          //        
          //          int x = int(random(b.width));
          //          int y = int(random(b.height));
          //
          //          int pos = (y * b.height) + x;
          //          pixels[pos] = b.pixels[pos];
          //          updatePixels();
 }
}
