float gravity = 0.3;

class Player{
  float v = 0;
  float y = -height/4;
  float x = -width/4;
  float vel = 0;
  float lift = -10;
  float fitness = 0;
  float score = 0;
  
  void show(){
    ellipse(x,y,32,32);
    fill(255,255,255,100);
  }
  
  void jump(){
    vel += lift;
  }
  
  void update(){
    vel += gravity;
    y += vel;
    }
  
  float retX(){
    return x;
  }
  
  float retY(){
    return y;
  }
}
