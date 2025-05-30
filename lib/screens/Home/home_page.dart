
import 'imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> cards = [];
  int selectedCardIndex = 0;
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

      final data = doc.data();

      // البطاقة الأساسية
      if (data?['card'] != null) {
        final card = data!['card'];
        cards.add({
          'number': card['number'] ?? '',
          'date': card['date'] ?? '',
          'name': card['name'] ?? '',
          'cvv': card['cvv'] ?? '',
        });
      }

      // البطاقات الإضافية
      if (data?['cards'] != null && data!['cards'] is List) {
        final List<dynamic> additionalCards = data['cards'];
        for (var card in additionalCards) {
          cards.add({
            'number': card['number'] ?? '',
            'date': card['date'] ?? '',
            'name': card['name'] ?? '',
            'cvv': card['cvv'] ?? '',
          });
        }
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  void showCardSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Mycolors.backgroundColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // يجعل الارتفاع حسب المحتوى
              children: List.generate(cards.length, (index) {
                final card = cards[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCardIndex = index;
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: CreditCardWidget(
                      backgroundImage: 'assets/Onboarding/worldmap.png',
                      cardNumber: card['number']!,
                      expiryDate: card['date']!,
                      cardHolderName: card['name']!,
                      cvvCode: card['cvv']!,
                      showBackView: false, // لا تقلب البطاقة
                      isSwipeGestureEnabled: false, // إيقاف السحب لقلب البطاقة
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCard = cards.isNotEmpty ? cards[selectedCardIndex] : null;

    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: Myappbar(),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    isLoading = true;
                    cards.clear();
                    selectedCardIndex = 0;
                  });
                  await fetchCardData();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child:
                                selectedCard != null
                                    ? CreditCardWidget(
                                      backgroundImage:
                                          'assets/Onboarding/worldmap.png',
                                      cardNumber: selectedCard['number']!,
                                      expiryDate: selectedCard['date']!,
                                      cardHolderName: selectedCard['name']!,
                                      cvvCode: selectedCard['cvv']!,
                                      showBackView: false,
                                      onCreditCardWidgetChange: (_) {},
                                      cardBgColor: const Color.fromARGB(
                                        68,
                                        0,
                                        0,
                                        0,
                                      ),
                                      obscureCardNumber: false,
                                      obscureCardCvv: false,
                                      isHolderNameVisible: true,
                                    )
                                    : CreditCardWidget(
                                      backgroundImage:
                                          'assets/Onboarding/worldmap.png',
                                      cardNumber: '0000 0000 0000 0000',
                                      expiryDate: '00/00',
                                      cardHolderName: 'Demo User',
                                      cvvCode: '000',
                                      showBackView: false,
                                      onCreditCardWidgetChange: (_) {},
                                      cardBgColor: Colors.grey.shade800,
                                      obscureCardNumber: false,
                                      obscureCardCvv: false,
                                      isHolderNameVisible: true,
                                    ),
                          ),
                          Positioned(
                            top: 0,
                            right: 12,
                            child: IconButton(
                              icon: const Icon(
                                Icons.swap_horiz,
                                color: Colors.white,
                              ),
                              onPressed: showCardSelector,
                              tooltip: 'تبديل البطاقة',
                            ),
                          ),
                        ],
                      ),
                      MyrowBotton(),
                      MytextBotton(),
                      StockList(),
                    ],
                  ),
                ),
              ),
    );
  }
}
