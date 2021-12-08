# knights_travails

## A project created by TheJulianFlores in ruby

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

