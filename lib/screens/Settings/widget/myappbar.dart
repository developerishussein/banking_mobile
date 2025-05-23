import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget implements PreferredSizeWidget {
  const MyWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff161622),
      centerTitle: true,
      title: Text(
        'Settings',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1E1E2D),
              borderRadius: BorderRadius.circular(400),
            ),
            child: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ),
        ),
      ],
    );
  }
}
