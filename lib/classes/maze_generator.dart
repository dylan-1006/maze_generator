import 'dart:math';

import 'package:maze_generator/classes/maze.dart';

class MazeGenerator {
  final Maze maze;
  final Random random = Random();

  MazeGenerator(this.maze);

  void generateMaze() {
    //Fixed starting point; Can be changed to start at random position
    generateUsingDepthFirstSearch(0, 0);
  }

  void generateUsingDepthFirstSearch(int row, int column) {
    //Initialise starting cell as visited
    maze.grid[row][column].visitedBefore = true;

    // 0 = Up, 1 = Down, 2 = Left, 3 = Right
    List<int> directions = [0, 1, 2, 3];
    directions.shuffle(random); //Makes moving direction random

    //For loop with recursion for recursive backtracking
    for (int direction in directions) {
      int newCellRow = row;
      int newCellColumn = column;

      switch (direction) {
        case 0: //Move up
          newCellRow--;
          break;
        case 1: //Move down
          newCellRow++;
          break;

        case 2: //Move left
          newCellColumn--;
          break;

        case 3: //Move right
          newCellColumn++;
          break;
      }

      if (isInBounds(newCellRow, newCellColumn) &&
          !maze.grid[newCellRow][newCellColumn].visitedBefore) {
        removeCellWall(row, column, direction);
        generateUsingDepthFirstSearch(newCellRow, newCellColumn);
      }
    }
  }

  bool isInBounds(int row, int column) {
    //Checks if row & column are bigger than 0 but not bigger than maze size
    bool inBounds =
        row >= 0 && row < maze.rows && column >= 0 && column < maze.columns;

    return inBounds;
  }

  void removeCellWall(int row, int column, int direction) {
    switch (direction) {
      case 0: //Break wall between current cell & cell above
        maze.grid[row][column].topWall = false;
        maze.grid[row--][column].bottomWall = false;
        break;

      case 1: //Break wall between current cell & cell below
        maze.grid[row][column].bottomWall = false;
        maze.grid[row++][column].topWall = false;
        break;

      case 2: //Break wall between current cell & left cell
        maze.grid[row][column].leftWall = false;
        maze.grid[row][column--].rightWall = false;
        break;

      case 3: //Break wall between current cell & right cell
        maze.grid[row][column].rightWall = false;
        maze.grid[row][column++].leftWall = false;
        break;
    }
  }
}
