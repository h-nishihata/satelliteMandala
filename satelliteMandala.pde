/*

8888888o    88            88   oo            888      8888    8888                          888           88
88     Y88  88  .o888o88  88  88888 .88888o  888      888Yo  oY 88  .8888o.  88.888o.  .8888.88  .8888o.  88   o8888o
88     .88  88  88    88  88   88    ..oo88  888      888 Y..Y  88   ..oo88  88    88 o8Y   Y88   ..oo88  88   ..oo88
88....o8Y   88  o8o..o88  88   88.. 88...88  888      888 YooY  88 88o  o88  88    88  Y8...o88 Y8o  .88  88  88. .o8
""""""      ""  .."" .88  ""    """  """ """ """      """  ""  """   ""  """ ""    ""    ""  ""   ""  """ ""   ""  """
                  """"
                  
          Digital Mandala_1.0, {Software} Structures
          h.nishihata  2013
          Tokyo, Japan
          nishihatahitoshi.com
          
          collaboration with ARTSAT Project
          artsat.jp
*/


import com.nootropic.processing.layers.*;
import ddf.minim.*;
import processing.net.*;

// dimensions
//  layers
          AppletLayers layers;
//  map
          XMLElement artsat, results, item, sensors;
          float lat, lon, epx, epy, epz, emx, emy, emz;
//  pen
          int num = 100;
          Pen[] pens;
//  paricle
          Spot1[] sp1;
          Spot2[] sp2;  
          Spot3[] sp3;
          Spot4[] sp4;  
//  pallete
          int maxpal = 100;
          int numpal = 0;
          color[] goodcolor = new color[maxpal];
//  sounds
          Minim minim;
          AudioSample[] sample;
          int numsound = 5;
          int[] soundType = new int[numsound];
//  time
          int waiting_1=0;
          int waiting_2=0;
          int waiting_3=0;
          int waiting_4=0;
          int waiting_5=0;
          int waiting_6=0;
          int waiting_7=0;

//  MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){
          size(screenWidth,screenHeight);
          ellipseMode(RADIUS);
          colorMode(HSB,360,100,100,100);
          background(60,65,40,0);
          frameRate(10);
          smooth();
          
//  layers          
          layers = new AppletLayers(this);
          Layer_pen p = new Layer_pen(this);
          Layer_time t = new Layer_time(this);
          Layer_particle p_ = new Layer_particle(this);
          Layer_map m = new Layer_map(this);
          Layer_mask k = new Layer_mask(this);

          layers.addLayer(p);  
          layers.addLayer(t);
          layers.addLayer(p_);
          layers.addLayer(m);  
          layers.addLayer(k);
          
//  sounds         
          minim = new Minim(this);
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("empty.mp3");
          sample[1] = minim.loadSample("01.mp3");
          sample[2] = minim.loadSample("02.mp3");
          sample[3] = minim.loadSample("03.mp3");
          sample[4] = minim.loadSample("04.mp3");
}

//------------------------------------------------------------------------------------------------------------------
void paint(java.awt.Graphics g) {
          if (layers != null) {
                layers.paint(this);
          }else{
                super.paint(g);
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
//  Get Data from ARTSAT API
          if(waiting_1 == 1){
                artsat = new XMLElement(this, "http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=lat,lon");
                results = artsat.getChild("results");
                item = results.getChild("item");
                sensors = item.getChild("sensors");
//                delay(10000);
                lat = float(sensors.getChild("lat").getChild("value").getContent());
//                println(lat);
                lon = float(sensors.getChild("lon").getChild("value").getContent());
//                println(lon);
          }

          if(waiting_1==1 || waiting_2==1 ||  waiting_3==1 || waiting_4==1 ||  waiting_5==1 || waiting_6==1 || waiting_7==1){
                artsat = new XMLElement(this, "http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=epx,epy,epz,emx,emy,emz");
                results = artsat.getChild("results");
                item = results.getChild("item");
                sensors = item.getChild("sensors");
//                delay(10000);
                epx = float(sensors.getChild("epx").getChild("value").getContent());
//                println(epx);
                epy = float(sensors.getChild("epy").getChild("value").getContent());
//                println(epy);
                epz = float(sensors.getChild("epz").getChild("value").getContent());
//                println(epz);
                emx = float(sensors.getChild("emx").getChild("value").getContent());
//                println(emx);
                emy = float(sensors.getChild("emy").getChild("value").getContent());
//                println(epy);
                emz = float(sensors.getChild("emz").getChild("value").getContent());
//                println(emz);
          }
}

//------------------------------------------------------------------------------------------------------------------
void stop(){
          for(int i=0; i<numsound; i++){
                sample[i].close();
          }
          minim.stop();
          super.stop();
}


//  SCREEN SAVER
//------------------------------------------------------------------------------------------------------------------
//void mouseMoved(){
//        exit();
//}
//
//void keyPressed(){
//        exit();
//}

