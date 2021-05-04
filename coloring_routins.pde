//COLORING ROUTINES


color somecolor() {
          return goodcolor[int(random(numpal))];
}


void takecolor(String fn) {
        PImage b;
        b = loadImage(fn);
        image(b,0,0,width,height);
      
for (int x=0;x<b.width;x++){
    for (int y=0;y<b.height;y++) {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
}
}

