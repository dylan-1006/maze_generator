import 'package:flutter/material.dart';

enum AlgorithmLabel { DepthFirst, Kruskal }

class AlgorithmDropDown extends StatefulWidget {
  const AlgorithmDropDown({super.key});

  @override
  State<AlgorithmDropDown> createState() => _AlgorithmDropDownState();
}

class _AlgorithmDropDownState extends State<AlgorithmDropDown> {
  AlgorithmLabel? selectedAlgorithm;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 190,
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        alignment: Alignment.center,
        child: DropdownMenu<AlgorithmLabel>(
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
            label: const Text(
              'Algorithm',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0XFF1E1E1E), fontWeight: FontWeight.w600),
            ),
            width: 190,
            initialSelection: AlgorithmLabel.DepthFirst,
            dropdownMenuEntries: AlgorithmLabel.values
                .map<DropdownMenuEntry<AlgorithmLabel>>(
                    (AlgorithmLabel algorithm) {
              return DropdownMenuEntry<AlgorithmLabel>(
                value: algorithm,
                label: algorithm.toString().split('.').last,
              );
            }).toList()),
      ),
    );
  }
}
