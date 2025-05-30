import 'imports.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool showForm = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Map<String, String>> cards = [];

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    loadCards();
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

  Future<void> loadCards() async {
    if (user == null) return;
    final doc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
    if (doc.exists) {
      final data = doc.data();
      if (data != null && data['cards'] != null) {
        final List<dynamic> cardList = data['cards'];
        setState(() {
          cards = List<Map<String, String>>.from(
            cardList.map((e) => Map<String, String>.from(e)),
          );
        });
      }
    }
  }

  Future<void> saveCardToFirestore() async {
    if (user == null) return;

    final newCard = {
      'number': cardNumber,
      'name': cardHolderName,
      'date': expiryDate,
      'cvv': cvvCode,
    };

    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid);
      final snapshot = await docRef.get();

      List<dynamic> updatedCards = [];
      if (snapshot.exists &&
          snapshot.data() != null &&
          snapshot.data()!.containsKey('cards')) {
        updatedCards = List.from(snapshot['cards']);
      }

      updatedCards.add(newCard);
      await docRef.set({'cards': updatedCards}, SetOptions(merge: true));

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تم حفظ البطاقة بنجاح')));

      setState(() {
        showForm = false;
        cardNumber = '';
        expiryDate = '';
        cardHolderName = '';
        cvvCode = '';
      });

      loadCards();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('حدث خطأ أثناء الحفظ: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0C1D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Cards', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.add_card, color: Colors.white),
            onPressed: () {
              setState(() {
                showForm = !showForm;
              });
            },
          ),
        ],
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var card in cards)
              CreditCardWidget(
                cardNumber: card['number'] ?? '',
                expiryDate: card['date'] ?? '',
                cardHolderName: card['name'] ?? '',
                cvvCode: card['cvv'] ?? '',
                showBackView: false,
                onCreditCardWidgetChange: (_) {},
                cardBgColor: const Color(0xFF1E1E2D),
                backgroundImage: 'assets/Onboarding/worldmap.png',
              ),
            if (showForm) ...[
              CreditCardForm(
                formKey: formKey,
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
                    prefixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(),
                  ),
                  expiryDateDecoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(),
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    labelText: 'CVV',
                    hintText: 'XXX',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  cardHolderDecoration: const InputDecoration(
                    labelText: 'Cardholder Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0066FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    saveCardToFirestore();
                  }
                },
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'Save Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
