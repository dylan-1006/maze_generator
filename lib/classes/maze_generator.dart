import 'dart:math';
import 'package:maze_generator/classes/maze.dart';

const int UP = 0;
const int DOWN = 1;
const int LEFT = 2;
const int RIGHT = 3;

class MazeGenerator {
  final Maze maze;
  final Random random = Random();

  MazeGenerator(this.maze);

  Duration generateMaze() {
    //Timer to measure how much time required to generate maze
    final startTime = DateTime.now();
    //Fixed starting point; Can be changed to start at random position
    generateUsingRecursiveBacktracking(0, 0);
    final endTime = DateTime.now();
    return endTime.difference(startTime);
  }

  void generateUsingRecursiveBacktracking(int row, int column) {
    //Initialise starting cell as visited
    maze.grid[row][column].visitedBefore = true;

    // 0 = Up, 1 = Down, 2 = Left, 3 = Right
    //List<int> directions = [0, 1, 2, 3];
    List<int> directions = [UP, DOWN, LEFT, RIGHT];
    directions.shuffle(random); //Makes moving direction random

    //For loop with recursion for recursive backtracking
    for (int direction in directions) {
      int newCellRow = row;
      int newCellColumn = column;

      switch (direction) {
        case UP: //Move up
          newCellRow--;
          break;
        case DOWN: //Move down
          newCellRow++;
          break;

        case LEFT: //Move left
          newCellColumn--;
          break;

        case RIGHT: //Move right
          newCellColumn++;
          break;
      }

      if (isInBounds(newCellRow, newCellColumn) &&
          !maze.grid[newCellRow][newCellColumn].visitedBefore) {
        removeCellWall(row, column, direction);
        generateUsingRecursiveBacktracking(newCellRow, newCellColumn);
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
      case UP: //Break wall between current cell & cell above
        maze.grid[row][column].topWall = false;
        maze.grid[row - 1][column].bottomWall = false;
        break;

      case DOWN: //Break wall between current cell & cell below
        maze.grid[row][column].bottomWall = false;
        maze.grid[row + 1][column].topWall = false;
        break;

      case LEFT: //Break wall between current cell & left cell
        maze.grid[row][column].leftWall = false;
        maze.grid[row][column - 1].rightWall = false;
        break;

      case RIGHT: //Break wall between current cell & right cell
        maze.grid[row][column].rightWall = false;
        maze.grid[row][column + 1].leftWall = false;
        break;
    }
  }
}
