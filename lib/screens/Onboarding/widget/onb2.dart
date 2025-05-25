import 'package:flutter/material.dart';

class Onb2 extends StatelessWidget {
  const Onb2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/Onboarding/Group3.png'),

        Text(
          'The most Secoure\n Platfrom for Customer',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800,color: Colors.white),
        ),
        Text(
          'Built-in Fingerprint, face recognition\n and more, keeping you completely safe',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.white),
        ),
      ],
    );
  }
}
