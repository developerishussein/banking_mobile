import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../Change_Password/Change_Password.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1E1E2D),
      child: ListTile(
        onTap: () {
          Get.to(ChangePasswordPage());
        },
        trailing: Icon(
          Icons.arrow_circle_right_outlined,
          color: Colors.white,
          size: 25,
        ),
        leading: Text(
          'Change Password',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
