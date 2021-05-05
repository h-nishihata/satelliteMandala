//  Digital Mandala _ v017, {Software} Structures
//  h.nishihata   June,2013
//  wwww.nishihatahitoshi.com
//  Falling Love with Processing

//  dimensions
//  libraries
import com.nootropic.processing.layers.*;
import ddf.minim.*;

//  layer
      AppletLayers layers;

//  sounds
      Minim minim;
      //AudioPlayer audio;
      AudioSample[] sample;
      int numsound = 3;

//  map
      GoogleMapper gMapper;
      PImage b;

//  pen
      int num = 100;
      Pen[] pens;

//  eraser
      int num_eraser = 1;
      Eraser[] erasers;          

//  palette
      int maxpal = 100;
      int numpal = 0;
      color[] goodcolor = new color[maxpal];


//  MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){

          size(1000,1000,P3D);
//          ellipseMode(RADIUS);
          colorMode(RGB,100);
//          frameRate(100);
          smooth();
          
//  layers          
          layers = new AppletLayers(this);
          MyLayer m = new MyLayer(this);
          layers.addLayer(m);
          
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
//          audio = minim.loadFile("",2048);
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("b_070.mp3");
          sample[1] = minim.loadSample("b_040.mp3");
          sample[2] = minim.loadSample("b_006.mp3");


          
////  arrange linearly          
//          pens = new Pen[num];
//          for(int i=0; i<num; i++){
//            
//                float r = random(10,30);
//                float cx =  0.5 + noise(random(width))*width;
//                float cy =  0.5 + noise(random(height))*height;
//                float rot1 = random(1,30);
//                float rot2 = 0.8;
//                int au = 5;
//                int wc = (int)(random(1,500));
//                color c = somecolor();
//                
//                pens[i] = new Pen( r,cx,cy,rot1,rot2,au,wc,c  );
//          }
//          
//          erasers = new Eraser[num_eraser];
//                    for (int n=0; n<num_eraser; n++) {
//                erasers[n] = new Eraser();
//          }
}
void paint(java.awt.Graphics g) {
  // This method MUST be present in your sketch for layers to be rendered!
  if (layers != null) {
    layers.paint(this);
  } else {
    super.paint(g);
  }
}
//------------------------------------------------------------------------------------------------------------------
void draw(){
  audio.play();
//  move pens  
//          for(int j=0; j<num; j++){
//                pens[j].render();
//                pens[j].move();
//                
//
//          }
//               for (int s=0; s<num_eraser; s++) {
//                  erasers[s].render();
//          }
}

//------------------------------------------------------------------------------------------------------------------
void stop(){
          for(int i=0; i<numsound; i++){
//            audio.close();
                  sample[i].close();
                  minim.stop();
                  super.stop();
          }
}


