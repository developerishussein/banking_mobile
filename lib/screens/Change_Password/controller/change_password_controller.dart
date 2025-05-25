import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isObscureNew = true.obs;

  Future<void> changePassword() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPasswordController.text,
      );

      await user.reauthenticateWithCredential(cred);
      if (newPasswordController.text == confirmPasswordController.text) {
        await user.updatePassword(newPasswordController.text);
        Get.snackbar('Success', 'Password changed successfully');
      } else {
        Get.snackbar('Error', 'Passwords do not match');
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    }
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
