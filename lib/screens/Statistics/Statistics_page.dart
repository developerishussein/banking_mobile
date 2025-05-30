import'imports.dart';
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
      backgroundColor: Mycolors.backgroundColor,
      appBar:MyAppbar(),
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
