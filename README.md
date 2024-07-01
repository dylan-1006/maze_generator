# Maze Generator

  This is a simple Android mobile application developed using Flutter that generates random perfect mazes.

## Getting started
1. Clone this repository on your local device.
2. Open the cloned repository folder on your preferred IDE (*VS Code Recommended*).
3.  Connect & select either a physical/virtual android device on VS Code (*Virtual Google Pixel 6 used during development*).
4. Run application by typing "*flutter run*" in terminal
5.  Start using application and exploring its features.
### How I usually run it
1. Clone this repository on local device.
2. Open cloned repository folder on VS Code.
3. Create a virtual device on Android Studio (*Google Pixel 6 with API 35*).
4. Make sure newly created virtual device is selected on VS Code.
5. *VS Code --> Run --> Run Without Debugging* or "*CTRL + F5*" on Windows.
6. Start using application.
 
## Features
- Generates random perfect mazes of varying sizes
- Display generation time for each maze
- Interactive slider to select size of maze

## The Algorithm
The maze generation algorithm chosen for this application is the *Recursive Backtracking* algorithm. This algorithm creates pefect mazes by visiting cells and backtracking when necessary to ensure every cell has been visted and connected.

### Steps
1. Choose a starting point in maze.
2. Randomly choose a wall at that point and carve a passage through to the adjacent cell if the adjacent has not been visited yet. This becomes the new current cell.
3. If all adjacent cells have been visited, back up to the last that has uncarved walls and repeat the process.
4. The algorithm ends when the process has backed all the way up to the starting point.




