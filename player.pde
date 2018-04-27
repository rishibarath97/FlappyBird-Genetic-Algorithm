float gravity = 0.5;

class Player{
  float v = 0;
  float y = 0;
  float x = -width/4;
  float vel = 0;
  float lift = -15;
  float fitness = 0;
  float score = 0;
  
  void show(){
    ellipse(x,y,32,32);         //Draw the player
    fill(255,255,255,100);
  }
  
  void jump(){
    vel += lift;                //Jump a certain number of pixels
  }
  
  void update(){
    vel += gravity;             //Update gravity which affects velocity
    y += vel;                   //velocity affects position
    }
  
  float retX(){
    return x;
  }
  
  float retY(){
    return y;
  }
}
