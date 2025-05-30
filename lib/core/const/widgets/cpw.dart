import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardPreviewPage extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  const CardPreviewPage({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Card')),
      body: Center(
        child: CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: false,
          cardBgColor: Colors.indigo,
          obscureCardNumber: false,
          obscureCardCvv: false,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (v) {},
        ),
      ),
    );
  }
}
