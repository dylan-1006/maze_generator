import 'package:flutter/material.dart';

class DurationInfo extends StatelessWidget {
  final Duration mazeGenerationTime;

  const DurationInfo({required this.mazeGenerationTime});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 50),
        child: const Text(
          "Generation Duration:",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Text(
            '${mazeGenerationTime.inMicroseconds / 1000000}s',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ))
    ]);
  }
}
