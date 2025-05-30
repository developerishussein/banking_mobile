import 'mycard_imports.dart';

class MyCardView extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;
  final VoidCallback onTap;

  const MyCardView({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CreditCardWidget(
        backgroundImage: 'assets/Onboarding/worldmap.png',
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused,
        onCreditCardWidgetChange: (v) {},
        cardBgColor: const Color.fromARGB(68, 0, 0, 0),
        obscureCardNumber: false,
        obscureCardCvv: false,
        isHolderNameVisible: true,
      ),
    );
  }
}
