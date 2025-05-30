import 'package:banking_mobile/core/App/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1E1E2D),
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.termsAndConditionPage);
        },
        trailing: Icon(
          Icons.arrow_circle_right_outlined,
          color: Colors.white,
          size: 25,
        ),
        leading: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
