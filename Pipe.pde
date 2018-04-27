class Pipe{
  float h = random(100,height/2);
  float x = width/2;
  float y = 0;
  float speed = 5;
  float spacing = 100;                                            //spacing between the pipes
  
  void show(){
    rect(x,height/2,20,-h);                                       //Draw bottom pipe
    rect(x,-height/2,20,height/2 - h + spacing);                  //Draw top pipe
  }
  
  void update(){   
    x -= speed;                                                   //Change the speed every frame
  }
  
  boolean offscreen(){
    if(x < -width/2)                                              //Check if the pipe has gone offscreen
      return true;
    else
      return false;
  }
  
  boolean hit(Player player){
    if(player.x == x){ 
      if((player.y >= height/2 - h || player.y <= -h+spacing))    //Check if the bird is in between the pipes
        return true;
    }
      return false;
    
  }
  
  float retSpace(){
    return (- h + spacing);  
  }
}
