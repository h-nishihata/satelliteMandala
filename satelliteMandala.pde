/*

8888888o    88            88   oo            888      8888    8888                          888           88
88     Y88  88  .o888o88  88  88888 .88888o  888      888Yo  oY 88  .8888o.  88.888o.  .8888.88  .8888o.  88   o8888o
88     .88  88  88    88  88   88    ..oo88  888      888 Y..Y  88   ..oo88  88    88 o8Y   Y88   ..oo88  88   ..oo88
88....o8Y   88  o8o..o88  88   88.. 88...88  888      888 YooY  88 88o  o88  88    88  Y8...o88 Y8o  .88  88  88. .o8
""""""      ""  .."" .88  ""    """  """ """ """      """  ""  """   ""  """ ""    ""    ""  ""   ""  """ ""   ""  """
                  """"
                  
          Satellite Mandala_2.0, {Software} Structures
          h.nishihata  2014
          Tokyo, Japan
          nishihatahitoshi.com
          
          collaboration with ARTSAT Project
          artsat.jp

*/

import com.nootropic.processing.layers.*;
import ddf.minim.*;
import processing.net.*;

//  dimensions
//  layers
          AppletLayers layers;
//  map
          XMLElement artsat, results, item, sensors;
          float lat, lon, epx, epy, epz, emx, emy, emz;
          GoogleMapper gMapper;
          PImage b;
//  pen
          int num = 100;
          Pen[] pens;
//  paricle
          Spot[] sp;  
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
          int h;
          int s;
          int br;
          float a;
          boolean end_0 = true;
          boolean end_1 = true;
          boolean end_2 = false;
          boolean end_3 = false;
          boolean end_4 = false;
          boolean end_5 = false;
          boolean end_6 = false;
          
//  MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){
  
          size(screenWidth,screenHeight);
          ellipseMode(RADIUS);
          colorMode(HSB,360,100,100,100);
          frameRate(10);
          smooth();
          
//  layers          
          layers = new AppletLayers(this);
          Layer_pen p = new Layer_pen(this);
          Layer_particle p_ = new Layer_particle(this);
          Layer_map m = new Layer_map(this);
          Layer_mask k = new Layer_mask(this);

          layers.addLayer(p);  
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
//  time          
          h = 0;
          s = 80;
          br = 100;
          a = 0.7;
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
          if(waiting_1 == 0){

                artsat = new XMLElement(this, "http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=lat,lon");
                results = artsat.getChild("results");
                item = results.getChild("item");
                sensors = item.getChild("sensors");
                
                lat = float(sensors.getChild("lat").getChild("value").getContent());
//                println("lat is "+lat);
                lon = float(sensors.getChild("lon").getChild("value").getContent());
//                println("lon is "+lon);
          }

          if(waiting_1==1 || waiting_2==1999 ||  waiting_3==1999 || waiting_4==1999 ||  waiting_5==1999 || waiting_6==1999){

                artsat = new XMLElement(this, "http://api.artsat.jp/web/v2/invader/sensor_data.xml?intrpl=linear&sensor=epx,epy,epz,emx,emy,emz");
                results = artsat.getChild("results");
                item = results.getChild("item");
                sensors = item.getChild("sensors");

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
                if(epx+epy+epz+emx+emy+emz > 0.3){  
                      h=(int)random(0,100);
                }else{
                      h=(int)random(100,360);
                }
//                println("hue is "+h);
          }



// setting time
          if(end_0==true){
                waiting_1++;
                fading(h, s, br, a);
                changeSound(0,0);   
          }
//  phase 1
          if(end_1 == true){
          if(waiting_2 < 2000){
                waiting_2++;
                if(waiting_2 >= 1300) changeSound(0,2);
          }else{
                end_0 = false;
                end_2 = true;
                fading(h, s, br, a);
                changeSound(0,0);               
          }
          }
//  phase 2
          if(end_2 == true){
          if(waiting_3 < 2000){
                waiting_3++;
          }else{
                end_1 = false;
                end_3 = true;
                fading(h, s, br, a);
                changeSound(0,0);
          }       
          }
//  phase 3
          if(end_3 == true){
          if(waiting_4 < 2000){
                waiting_4++;
          }else{
                end_2 = false;
                end_4 = true;
                fading(h, s, br, a);
                changeSound(0,3);
          }  
          }
//  phase 4
          if(end_4 == true){
          if(waiting_5 < 2000){
                waiting_5++;
          }else{
                end_3 = false;
                end_5 = true;
                fading(h, s, br, a);
                changeSound(0,2);
          }
          }
//  phase 5
          if(end_5 == true){
          if(waiting_6 < 2000){
                waiting_6++;
          }else{
                end_4 = false;
                end_6 = true;
                fading(h, s, br, a);
                changeSound(2,4);   
          } 
          }          
//  reset          
          if(end_6 == true){
          if(waiting_7 < 2000){
                waiting_7++;
          }else{
                waiting_1 = waiting_2 = waiting_3 = waiting_4 = waiting_5 = waiting_6 = waiting_7 = 0;
                end_2 = end_3 = end_4 = end_5 = end_6 = false;
                end_0 = end_1 = true;
          }
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



/* SCREEN SAVER
------------------------------------------------------------------------------------------------------------------
void mouseMoved(){
        exit();
}

void keyPressed(){
        exit();
}
*/
