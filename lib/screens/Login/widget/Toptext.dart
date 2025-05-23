import 'package:flutter/material.dart';

class Toptext extends StatelessWidget {
  const Toptext({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    );
  }
}
