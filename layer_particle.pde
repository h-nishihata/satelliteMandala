int num_p = 500;
class Layer_particle extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_particle(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){  
  
          sp = new Spot[num_p];
          for(int i=0; i<num_p; i++){
                sp[i] = new Spot();
          }
          
}

//------------------------------------------------------------------------------------------------------------------
void draw(){

          if(waiting_2 == 1680)sample[1].trigger();
          if(waiting_2 >= 1660 && waiting_3 < 10){
                    for(int j=0; j<num_p; j++){
                          sp[j].draw();
                          sp[j].move();
                    }
           }
           
//  reset
          if(waiting_3 == 20){
                    for(int j=0; j<num_p; j++){
                          sp[j].x = width/2;
                          sp[j].y = 0;
                    }
          }
 }
}
