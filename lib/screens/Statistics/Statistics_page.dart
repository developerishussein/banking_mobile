import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
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
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCardData();
  }

  Future<void> fetchCardData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      final card = doc.data()?['card'];
      if (card != null) {
        setState(() {
          cardNumber = card['number'] ?? '';
          expiryDate = card['date'] ?? '';
          cardHolderName = card['name'] ?? '';
          cvvCode = card['cvv'] ?? '';
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false; // لا يوجد بطاقة محفوظة
        });
      }
    }
  }

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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        maxChildSize: 0.95,
                        minChildSize: 0.4,
                        builder: (context, scrollController) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xff1E1E2D),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            child: const Mycard(
                              showFormInitially: true,
                            ), // ✅ هنا يتم عرض الكارد والفورم
                          );
                        },
                      );
                    },
                  );
                },
                icon: const Icon(Icons.add, size: 30),
              ),
            ),
          ),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (cardNumber.isNotEmpty)
                        CreditCardWidget(
                          backgroundImage: 'assets/Onboarding/worldmap.png',
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: false,
                          onCreditCardWidgetChange: (_) {},
                          cardBgColor: const Color.fromARGB(68, 0, 0, 0),
                          obscureCardNumber: false,
                          obscureCardCvv: false,
                          isHolderNameVisible: true,
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'لم تقم بإضافة بطاقة بعد.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      StockList(),
                      Mytext(),
                      Myslider(),
                    ],
                  ),
                ),
              ),
    );
  }
}
