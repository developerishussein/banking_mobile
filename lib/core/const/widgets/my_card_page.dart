import 'mycard_imports.dart';

class Mycard extends StatefulWidget {
  final bool showFormInitially;
  const Mycard({super.key, this.showFormInitially = false});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  late String cardNumber = '';
  late String expiryDate = '';
  late String cardHolderName = '';
  late String cvvCode = '';
  bool isCvvFocused = false;
  late bool showForm;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    showForm = widget.showFormInitially;
  }

  void onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  Future<void> saveCardToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('المستخدم غير مسجل الدخول')),
      );
      return;
    }

    final cardData = {
      'number': cardNumber,
      'name': cardHolderName,
      'date': expiryDate,
      'cvv': cvvCode,
    };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({'card': cardData}, SetOptions(merge: true));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البطاقة بنجاح')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في الحفظ: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyCardView(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            isCvvFocused: isCvvFocused,
            onTap: () => setState(() => showForm = !showForm),
          ),
          if (showForm)
            Myformcard(
              onCreditCardModelChange: onCreditCardModelChange,
              cardHolderName: cardHolderName,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              expiryDate: expiryDate,
              formKey: _formKey,
            ),
          MyCardButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                saveCardToFirestore();
              }
            },
          ),
        ],
      ),
    );
  }
}
