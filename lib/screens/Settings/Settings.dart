import 'simports.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: MyWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Mytext1(),
            const SizedBox(height: 25),
            const MyLanguage(),
            const MyProfile(),
            const ContactUs(),
            const SizedBox(height: 25),
            const Mytext2(),
            const SizedBox(height: 25),
            const ChangePassword(),
            const PrivacyPolicy(),
            const Mytext3(),
            Card(
              color: const Color(
                0xff1E1E2D,
              ), // اجعل اللون هنا، وليس داخل ListTile
              child: ListTile(
                title: const Text(
                  'Enable Notifications',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: const Color(0xff0066FF),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.white24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
