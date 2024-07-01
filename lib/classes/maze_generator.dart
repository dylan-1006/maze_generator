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

  //Generate maze and return the duration it took
  Duration generateMaze() {
    final startTime = DateTime.now();
    //Start generating maze with fixed top left corner position.
    generateUsingRecursiveBacktracking(0, 0);
    final endTime = DateTime.now();
    return endTime.difference(startTime);
  }

  //Recursive backtracking algorithm to generate maze
  void generateUsingRecursiveBacktracking(int row, int column) {
    //Initialise starting cell as visited
    maze.grid[row][column].visitedBefore = true;

    //Shuffle direction ensure random maze is being generated
    List<int> directions = [UP, DOWN, LEFT, RIGHT];
    directions.shuffle(random);

    for (int direction in directions) {
      int newCellRow = row;
      int newCellColumn = column;

      switch (direction) {
        case UP:
          newCellRow--;
          break;
        case DOWN:
          newCellRow++;
          break;

        case LEFT:
          newCellColumn--;
          break;

        case RIGHT:
          newCellColumn++;
          break;
      }

      if (isInBounds(newCellRow, newCellColumn) &&
          !maze.grid[newCellRow][newCellColumn].visitedBefore) {
        removeWallBetweenCells(row, column, direction);
        generateUsingRecursiveBacktracking(newCellRow, newCellColumn);
      }
    }
  }

  //Checks if a cell is within the bounds of maze
  bool isInBounds(int row, int column) {
    bool inBounds =
        row >= 0 && row < maze.rows && column >= 0 && column < maze.columns;

    return inBounds;
  }

  //Removes wall between two adjacent celss
  void removeWallBetweenCells(int row, int column, int direction) {
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
