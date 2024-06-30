import "package:flutter/material.dart";
import "package:maze_generator/classes/maze.dart";
import "package:maze_generator/classes/maze_generator.dart";
import "package:maze_generator/widgets/maze_painter.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double mazeSize = 20;
  late Maze maze;
  late MazeGenerator generator;
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
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Generation Duration:",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  (mazeGenerationTime.inMicroseconds / 1000000).toString() +
                      's',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                )),
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
            Container(
              child: const Text(
                'Select the size of maze',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Text(
                mazeSize.round().toString(),
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Slider(
              divisions: 9,
              min: 10.0,
              max: 100.0,
              value: mazeSize,
              activeColor: Colors.black,
              inactiveColor: Colors.black.withOpacity(0.25),
              label: '${mazeSize.round()}',
              onChanged: (value) {
                setState(() {
                  mazeSize = value;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black)),
                onPressed: () {
                  setState(() {
                    previousMazeSize = mazeSize.round();
                    maze = Maze(mazeSize.round(), mazeSize.round());
                    generator = MazeGenerator(maze);
                    mazeGenerationTime = generator.generateMaze();

                    // for (int i = 0; i < generator.maze.rows; i++) {
                    //   for (int j = 0; j < generator.maze.columns; j++) {
                    //     print('Cell at ' +
                    //         i.toString() +
                    //         ',' +
                    //         j.toString() +
                    //         "\nVisited: " +
                    //         generator.maze.grid[i][j].visitedBefore.toString() +
                    //         '\n' +
                    //         'TopWall: ' +
                    //         generator.maze.grid[i][j].topWall.toString() +
                    //         '\n' +
                    //         'BottomWall: ' +
                    //         generator.maze.grid[i][j].bottomWall.toString() +
                    //         '\n' +
                    //         'LeftWall: ' +
                    //         generator.maze.grid[i][j].leftWall.toString() +
                    //         '\n' +
                    //         'RightWall: ' +
                    //         generator.maze.grid[i][j].rightWall.toString());
                    //   }
                    // }
                    finishedDrawing = true;
                  });
                },
                child: const Text(
                  "Generate",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ));
  }
}
