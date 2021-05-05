int i = 1;
class Layer_image extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_image(PApplet parent) {
    super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup() {
          colorMode(HSB, 360, 100, 100, 100);
      
          double mapCenterLat = random(10.000000, 90.000000);
          double mapCenterLon = random(10.000000, 90.000000);
          int zoomLevel = 10;
          String mapType = GoogleMapper.MAPTYPE_SATELLITE;
          int mapWidth = width;   
          int mapHeight = height;
          gMapper  = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
      
//          b = gMapper.getMap();
//          if(b == null)
          b =loadImage("0.png"); 
          tint(60, 100, 100, 50);
          image(b, 0, 0, width, height);
      
          b.loadPixels();
          takecolor();
}

//------------------------------------------------------------------------------------------------------------------
void draw() {
 
          if(waiting_5 > 50 && waiting_6 < 100){
                loadPixels();
                for (int s=0;s<1000;s++) {
                      int x = int(random(screen.width));
                      int y = int(random(screen.height));
                      int pos = (y * b.width) + x;
                      pixels[pos] = color(0,0,100,0);
                }
                updatePixels();
          }
          
          
          if(waiting_7 == 1){         
                b =loadImage(i+".png");
                if(b==null){
                      i=0;
                      b =loadImage(i+".png");
                }
//                tint(60, 100, 100, 50);
                image(b, 0, 0, width, height);
                i++;
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

