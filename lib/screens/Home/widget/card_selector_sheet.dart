import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardSelector extends StatelessWidget {
  final List<Map<String, String>> cards;
  final void Function(int index) onSelect;

   const CardSelector({super.key, 
    required this.cards,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(cards.length, (index) {
            final card = cards[index];
            return GestureDetector(
              onTap: () => onSelect(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CreditCardWidget(
                  backgroundImage: 'assets/Onboarding/worldmap.png',
                  cardNumber: card['number']!,
                  expiryDate: card['date']!,
                  cardHolderName: card['name']!,
                  cvvCode: card['cvv']!,
                  showBackView: false,
                  isSwipeGestureEnabled: false,
                  onCreditCardWidgetChange: (_) {},
                  cardBgColor: const Color.fromARGB(68, 0, 0, 0),
                  obscureCardNumber: false,
                  obscureCardCvv: false,
                  isHolderNameVisible: true,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}