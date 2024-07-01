import "package:flutter/material.dart";
import "package:maze_generator/classes/maze.dart";
import "package:maze_generator/classes/maze_generator.dart";
import "package:maze_generator/widgets/duration_info.dart";
import "package:maze_generator/widgets/generate_button.dart";
import "package:maze_generator/widgets/maze_container.dart";
import "package:maze_generator/widgets/maze_painter.dart";
import "package:maze_generator/widgets/maze_size_slider.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double mazeSize = 20;
  Maze maze = Maze(20, 20);
  late MazeGenerator generator = MazeGenerator(maze);
  Duration mazeGenerationTime = Duration.zero;
  int previousMazeSize = 20;
  bool finishedDrawing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Maze Generator',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 32, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DurationInfo(mazeGenerationTime: mazeGenerationTime),
            MazeContainer(
                finishedDrawing: finishedDrawing,
                generator: generator,
                previousMazeSize: previousMazeSize),
            MazeSizeSlider(
              mazeSize: mazeSize,
              onChanged: (value) {
                setState(() {
                  mazeSize = value;
                });
              },
            ),
            GenerateButton(
                onPressed: () {
                  setState(() {
                    previousMazeSize = mazeSize.round();
                    maze = Maze(mazeSize.round(), mazeSize.round());
                    generator = MazeGenerator(maze);
                    mazeGenerationTime = generator.generateMaze();
                    finishedDrawing = true;
                  });
                },
                finishedDrawing: finishedDrawing)
          ],
        ));
  }
}
