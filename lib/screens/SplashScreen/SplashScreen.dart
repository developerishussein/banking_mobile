import'imports.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAllNamed(AppRoutes.mynv);
      } else {
        Get.offAllNamed(AppRoutes.onboarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Image.asset('assets/Onboarding/Group61.png'),
      ),
    );
  }
}
