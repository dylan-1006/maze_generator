import "package:flutter/material.dart";

class Cell {
  //Each cell is a square that has 4 walls
  //True indicates that the wall hasn't been removed yet
  bool topWall = true;
  bool bottomWall = true;
  bool leftWall = true;
  bool rightWall = true;

  bool visitedBefore = false;
}

class Maze {
  final int rows;
  final int columns;
  late List<List<Cell>> grid; //2D Array to store the row & column of maze

  Maze(this.rows, this.columns) {
    //Fill the grid up with cells
    grid = List.generate(rows, (_) => List.generate(columns, (_) => Cell()));
  }
}