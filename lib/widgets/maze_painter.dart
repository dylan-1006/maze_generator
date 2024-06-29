import 'package:flutter/material.dart';
import 'package:maze_generator/classes/maze.dart';
import 'package:maze_generator/classes/maze_generator.dart';

class MazePainter extends CustomPainter {
  final Maze maze;

  MazePainter(this.maze);

  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / maze.columns;
    double cellHeight = size.height / maze.rows;
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MazeWidget extends StatelessWidget {
  final Maze maze;
  MazeWidget(this.maze);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: MazePainter(maze));
  }
}
