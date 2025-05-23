import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Card(
              color: Color(0xff1E1E2D),
              child: ListTile(
                trailing: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                leading: Text(
                  'My Profile',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            );
  }
}