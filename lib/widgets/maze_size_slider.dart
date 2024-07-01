import 'package:flutter/material.dart';

class MazeSizeSlider extends StatelessWidget {
  final double mazeSize;
  final ValueChanged<double> onChanged;
  const MazeSizeSlider({required this.mazeSize, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Text(
            'Select the size of maze',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          child: Text(
            mazeSize.round().toString(),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}
