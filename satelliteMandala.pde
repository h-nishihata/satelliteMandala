//  Digital Mandala _ v014, {Software} Structures
//  h.nishihata   June,2013
//  wwww.nishihatahitoshi.com
//  Built with Processing 2.0 b9

//  dimensions
import ddf.minim.*;

Minim minim;
AudioSample[] sample;
int numsound = 3;

FullScreen fs;

GoogleMapper gMapper;
PImage b;

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
          colorMode(RGB,100);
          frameRate(18);
          smooth();
          fs = new FullScreen(this); 
          fs.enter();
          
//  getting image   
          double mapCenterLat = random(10.000000,90.000000);
          double mapCenterLon = random(10.000000,90.000000);
          int    zoomLevel = 10;
          String mapType = GoogleMapper.MAPTYPE_SATELLITE;
          int    mapWidth = width;   
          int    mapHeight = height;
          
                gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
                b = gMapper.getMap();
                tint(150,150,0,50);
                image(b,0,0,width,height);
                b.loadPixels();
                
          takecolor();
          
//  sounds         
          minim = new Minim(this);
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("b_070.mp3");
          sample[1] = minim.loadSample("b_040.mp3");
          sample[2] = minim.loadSample("b_006.mp3");
          
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

