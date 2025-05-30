import 'imports.dart';

class Mycards extends StatefulWidget {
  const Mycards({super.key});

  @override
  State<Mycards> createState() => _MycardsState();
}

class _MycardsState extends State<Mycards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Mycolors.backgroundColor,
        centerTitle: true,
        title: Text(
          'My Cards',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1E1E2D),
                borderRadius: BorderRadius.circular(400),
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Image.asset('assets/Onboarding/Graph.png'),
              TextSBotton(),
              StockList(),
            ],
          ),
        ),
      ),
    );
  }
}
