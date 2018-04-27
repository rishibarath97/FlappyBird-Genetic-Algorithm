class Brain{
  float w1 = 0;
  float w2 = 0;
  int inputNodes = 5;
  float learningRate = 0.001;
  float weights[] = new float[inputNodes];
  float bias[] = new float[inputNodes];

  void initial(){
    for(int i=0;i<inputNodes;i++){
       weights[i] = random(-1,1);  
       bias[i] = random(-1,1);
    }  
  }
  void initial(float weight[],float b[]){
     weights = weight;
     bias = b;
    }  
  
  float predict(float weights[],float inputs[]){
    int n = inputNodes;
    float sum = 0;
    
    for(int i=0;i<n;i++){
      sum += inputs[i] * weights[i] + bias[i];
    }
    float result = activator(sum);
    return result;
  }
  
  float activator(float x){  
    return pow(1 + exp(-x),-1);
    
  }
  
  float[] train(float weights[],float inputs[]){
    for(int i=0;i<inputNodes;i++){
      weights[i] += learningRate*inputs[i];  
    }
    return weights;
  }
}
