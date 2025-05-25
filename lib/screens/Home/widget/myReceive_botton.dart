import 'package:banking_mobile/core/App/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';


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
            onPressed: () {
              Get.toNamed(AppRoutes.requestMoneyPage);
            },
            icon: Icon(Icons.arrow_downward),
          ),
        ),
        Text('Receive', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
