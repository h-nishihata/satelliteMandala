
class Spot {
  float x, y;
  color c;
Spot() {
  x = random(width);
  y = random(height);
  c = somecolor();
}


void move_1() {

  x += random(-10,10); 
  y += 10;

  }
  void move_2() {

//  x += random(-5,0); 
  y += -5;

  }
  
  void draw(){
    noStroke();
  fill(hue(c),saturation(c+2)+100,brightness(c),10);
ellipse(x, y,5,5);
  }
}
