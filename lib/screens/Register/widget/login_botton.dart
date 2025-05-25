import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class loginBotton extends StatelessWidget {
  const loginBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I’m a new user.', style: TextStyle(color: Colors.white)),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'login',
            style: TextStyle(color: Color(0xff0066FF)),
          ),
        ),
      ],
    );
  }
}
