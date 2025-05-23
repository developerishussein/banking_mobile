import 'package:flutter/material.dart';

class Mytext3 extends StatelessWidget {
  const Mytext3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Choose what data you share with us',
          style: TextStyle(color: Color(0xff7E848D)),
        ),
      ),
    );
  }
}
