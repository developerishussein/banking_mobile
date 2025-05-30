import 'package:banking_mobile/core/App/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('I’m a new user.', style: TextStyle(color: Colors.white)),
        TextButton(
          onPressed: () {
            Get.toNamed(AppRoutes.register);
          },
          child: const Text(
            'Register',
            style: TextStyle(color: Color(0xff0066FF)),
          ),
        ),
      ],
    );
  }
}
