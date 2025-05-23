import 'package:flutter/material.dart';

class Onb3 extends StatelessWidget {
  const Onb3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/Onboarding/Group4.png'),

        Text(
          'Paying for Everything is\n Easy and Convenient',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        Text(
          'Built-in Fingerprint, face recognition\n and more, keeping you completely safe',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
