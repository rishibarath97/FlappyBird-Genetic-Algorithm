class Pipe{
  float h = random(100,height/2);
  float x = width/2;
  float y = 0;
  float speed = 5;
  float spacing = 75;
  
  void show(){
    rect(x,height/2,20,-h);
    rect(x,-height/2,20,height/2 - h + spacing);
    //ellipse(0,height/2-h,4,4);
    //ellipse(0,(-h+spacing),4,4);
  }
  
  void update(){   
    x -= speed;
  }
  
  boolean offscreen(){
    if(x < -width/2 || x > height/2)
      return true;
    else
      return false;
  }
  
  boolean hit(Player player){
    if(player.x == x){ 
      if((player.y >= height/2 - h || player.y < -h+spacing))
        return true;
    }
      return false;
    
  }
  
  float retSpace(){
    return (- h + spacing);  
  }
 
  float retH(){
    return h;  
  }
}
