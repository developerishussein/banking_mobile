import 'mycard_imports.dart';

class Myformcard extends StatefulWidget {
  const Myformcard({
    super.key,
    required this.formKey,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.onCreditCardModelChange,
  });

  final GlobalKey<FormState> formKey;
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(CreditCardModel) onCreditCardModelChange;

  @override
  State<Myformcard> createState() => _MyformcardState();
}

class _MyformcardState extends State<Myformcard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CreditCardForm(
        formKey: widget.formKey,
        cardNumber: widget.cardNumber,
        expiryDate: widget.expiryDate,
        cardHolderName: widget.cardHolderName,
        cvvCode: widget.cvvCode,
        onCreditCardModelChange: widget.onCreditCardModelChange,
        isCardHolderNameUpperCase: true,
        obscureCvv: false,
        inputConfiguration: InputConfiguration(
          cardNumberDecoration: const InputDecoration(
            labelText: 'Card Number',
            hintText: 'XXXX XXXX XXXX XXXX',
            border: OutlineInputBorder(),
          ),
          expiryDateDecoration: const InputDecoration(
            labelText: 'Expiry Date',
            hintText: 'MM/YY',
            border: OutlineInputBorder(),
          ),
          cvvCodeDecoration: const InputDecoration(
            labelText: 'CVV',
            hintText: 'XXX',
            border: OutlineInputBorder(),
          ),
          cardHolderDecoration: const InputDecoration(
            labelText: 'Card Holder',
            hintText: 'Your Name',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

