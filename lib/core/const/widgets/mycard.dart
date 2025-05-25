import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'card': cardData,
      }, SetOptions(merge: true)); // دمج البيانات دون حذف بيانات أخرى
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم حفظ البطاقة بنجاح')),
      );
      Navigator.pop(context); // الرجوع للصفحة السابقة بعد الحفظ
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
          GestureDetector(
            onTap: () {
              setState(() {
                showForm = !showForm;
              });
            },
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
          ),
          if (showForm)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreditCardForm(
                formKey: _formKey,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: onCreditCardModelChange,
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
            ),
          ElevatedButton(
            child: const Text("ADD CARD"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                saveCardToFirestore(); // ✅ الحفظ في Firestore
              }
            },
          ),
        ],
      ),
    );
  }
}
