import 'package:flutter/material.dart';

class MytopupBotton extends StatelessWidget {
  const MytopupBotton({super.key});

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
            icon: Icon(Icons.keyboard_double_arrow_up_sharp),
          ),
        ),
        Text('Topup', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
