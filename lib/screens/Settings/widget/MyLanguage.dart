import 'package:flutter/material.dart';

class MyLanguage extends StatefulWidget {
  const MyLanguage({super.key});

  @override
  State<MyLanguage> createState() => _MyLanguageState();
}

class _MyLanguageState extends State<MyLanguage> {
  @override
  Widget build(BuildContext context) {
    return Card(
              color: Color(0xff1E1E2D),
              child: ListTile(
                onTap: () {
                  
                },
                trailing: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                leading: Text(
                  'Language',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            );
  }
}