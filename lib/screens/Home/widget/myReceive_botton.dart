import 'package:flutter/material.dart';

class MyreceiveBotton extends StatelessWidget {
  const MyreceiveBotton({super.key});

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
            icon: Icon(Icons.arrow_downward),
          ),
        ),
        Text('Receive', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
