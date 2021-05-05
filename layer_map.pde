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
          background(0,0,100,0);
          mapCenterLat = random(10.000000, 90.000000);
          mapCenterLon = random(10.000000, 90.000000);
          zoomLevel = 10;
          mapType = GoogleMapper.MAPTYPE_SATELLITE;
          mapWidth = width;   
          mapHeight = height;
           
          gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
          println("mapCenterLat is "+mapCenterLat);
          println("mapCenterLon is "+mapCenterLon);
          b = gMapper.getMap();
          if(b==null){
                if(i == 4) i=0; 
                b =loadImage(i+".png");
                i++;
          }

          tint(60,100,100,60);
          image(b, 0, 0, width, height);
            
          b.loadPixels();
          takecolor();
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
          mapCenterLat = lat;
          mapCenterLon = lon;
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

          if(waiting_2==5){
                gMapper  = new GoogleMapper(mapCenterLat,mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);         
                b = gMapper.getMap();    
                if(b==null){
                      if(i == 4) i=0;     
                      b =loadImage(i+".png");
                      i++;
                }
                tint(255,255,255,90);
                image(b, 0, 0, width, height);

                b.loadPixels();
                takecolor();
          }

  }
}

