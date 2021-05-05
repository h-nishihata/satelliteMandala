          double mapCenterLat;
          double mapCenterLon;
          int    zoomLevel;
          String mapType;
          int    mapWidth;   
          int    mapHeight;
class Layer_image extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_image(PApplet parent) {
    super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup() {
          colorMode(HSB, 360, 100, 100, 100);
      
          mapCenterLat = random(10.000000, 90.000000);
          mapCenterLon = random(10.000000, 90.000000);
          zoomLevel = 10;
          mapType = GoogleMapper.MAPTYPE_SATELLITE;
          mapWidth = width;   
          mapHeight = height;
          gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
      
          b = gMapper.getMap();
          if(b == null)b =loadImage("sat_data.jpg"); 
          tint(60, 100, 100, 50);
          image(b, 0, 0, width, height);
      
          b.loadPixels();
          takecolor();
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
          if(waiting_5 > 0 && waiting_5 < 100){
                loadPixels();
                for (int s=0;s<1000;s++) {
                      int x = int(random(screen.width));
                      int y = int(random(screen.height));
                      int pos = (y * b.width) + x;
                      pixels[pos] = color(0,0,100,0);
                }
                updatePixels();
          }
          
          
          if(waiting_6 == 1){         
                mapCenterLat = random(10.000000, 90.000000);
                mapCenterLon = random(10.000000, 90.000000);
                zoomLevel = 10;
                mapType = GoogleMapper.MAPTYPE_SATELLITE;
                mapWidth = width;   
                mapHeight = height;
                gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
            
                b = gMapper.getMap();
                if(b == null)b =loadImage("sat_data.jpg"); 
//                tint(60, 100, 100, 50);
                image(b, 0, 0, width, height);
                b.loadPixels();
                takecolor();
          }
                
  }
}

//------------------------------------------------------------------------------------------------------------------
//void keyPressed() {
//        if ( key == ' ' ) {
//              saveFrame("sc_shot####.jpg");
//        }
//}  

