import 'himports.dart';

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

      if (data?['card'] != null) {
        final card = data!['card'];
        cards.add({
          'number': card['number'] ?? '',
          'date': card['date'] ?? '',
          'name': card['name'] ?? '',
          'cvv': card['cvv'] ?? '',
        });
      }

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
        return CardSelector(
          cards: cards,
          onSelect: (index) {
            setState(() {
              selectedCardIndex = index;
            });
            Navigator.pop(context);
          },
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
                      SelectedCardView(
                        selectedCard: selectedCard,
                        onSwap: showCardSelector,
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
