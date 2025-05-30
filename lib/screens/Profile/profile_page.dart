import 'proimports.dart';
class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: MyAppbar(),
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
                buildSectionCard([
                  buildListTile(
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
                  buildListTile(
                    Icons.credit_card,
                    "Payment Preferences",
                    () {},
                  ),
                  buildListTile(
                    Icons.account_balance_wallet_outlined,
                    "Banks and Cards",
                    () {
                      Get.toNamed(AppRoutes.addNewCardPage);
                    },
                  ),
                ]),
                SizedBox(height: 12),
                /// Card 2: Notifications & Messages
                buildSectionCard([
                  buildListTileWithBadge(
                    Icons.notifications_none,
                    "Notifications",
                    2,
                    () {},
                  ),
                  buildListTile(
                    Icons.message_outlined,
                    "Message Center",
                    () {},
                  ),
                ]),
                SizedBox(height: 12),
                /// Card 3: Address & Settings
                buildSectionCard([
                  buildListTile(Icons.location_on_outlined, "Address", () {}),
                  buildListTile(Icons.settings_outlined, "Settings", () {}),
                ]),
              ],
            ),
          );
        }),
      ),
    );
  }
}
