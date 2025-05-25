import 'package:flutter/material.dart';

class FromPhone extends StatelessWidget {
  const FromPhone({super.key, required this.phonenumberController});

  final TextEditingController phonenumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.numberWithOptions(),
      controller: phonenumberController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Phone Number';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.local_phone_outlined),
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: Colors.blueGrey),
      ),
    );
  }
}
