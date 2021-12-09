
# knights_travails

## A project created by TheJulianFlores in ruby

[A live preview can be found here](https://replit.com/@thejulianflores/KnightTraversal?embed=true#main.rb)

This project will be a ruby implementation that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop along the way.

An example implementation of the program is the following:

```
knight_moves([0,.0],[1,2]) == [[0,0],[1,2]]

knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]

knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
```

The project requirements are as follows:

```
1. Put together a script that creates a game board and a knight.

2. Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.

3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.

4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like.
```

## Thoughts and Reflections

This was definitely a challenge. Many of the concepts (such as recursion, linked lists, and binary search trees) introduced in the CS path on TheOdinProject required a bit of learning, but this challenge required much more. Some of the required readings were on:

- A revisiting of queues
- Implementing a breadth-first approach 
- Implementing a graph theory approach by finding the shortest path of an unweighted graph

[This YouTube video](https://www.youtube.com/watch?v=T_m27bhVQQQ) was a great primer on using a breadth-first search to find optimal paths in an unweighted graph. To expand, this program following the following pseudocode approach:

```
1. Take in the user starting input, and add all possible moves the knight can make to the queue.

2. While the queue is not empty AND there are moves we don't have a path to:
   - Take the first move in the queue
   - If there isn't a path to that move
     - Update the path cost to that move
     - Update the previous node of that move
     - Update that a path to that move exists
     - For each move from this move
       - If there is no path to the new move
         - Add that move to the queue

3. Beginning at the target move
   - While we are not at the starting move
     - For each previous move
       - If we are at the current move's previous move
         - Set the current move to the previous move
         - Push the current move to an array tracking each move made
   
