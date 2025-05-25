import 'package:banking_mobile/core/App/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../Edit Profile/edit_profile_page.dart';
import 'controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161622),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.person_outline),
          ),
          SizedBox(width: 16),
        ],
        elevation: 0,
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
        onRefresh: () async {
          await controller.fetchUserData();
        },
        child: Obx(() {
          final imageBase64 = controller.imageBase64.value;

          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[800],
                  backgroundImage:
                      imageBase64.isNotEmpty
                          ? MemoryImage(base64Decode(imageBase64))
                          : AssetImage('assets/user.jpg') as ImageProvider,
                ),
                SizedBox(height: 10),
                Text(
                  controller.fullName.value,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text('Senior Designer', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),

                /// Card 1: Personal & Payment
                _buildSectionCard([
                  _buildListTile(
                    Icons.person_outline,
                    "Personal Information",
                    () {
                      final uid = FirebaseAuth.instance.currentUser?.uid;
                      if (uid != null && uid.isNotEmpty) {
                        Get.to(() => EditProfileView(userId: uid));
                      } else {
                        Get.snackbar("خطأ", "لا يوجد مستخدم مسجل الدخول");
                      }
                    },
                  ),

                  _buildListTile(
                    Icons.credit_card,
                    "Payment Preferences",
                    () {},
                  ),
                  _buildListTile(
                    Icons.account_balance_wallet_outlined,
                    "Banks and Cards",
                    () {
                      Get.toNamed(AppRoutes.addNewCardPage);
                    },
                  ),
                ]),

                SizedBox(height: 12),

                /// Card 2: Notifications & Messages
                _buildSectionCard([
                  _buildListTileWithBadge(
                    Icons.notifications_none,
                    "Notifications",
                    2,
                    () {},
                  ),
                  _buildListTile(
                    Icons.message_outlined,
                    "Message Center",
                    () {},
                  ),
                ]),

                SizedBox(height: 12),

                /// Card 3: Address & Settings
                _buildSectionCard([
                  _buildListTile(Icons.location_on_outlined, "Address", () {}),
                  _buildListTile(Icons.settings_outlined, "Settings", () {}),
                ]),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> tiles) {
    return Card(
      color: Color(0xFF1E1E2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: tiles),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildListTileWithBadge(
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
}
