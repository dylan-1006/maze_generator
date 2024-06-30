import 'package:flutter/material.dart';
import 'package:maze_generator/classes/maze.dart';
import 'package:maze_generator/classes/maze_generator.dart';

class MazePainter extends CustomPainter {
  final Maze maze;

  MazePainter(this.maze);

  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / maze.columns;
    double cellHeight = size.height / maze.rows;
    Paint wallPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    for (int row = 0; row < maze.rows; row++) {
      for (int col = 0; col < maze.columns; col++) {
        double x = col * cellWidth;
        double y = row * cellHeight;

        if (maze.grid[row][col].topWall) {
          canvas.drawLine(Offset(x, y), Offset(x + cellWidth, y), wallPaint);
        }
        if (maze.grid[row][col].rightWall) {
          canvas.drawLine(Offset(x + cellWidth, y), Offset(x + cellWidth, y + cellHeight), wallPaint);
        }
        if (maze.grid[row][col].bottomWall) {
          canvas.drawLine(Offset(x, y + cellHeight), Offset(x + cellWidth, y + cellHeight), wallPaint);
        }
        if (maze.grid[row][col].leftWall) {
          canvas.drawLine(Offset(x, y), Offset(x, y + cellHeight), wallPaint);
        }
      }
    }
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
