import 'eimports.dart';

class EditProfileView extends StatelessWidget {
  final controller = Get.put(EditProfileController());

  final String userId;

  EditProfileView({super.key, required this.userId}) {
    controller.loadUserData(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: Obx(
        () =>
            controller.fullname.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: controller.pickImage,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.grey.shade800,
                          backgroundImage:
                              controller.imageBase64.isNotEmpty
                                  ? MemoryImage(
                                        base64Decode(
                                          controller.imageBase64.value,
                                        ),
                                      )
                                      as ImageProvider
                                  : const AssetImage('assets/profile.png'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.fullname.value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Senior Designer",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        Icons.person,
                        "Full Name",
                        controller.fullnameController,
                      ),
                      const SizedBox(height: 16),
                      buildTextField(
                        Icons.email,
                        "Email Address",
                        controller.emailController,
                      ),
                      const SizedBox(height: 16),
                      buildTextField(
                        Icons.phone,
                        "Phone Number",
                        controller.phoneController,
                      ),
                      const SizedBox(height: 16),
                      buildBirthDateRow(context ),
                      const SizedBox(height: 20),
                      Text(
                        controller.createdAtText.value,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed:
                            () => controller.updateUserData(userId, context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Color(0xff0066FF),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70,
                            vertical: 14,
                          ),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
