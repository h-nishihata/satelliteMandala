int num_p = 600;
class Layer_particle extends Layer {

//------------------------------------------------------------------------------------------------------------------
Layer_particle(PApplet parent) {
          super(parent);
}

//------------------------------------------------------------------------------------------------------------------
void setup(){  
          sp1 = new Spot1[num_p];
          for(int i=0; i<num_p; i++){
                sp1[i] = new Spot1();
          }
          sp2 = new Spot2[num_p];
          for(int i=0; i<num_p; i++){
                sp2[i] = new Spot2();
          }
          sp3 = new Spot3[num_p];
          for(int i=0; i<num_p; i++){
                sp3[i] = new Spot3();
          }
          sp4 = new Spot4[num_p];
          for(int i=0; i<num_p; i++){
                sp4[i] = new Spot4();
          }
}

//------------------------------------------------------------------------------------------------------------------
void draw(){

          if(waiting_2 == 1665)sample[1].trigger();
          if(waiting_2 >= 1665 && waiting_3 < 10){
                    for(int j=0; j<num_p; j++){
                          sp1[j].draw();
                          sp1[j].move();
                    }
           }     
           if(waiting_2 >= 1690 && waiting_3 < 10){
                    for(int j=0; j<num_p; j++){
                          sp2[j].draw();
                          sp2[j].move();
                    }   
           }
          if(waiting_2 >= 1710 && waiting_3 < 10){
                    for(int j=0; j<num_p; j++){
                          sp3[j].draw();
                          sp3[j].move();
                    }                       
          }
          if(waiting_2 >= 1950 && waiting_3 < 200){
                    for(int j=0; j<num_p; j++){
                          sp4[j].draw();
                          sp4[j].move();
                    }                       
          }
//  reset
          if(waiting_3 == 200){
                    for(int j=0; j<num_p; j++){
                          sp1[j].x=width*1/3;
                          sp1[j].y=0;
                          sp2[j].x = width*1/5+height+8;
                          sp2[j].y = (height-29)/2;
                          sp3[j].x = width*1/4;
                          sp3[j].y = height-25;
                          sp4[j].x = width*1/5;
                          sp4[j].y = (height-25)*4/5;
                    }
          }
 }
}
