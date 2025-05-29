import 'package:flutter/material.dart';

import 'widget/Change_Password.dart';
import 'widget/Contact_Us.dart';
import 'widget/MyLanguage.dart';
import 'widget/My_Profile.dart';
import 'widget/Privacy_Policy.dart';
import 'widget/myappbar.dart';
import 'widget/mytext1.dart';
import 'widget/mytext2.dart';
import 'widget/mytext3.dart';

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
      backgroundColor: Color(0xff161622),
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
