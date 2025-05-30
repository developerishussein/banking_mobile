  import 'package:flutter/material.dart';

Widget buildSectionCard(List<Widget> tiles) {
    return Card(
      color: Color(0xFF1E1E2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: tiles),
    );
  }

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }