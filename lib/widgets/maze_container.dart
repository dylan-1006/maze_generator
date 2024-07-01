import 'package:flutter/material.dart';
import 'package:maze_generator/classes/maze_generator.dart';
import 'package:maze_generator/widgets/maze_painter.dart';

class MazeContainer extends StatelessWidget {
  final bool finishedDrawing;
  final MazeGenerator generator;
  final int previousMazeSize;
  const MazeContainer(
      {required this.finishedDrawing,
      required this.generator,
      required this.previousMazeSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 360,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: finishedDrawing
              ? MazeWidget(generator.maze)
              : const Text(
                  'Click generate to create a new maze',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(bottom: 35, left: 25, right: 25),
          child: Text(
            '${previousMazeSize}x$previousMazeSize',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: finishedDrawing ? Colors.black : Colors.transparent),
          ),
        ),
      ],
    );
  }
}
