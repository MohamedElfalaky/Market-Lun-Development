import 'package:flutter/material.dart';

class HorizontalFilterBar extends StatelessWidget {
  const HorizontalFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 40,
      child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: [
            for (var i = 0; i < 6; i++)
              Container(
                // height: 50,
                width: 160.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
          ]),
    );
  }
}
