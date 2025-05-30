import '../proimports.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text('Profile', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: IconButton(
        color: Colors.white,
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: Icon(Icons.person_outline),
        ),
        SizedBox(width: 16),
      ],
      elevation: 0,
    );
  }
}
