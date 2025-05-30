import 'dart:convert';
import 'package:banking_mobile/core/const/colors/mycolors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myappbar extends StatelessWidget implements PreferredSizeWidget {
  const Myappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<Map<String, dynamic>?> _getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Mycolors.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final hasError = snapshot.hasError;
          final userData = snapshot.data;

          String fullName = 'User';
          ImageProvider imageProvider = const AssetImage('assets/Onboarding/photo.jpg');

          if (userData != null) {
            fullName = userData['fullname'] ?? 'User';

            final imageString = userData['image'];
            if (imageString != null && imageString.toString().isNotEmpty) {
              try {
                imageProvider = MemoryImage(base64Decode(imageString));
              } catch (_) {
                // احتياطي في حال وجود بيانات خاطئة
              }
            }
          }

          return Row(
            children: [
              isLoading
                  ? const CircleAvatar(radius: 20, backgroundColor: Colors.grey)
                  : CircleAvatar(radius: 20, backgroundImage: imageProvider),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  if (isLoading)
                    const Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  else if (hasError)
                    const Text(
                      'Error',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    )
                  else
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff1E1E2D),
            borderRadius: BorderRadius.circular(400),
          ),
          child: IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
