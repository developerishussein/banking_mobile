import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/App/AppRoutes.dart';

class Mybotton extends StatelessWidget {
  const Mybotton({
    super.key,
    required,
    required this.index,
    required this.controller,
  });
  final PageController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    final hscreens = MediaQuery.of(context).size.height;
    final wscreens = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // ← هنا تتحكم في الزوايا
          ),
          maximumSize: Size(wscreens * 0.700, hscreens * 0.050),
          minimumSize: Size(wscreens * 0.7, hscreens * 0.050),
          backgroundColor: Color(0xff0066FF),
        ),

        onPressed: () {
          if (index < 2) {
            controller.animateToPage(
              index + 1,
              duration: Duration(milliseconds: 250),
              curve: Curves.linear,
            );
          } else {
            Get.toNamed(AppRoutes.login);
          }
        },
        child: Text(
          index < 2 ? 'Next' : 'Get Started',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
