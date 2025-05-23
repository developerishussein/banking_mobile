import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return             Card(
              color: Color(0xff1E1E2D),
              child: ListTile(
                trailing: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                leading: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            );
  }
}