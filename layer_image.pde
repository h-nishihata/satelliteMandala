//  show image
class Layer_image extends Layer {
//  int h;

Layer_image(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){
          colorMode(HSB,360,100,100,100);
//          background(0,0,100,0);
//          h = 60;
//  getting image   
          double mapCenterLat = random(10.000000,90.000000);
          double mapCenterLon = random(10.000000,90.000000);
          int    zoomLevel = 10;
          String mapType = GoogleMapper.MAPTYPE_SATELLITE;
          int    mapWidth = width;   
          int    mapHeight = height;
          
          gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);

          b = gMapper.getMap();
          if(b == null){
                b =loadImage("sat_data.jpg"); 
           }
tint(60,100,100,60);
          image(b,0,0,width,height);
          
          b.loadPixels();
          takecolor();
}

//------------------------------------------------------------------------------------------------------------------
  void draw() {

                 
    }
  
}
