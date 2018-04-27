# FlappyBird Genetic Algorithm

This is my implementation of a flappy bird genetic algorithm using Processing3. This project was inspired by Daniel Shiffman of the Coding Train (https://github.com/CodingTrain).
You can find his implementation of this on p5.js on (https://youtu.be/c6y21FkaUqw)

# Working

This project has a basic flappy bird game layout where a bird (player) must avoid the oncoming pipes and the floor. The game is played using a player input to make the bird jump.
In this project, I used a basic 2 layer neural network along with a genetic algorithm to "teach" the bird when to jump and when not to.

The inputs given to the Genetic Algorithm are:
1: The 'y' value of the bird
2: The 'x' value of the nearest pipe
3: The co-ordinate of the lower pipe's height
4: The co-ordinate of the top pipe's height
5: The bird's own velocity

The activation function used for this NN is the the sigmoid function (or logistic function).

# Genetic Algorithm

A genetic algorithm is a search heuristic that is inspired by Charles Darwin’s theory of natural evolution. This algorithm reflects the process of natural selection where the fittest individuals are selected for reproduction in order to produce offspring of the next generation.

As the definition says, the algorithm picks the two best proforming birds from the pool and performs a "crossover", the same way two genes (one from the father and one from the mother) constitute a child gene. The amount of crossover is regulated by the "crossOverRate", which is a probability of the weights coming from the mother.

Another step in the Genetic Algorithm is the mutation. The "rate" is the probability of the weights of the gene being mutated by a random value.
