import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

 class SelectedCardView extends StatelessWidget {
   final Map<String, String>? selectedCard;
   final VoidCallback onSwap;

    const SelectedCardView({super.key, 
    required this.selectedCard,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CreditCardWidget(
            backgroundImage: 'assets/Onboarding/worldmap.png',
            cardNumber: selectedCard?['number'] ?? '0000 0000 0000 0000',
            expiryDate: selectedCard?['date'] ?? '00/00',
            cardHolderName: selectedCard?['name'] ?? 'Demo User',
            cvvCode: selectedCard?['cvv'] ?? '000',
            showBackView: false,
            onCreditCardWidgetChange: (_) {},
            cardBgColor: selectedCard != null
                ? const Color.fromARGB(68, 0, 0, 0)
                : Colors.grey.shade800,
            obscureCardNumber: false,
            obscureCardCvv: false,
            isHolderNameVisible: true,
          ),
        ),
        Positioned(
          top: 0,
          right: 12,
          child: IconButton(
            icon: const Icon(Icons.swap_horiz, color: Colors.white),
            onPressed: onSwap,
            tooltip: 'تبديل البطاقة',
          ),
        ),
      ],
    );
  }
}