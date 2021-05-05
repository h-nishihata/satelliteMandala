          GoogleMapper gMapper;
          PImage b;
          double mapCenterLat;
          double mapCenterLon;
          int zoomLevel;
          String mapType;
          int mapWidth;   
          int mapHeight;
          int i = 0;
class Layer_map extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_map(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup() {
          colorMode(HSB, 360, 100, 100, 100);
          mapCenterLat = lat;
          mapCenterLon = lon;
          zoomLevel = 10;
          mapType = GoogleMapper.MAPTYPE_SATELLITE;
          mapWidth = width;   
          mapHeight = height;
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
          if(waiting_1 == 5){
                gMapper  = new GoogleMapper(lat, lon, zoomLevel, mapType, mapWidth, mapHeight);
                b = gMapper.getMap();
                      if(b==null){
                            if(i == 4){ i=0; }
                            b =loadImage(i+".png");
                            i++;
                      }
                background(60,100,100,0);
                tint(60,100,100,100);
                image(b, 0, 0, width, height);
                
                b.loadPixels();
                takecolor();
          }
          
          if(waiting_6 > 50 && waiting_7 < 1){
                loadPixels();
                for (int s=0;s<50;s++) {
                      int x = int(random(screen.width));
                      int y = int(random(screen.height));
                      int pos = (y * b.width) + x;
                      pixels[pos] = color(0,0,100,0);
                }
                updatePixels();
          }          
  }
}

