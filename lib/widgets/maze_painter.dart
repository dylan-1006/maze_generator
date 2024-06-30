import 'package:flutter/material.dart';
import 'package:maze_generator/classes/maze.dart';

class MazePainter extends CustomPainter {
  final Maze maze;

  MazePainter(this.maze);

  @override
  void paint(Canvas canvas, Size size) {
    //Calculates the width & height for each cell
    double cellWidth = size.width / maze.columns;
    double cellHeight = size.height / maze.rows;
    Paint wallPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    //Nested for loop to iterate through each column & row for painting
    for (int row = 0; row < maze.rows; row++) {
      for (int col = 0; col < maze.columns; col++) {
        //Get x & y coordinate by multiplying current column/row with width/height
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MazeWidget extends StatelessWidget {
  final Maze maze;
  const MazeWidget(this.maze, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: MazePainter(maze));
  }
}
