//  show image
class MyLayer extends Layer {
          MyLayer(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){
          colorMode(HSB,360,100,100,100);
          
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
     }else{
        
    

          tint(60,100,100,60);
          image(b,0,0,width,height);
     }
          b.loadPixels();
                
          takecolor();

}

//------------------------------------------------------------------------------------------------------------------
  void draw() {
    
  }
}

