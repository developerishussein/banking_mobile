import 'package:flutter/material.dart';

class Customindecetor extends StatelessWidget {
  final bool acteiv;

  const Customindecetor({super.key, required this.acteiv});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: acteiv ? Colors.blueAccent : Colors.blueGrey,
      ),
      width: acteiv ? 30 : 10,
      height: 10,
    );
  }
}
