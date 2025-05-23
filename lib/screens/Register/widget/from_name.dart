import 'package:flutter/material.dart';

class FromName extends StatelessWidget {
  const FromName({super.key, required this.fullnameController});

  final TextEditingController fullnameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fullnameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Full Name';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        labelText: 'Full Name',
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
