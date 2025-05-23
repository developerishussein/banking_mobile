import 'package:banking_mobile/core/const/widgets/stock_list.dart';
import 'package:flutter/material.dart';

import 'widget/myappbar.dart';
import '../../core/const/widgets/mycard.dart';
import 'widget/myrow_botton.dart';
import 'widget/mytext_botton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161622),
      appBar: Myappbar(),
      body: Column(children: [Mycard(), MyrowBotton(), MytextBotton(),StockList()]),
      
    );
  }
}
