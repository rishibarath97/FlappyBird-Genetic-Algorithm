class Brain{
  float w1 = 0;
  float w2 = 0;
  int inputNodes = 5;                                 //Number of nodes for the input 
  float weights[] = new float[inputNodes];
  float bias[] = new float[inputNodes];

  void initial(){                                     //Set the weights to random initially
    for(int i=0;i<inputNodes;i++){  
       weights[i] = random(-1,1);  
       bias[i] = random(-1,1);
    }  
  }
  
  float predict(float weights[],float inputs[]){      //Prediction function based on the NN weights
    int n = inputNodes;
    float sum = 0;
    
    for(int i=0;i<n;i++){
      sum += inputs[i] * weights[i] + bias[i];
    }
    float result = activator(sum);
    return result;
  }
  
  float activator(float x){                             //Activation function is sigmoid
    return pow(1 + exp(-x),-1);
  }
}
