class Eraser{
//           float centerX, centerY;
//           float radius;
           //  float rad_2;
           //  float angle;
           //  float rotate;
            
Eraser(){
          //construct
                
          
          //color col = retrieve();
          //  angle = 0;
          //  rotate = 20;
          //  rad_2 = random(radius/5,radius/2);
          //  
}


void render(){
          loadPixels();
        
          int x = int(random(b.width));
          int y = int(random(b.height));

          int pos = (y * b.height) + x;
          pixels[pos] = b.pixels[pos];
          updatePixels();
//              fill(red(c),green(c),blue(c));
//              ellipse(x,y,10,10);
              
//            noStroke();
//            
//            fill(red(col),green(col),blue(col),30);
//            ellipse(centerX, centerY, radius, radius);
//            
//            float vx = random(-0.5, 0.5);
//            float vy = random(-2, 2);
//            centerX += vx;
//            centerY += vy;
//            angle += rotate;
//          float rx = centerX + (radius * cos(radians(angle)) );
//          float ry = centerY + (radius * sin(radians(angle)) );
//          
//          fill(150,100,80,10);
//          ellipse(rx,ry,rad_2,rad_2);



          }
//          color retrieve(){
//            return precolor[int(random(pal)) ];
//          }
}
