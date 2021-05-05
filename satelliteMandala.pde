//  Digital Mandala _ v033, {Software} Structures
//  h.nishihata   22 July, 2013
//  wwww.nishihatahitoshi.com
//  Falling Love with Processing

//  dimensions
import com.nootropic.processing.layers.*;
import ddf.minim.*;

          AppletLayers layers;
          
          GoogleMapper gMapper;
          PImage b;
          
          Minim minim;
          AudioSample[] sample;
          int numsound = 30;
          
          int num = 100;
          Pen[] pens;
          
          int maxpal = 100;
          int numpal = 0;
          color[] goodcolor = new color[maxpal];

//  MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){

          size(screen.width,screen.height);
          ellipseMode(RADIUS);
          colorMode(HSB,360,100,100,100);
          background(0,0,100);
          frameRate(10);
          smooth();
          
//  layers          
          layers = new AppletLayers(this);
          Layer_eraser e = new Layer_eraser(this);
          Layer_image m = new Layer_image(this);
          Layer_mask k = new Layer_mask(this);
          layers.addLayer(e);
          layers.addLayer(m);
          layers.addLayer(k);
          
//  sounds         
          minim = new Minim(this);
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("b_014.mp3");
          sample[1] = minim.loadSample("b_070.mp3");
          for(int s=2; s<numsound; s++){
                sample[s] = minim.loadSample("empty.mp3");
          }
          
//  arrange linearly          
          pens = new Pen[num];
          for(int i=0; i<num; i++){
            
                float r = random(10,45);
//                float cx = 50 + noise(random(width))*width;
//                float cy = 30 + noise(random(height))*height;
                float cx = random(width);
                float cy = random(height);
                float rot1 = random(-10,10);
                float rot2 = 0.8;
                int au = 5;
                
                pens[i] = new Pen( r,cx,cy,rot1,rot2,au, (int)(random(1,500)) );
          }
}

//------------------------------------------------------------------------------------------------------------------
void paint(java.awt.Graphics g) {
          if (layers != null) {
                layers.paint(this);
          } else {
                super.paint(g);
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
//  move pens  
          for(int j=0; j<num; j++){
            pens[j].draw();
                pens[j].render();
                pens[j].move();
          }
}

//------------------------------------------------------------------------------------------------------------------
void stop(){
          for(int i=0; i<numsound; i++){
                sample[i].close();
                minim.stop();
                super.stop();
          }
}

