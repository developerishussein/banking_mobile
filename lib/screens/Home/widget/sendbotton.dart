import 'package:flutter/material.dart';


//import '../../Send Money/SendMoneyPage.dart';

class Sendbotton extends StatelessWidget {
  const Sendbotton({super.key});

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
            onPressed: () {
             // Get.to(SendMoneyPage());
            },
            icon: Icon(Icons.arrow_upward),
          ),
        ),
        Text('Send', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
