import "package:flutter/material.dart";
import "package:maze_generator/widgets/algorithm_drop_down.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _value = 20;

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
              decoration: BoxDecoration(color: Colors.black),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                '30x30',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              margin: EdgeInsets.only(bottom: 35, left: 25, right: 25),
            ),
            Container(
              child: Text(
                'Select the size of maze',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Slider(
              divisions: 4,
              min: 10.0,
              max: 50.0,
              value: _value,
              activeColor: Colors.black,
              inactiveColor: Colors.black.withOpacity(0.25),
              label: '${_value.round()}',
              onChanged: (value) {
                setState(() {
                  _value = value;
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
                onPressed: () {},
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
