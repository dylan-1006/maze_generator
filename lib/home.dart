import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:maze_generator/classes/maze.dart";
import "package:maze_generator/classes/maze_generator.dart";
import "package:maze_generator/widgets/algorithm_drop_down.dart";
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
  int previousMazeSize = 20;
  bool finishedDrawing = false;

  void initState() {
    // maze = Maze(10, 10);
    // generator = MazeGenerator(maze);
    // generator.generateMaze();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Maze Generator',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 32, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AlgorithmDropDown(),
            Container(
              height: 360,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(color: Colors.transparent),
              child: finishedDrawing
                  ? MazeWidget(generator.maze)
                  : Text(
                      'loading',
                      style: TextStyle(color: Colors.amber),
                    ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                previousMazeSize.toString() + 'x' + previousMazeSize.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: finishedDrawing ? Colors.black : Colors.transparent),
              ),
              margin: EdgeInsets.only(bottom: 35, left: 25, right: 25),
            ),
            Container(
              child: Text(
                'Select the size of maze',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              child: Text(
                mazeSize.round().toString(),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
              margin: EdgeInsets.only(top: 25),
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: Offset(0, 4))
                  ]),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black)),
                onPressed: () {
                  setState(() {
                    previousMazeSize = mazeSize.round();
                    maze = Maze(mazeSize.round(), mazeSize.round());
                    //maze = Maze(100, 100);
                    generator = MazeGenerator(maze);
                    generator.generateMaze();

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
                child: Text(
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
