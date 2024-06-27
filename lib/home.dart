import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maze Generator',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
        ),
        centerTitle: true,
      ),
    );
  }
}
