//DIGITAL MANDALA _ v012


//dimensions
import ddf.minim.*;

Minim minim;
AudioSample[] sample;
int numsound = 3;

int num = 100;
Pen[] pens;

int maxpal = 100;
int numpal = 0;

color[] goodcolor = new color[maxpal];


//MAIN
//------------------------------------------------------------------------------------------------------------------
void setup(){

          size(1000,1000,P3D);
          ellipseMode(RADIUS);
          colorMode(RGB,100);
          
          background(150,100,80);
          takecolor("sat_data.jpg");
          frameRate(30);
          smooth();
          noStroke();
          
          minim = new Minim(this);
          sample = new AudioSample[numsound];
          sample[0] = minim.loadSample("test.mp3");
          sample[1] = minim.loadSample("test.mp3");
          sample[2] = minim.loadSample("test.mp3");
          
          
          pens = new Pen[num];
          
          for(int i=0; i<num; i++){
            
                float r = random(10,30);
                float cx =  0.5 + noise(random(width))*width;
                float cy =  0.5 + noise(random(height))*height;
                float rot1 = random(1,30);
                float rot2 = 0.8;
                int au = 5;
                
                pens[i] = new Pen( r,cx,cy,rot1,rot2,au, (int)(random(1,500)) );
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){
  
          for(int j=0; j<num; j++){
                pens[j].render();
                pens[j].move();
          }
          
}

//------------------------------------------------------------------------------------------------------------------
void stop(){
  for(int i=0; i<numsound; i++){
          sample[i].close();
          minim.stop();
          super.stop();
  }
}

