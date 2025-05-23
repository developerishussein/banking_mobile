import 'package:flutter/material.dart';

class FromPas extends StatelessWidget {
  const FromPas({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.remove_red_eye),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}