 import 'package:flutter/material.dart';

Widget buildListTileWithBadge(
    IconData icon,
    String title,
    int badgeCount,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badgeCount > 0)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$badgeCount',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }