import 'package:flutter/material.dart';

class MyloanBottom extends StatelessWidget {
  const MyloanBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xff1E1E2D),
            borderRadius: BorderRadius.circular(400),
          ),
          child: IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.monetization_on_outlined),
          ),
        ),
        Text('Loan', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
