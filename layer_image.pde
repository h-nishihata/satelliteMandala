class Layer_image extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_image(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){
          colorMode(HSB,360,100,100,100);
 
          double mapCenterLat = random(10.000000,90.000000);
          double mapCenterLon = random(10.000000,90.000000);
          int    zoomLevel = 10;
          String mapType = GoogleMapper.MAPTYPE_SATELLITE;
          int    mapWidth = width;   
          int    mapHeight = height;
          gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);

          b = gMapper.getMap();
          if(b == null) b =loadImage("sat_data.jpg"); 
          tint(60,58,50,60);
          image(b,0,0,width,height);
          
          b.loadPixels();
          takecolor();
}

//------------------------------------------------------------------------------------------------------------------
void draw() {    
  }
}

//------------------------------------------------------------------------------------------------------------------
//void keyPressed() {
//  if ( key == ' ' ) {
//     saveFrame("sc_shot####.jpg");
//  }
//}  

