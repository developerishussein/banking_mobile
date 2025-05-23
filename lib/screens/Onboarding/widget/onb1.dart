import 'package:flutter/material.dart';

class Onb1 extends StatelessWidget {
  const Onb1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/Onboarding/Group1.png'),
        Text(
          'Fastest Payment in\n the world',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        Text(
          'Integrate multiple payment methoods\nto help you up the process quickly',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
