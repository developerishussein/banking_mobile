import 'imports.dart';
class Mynv extends StatelessWidget {
  const Mynv({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    final List<Widget> pages = const [
      HomePage(),
      Mycards(),
      Statistics(),
      Settings(),
    ];

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color(0xff0066FF),
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff27273A),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'My Card'),
              BottomNavigationBarItem(icon: Icon(Icons.stream_outlined), label: 'Statistics'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_suggest_outlined), label: 'Settings'),
            ],
          ),
        ));
  }
}
