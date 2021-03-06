class Layer_mask extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_mask(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){
  
          colorMode(RGB,100);
          background(255,255,255,0);
          smooth();
                    
          PGraphics pg;
          PGraphics mask;
          pg = createGraphics(width, height, P2D);
          mask = createGraphics(width, height, P2D);
          
          mask.beginDraw();
          mask.smooth();
          mask.background(255,255,255);
          mask.noStroke();
          mask.fill(0,0,0);
          mask.rectMode(CENTER);  
          mask.rect(width/2, height/2, height, height);
          mask.endDraw();
         
          pg.mask(mask);  
          image(pg, 0, 0);
          
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
  }
}
