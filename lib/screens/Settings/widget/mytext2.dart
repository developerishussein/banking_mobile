import 'package:flutter/material.dart';

class Mytext2 extends StatelessWidget {
  const Mytext2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Security',
                style: TextStyle(
                  color: const Color.fromARGB(255, 163, 163, 163),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
  }
}