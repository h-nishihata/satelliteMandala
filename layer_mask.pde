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
          mask.rectMode(CORNER);  
          mask.quad(width*1/5,  8,
                    width*1/5+height+13,  0,
                    width*1/5+height+8,  height-27,
                    width*1/5+5,  height-25);
          mask.endDraw();
         
          pg.mask(mask);  
          image(pg, 0, 0);

}

//------------------------------------------------------------------------------------------------------------------
void draw() {
  }
}
