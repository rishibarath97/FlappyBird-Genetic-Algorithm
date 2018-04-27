ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Brain> brains = new ArrayList<Brain>();
ArrayList<Player> Savedplayers = new ArrayList<Player>();
ArrayList<Brain> Savedbrains = new ArrayList<Brain>();
float rate;

float weight[] = new float[5];
float biass[] = new float[5];
int noOfPlayers = 300;
int count = 1;
int gen = 1;
float big = 0;
float bigPrev = 0;
int countMax = 0;

void setup(){
  size(600,600);
  pipes.add(new Pipe());
  for(int i=0;i<noOfPlayers;i++){
    players.add(new Player());
    Brain b;
    b = new Brain();
    b.initial();
    brains.add(b);
  }
}

void draw(){
  background(0);
  translate(width/2,height/2);
  float m = mouseX;
  rate = map(m,0,width,1,5);
  for(int k=0;k<rate;k++){
  if(count % 60 == 0){
    if(pipes.size() >= 1)
      pipes.add(new Pipe());
  }
  
  for(int i=pipes.size()-1;i>=0;i--){
    pipes.get(i).show();
    pipes.get(i).update();
    if(pipes.get(i).offscreen()){
      pipes.remove(i);
    }
    
    for(Pipe p : pipes){
      for(int j=0;j<players.size();j++){
        if(p.hit(players.get(j)) || players.get(j).y > height/2 || players.get(j).y < -height/2){
          Savedplayers.add(players.get(j));
          Savedbrains.add(brains.get(j));
          players.remove(j);
          brains.remove(j); 
        }
      }
    }
  }
  
  for(int j = 0;j<players.size();j++){
    float inputs[] = new float[5];
    inputs[0] = players.get(j).retY() / height;
    Pipe p = returnNearestPipe(pipes,players.get(j));
    inputs[1] = p.x / width;
    inputs[2] = ((height / 2) - p.h) / height;
    inputs[3] = (-p.h + p.spacing) / height; 
    inputs[4] = players.get(j).vel;

    float result = brains.get(j).predict(brains.get(j).weights,inputs);
    if(result > 0.5)
      players.get(j).jump();
    
    players.get(j).update();
    players.get(j).score++;
    players.get(j).show();
    
  }
  count++;
  if(players.size() == 0){
    //Brain b = calcBestPlayer();
    Brain first = Savedbrains.get(Savedbrains.size()-1);
    printArray(first.weights);
    Brain second = Savedbrains.get(Savedbrains.size()-2);
    if(count > countMax){
      countMax = count;
      print("NEW HIGH SCORE:",countMax);
      println(" IN GEN",gen);
    }
    count = 1;
    Savedbrains.clear();
    Savedplayers.clear();
    println("Generation:",gen);
    for(int i=0;i<noOfPlayers;i++){
      Brain b = crossOver(first,second,0.2);
      b = mutate(b,0.2);
      brains.add(b);
      players.add(new Player());
    }
    pipes.clear();
    pipes.add(new Pipe());
    
    gen++;
  } 
}
  //println(brains.size());
}

Pipe returnNearestPipe(ArrayList<Pipe> pipes,Player player){
  float dist = 999;
  float d = 0;
  Pipe closest = null;
    closest = pipes.get(0);
    for(Pipe p : pipes){
      d = p.x + 40 - player.x;
      if(d < dist && d > 0){
        closest = p;
        dist = d;
      }
    }
  return closest;
}

Brain calcBestPlayer(){
  Brain b = null;
  float sum = 0;
  for(Player pl :Savedplayers){
    sum += pl.score;
  }
  for(Player P:Savedplayers){
    P.fitness = P.score / sum;
  }
  return b;
}

Brain crossOver(Brain one, Brain two,float crossOverRate){
  float w[] = new float[one.weights.length];
    for(int i=0;i<one.weights.length;i++){
      float rand = random(0,1);
      if(rand < crossOverRate){
          w[i] = two.weights[i];
      }
      else{
        w[i] = one.weights[i];
      }
    }
    Brain b = new Brain();
    b.weights = w;
    
    return b;
}

Brain mutate(Brain b,float rate){
    for(int i=0;i<b.weights.length;i++){
      float rand = random(0,1);
      if(rand < rate){  
        b.weights[i]*=random(1);
    }
  }
  return b;
}
