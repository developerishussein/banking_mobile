import 'package:flutter/material.dart';
import 'myReceive_botton.dart';
import 'myTopup_botton.dart';
import 'myloan_bottom.dart';
import 'sendbotton.dart';

class MyrowBotton extends StatelessWidget {
  const MyrowBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Sendbotton(),
        SizedBox(width: 10),
        MyreceiveBotton(),
        SizedBox(width: 10),
        MyloanBottom(),
        SizedBox(width: 10),
        MytopupBotton(),
      ],
    );
  }
}
