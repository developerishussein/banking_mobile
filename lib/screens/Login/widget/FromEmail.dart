import 'package:flutter/material.dart';

class FromEmail extends StatelessWidget {
  const FromEmail({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,

      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email_rounded),
        labelText: 'Email Address',
        labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
