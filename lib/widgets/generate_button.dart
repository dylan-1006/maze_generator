import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool finishedDrawing;
  const GenerateButton(
      {required this.onPressed, required this.finishedDrawing});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style:
            ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.black)),
        onPressed: onPressed,
        child: const Text(
          "Generate",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}
