//  Digital Mandala _ v020, {Software} Structures
//  h.nishihata   25 June,2013
//  wwww.nishihatahitoshi.com
//  Falling Love with Processing

//  dimensions
import com.nootropic.processing.layers.*;
import ddf.minim.*;

          AppletLayers layers;
          
          GoogleMapper gMapper;
          PImage b;
          
          Minim minim;
          AudioPlayer audio;
          AudioSample[] sample;
          int numsound = 20;
          
          int num = 100;
          Pen[] pens;
          
          int maxpal = 100;
          int numpal = 0;
          color[] goodcolor = new color[maxpal];


//  MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){

          size(1000,1000,P3D);
          ellipseMode(RADIUS);
          colorMode(HSB,360,100,100,100);
          background(0,0,100);
          frameRate(10);
          smooth();
          
//  layers          
          layers = new AppletLayers(this);
          MyLayer m = new MyLayer(this);
          layers.addLayer(m);
          
//  sounds         
          minim = new Minim(this);
          audio = minim.loadFile("background.mp3");
          audio.loop();
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("b_070.mp3");
          for(int s=1; s<numsound; s++){
                sample[s] = minim.loadSample("empty.mp3");
          }
          
//  arrange linearly          
          pens = new Pen[num];
          for(int i=0; i<num; i++){
            
                float r = random(10,30);
                float cx =  0.5 + noise(random(width))*width;
                float cy =  0.5 + noise(random(height))*height;
                float rot1 = random(1,30);
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

