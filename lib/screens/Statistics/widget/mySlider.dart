import 'package:flutter/material.dart';

class Myslider extends StatefulWidget {
  const Myslider({super.key});

  @override
  State<Myslider> createState() => _MysliderState();
}

class _MysliderState extends State<Myslider> {
  double value = 4600;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1E1E2D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount: \$${value.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Slider(
            value: value,
            min: 0,
            max: 10000,
            divisions: 100,
            activeColor: const Color(0xff0066FF),
            inactiveColor: Colors.white30,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '\$0',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                '\$4,600',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                '\$10,000',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
