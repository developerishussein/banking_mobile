import 'imports.dart';

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
                      _buildTextField(
                        Icons.person,
                        "Full Name",
                        controller.fullnameController,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        Icons.email,
                        "Email Address",
                        controller.emailController,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        Icons.phone,
                        "Phone Number",
                        controller.phoneController,
                      ),
                      const SizedBox(height: 16),
                      _buildBirthDateRow(context),
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

  Widget _buildTextField(
    IconData icon,
    String label,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xff1E1E2E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildBirthDateRow(BuildContext context) {
    final day = controller.birthdate.value.day;
    final month = controller.monthName;
    final year = controller.birthdate.value.year;

    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: controller.birthdate.value,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                primaryColor: Colors.blueAccent,
                colorScheme: const ColorScheme.dark(primary: Colors.blueAccent),
                dialogBackgroundColor: const Color(0xff1E1E2E),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          controller.birthdate.value = pickedDate;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _dateBox(day.toString()),
          _dateBox(month),
          _dateBox(year.toString()),
        ],
      ),
    );
  }

  Widget _dateBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff1E1E2E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
