import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/change_password_controller.dart';

class ChangePasswordPage extends StatelessWidget {
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141421),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141421),
        elevation: 0,
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),
            _buildTextField(
              label: 'Current Password',
              controller: controller.currentPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(
              () => _buildTextField(
                label: 'New Password',
                controller: controller.newPasswordController,
                obscureText: controller.isObscureNew.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isObscureNew.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    controller.isObscureNew.value =
                        !controller.isObscureNew.value;
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Confirm New Password',
              controller: controller.confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Both Passwords Must Match',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0066FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: controller.changePassword,
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
