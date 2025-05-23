import 'package:flutter/material.dart';
import '../../core/const/widgets/mycard.dart';
import '../../core/const/widgets/stock_list.dart';
import 'widget/mySlider.dart';
import 'widget/mytext.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161622),
      appBar: AppBar(
        backgroundColor: const Color(0xff161622),
        centerTitle: true,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1E1E2D),
                borderRadius: BorderRadius.circular(400),
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.add, size: 30),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [const Mycard(), StockList(), Mytext(), Myslider()],
        ),
      ),
    );
  }
}
