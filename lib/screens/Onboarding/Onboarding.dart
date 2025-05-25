import 'package:banking_mobile/screens/Onboarding/widget/onb2.dart';
import 'package:flutter/material.dart';
import 'widget/indecetor.dart';
import 'widget/mybotton.dart';
import 'widget/onb1.dart';
import 'widget/onb3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161622),

      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (Value) {
                setState(() {
                  index = Value;
                });
              },
              controller: _controller,
              children: [Onb1(), Onb2(), Onb3()],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customindecetor(acteiv: index == 0),
              SizedBox(width: 5),
              customindecetor(acteiv: index == 1),
              SizedBox(width: 5),
              customindecetor(acteiv: index == 2),
            ],
          ),
          Mybotton(index: index, controller: _controller),
        ],
      ),
    );
  }
}
