import 'package:banking_mobile/core/App/AppRoutes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestMoneyController extends GetxController {
  final payerNameController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final amountController = TextEditingController();

  final currency = 'USD'.obs;

  Future<void> sendMoneyRequest() async {
    final data = {
      'payerName': payerNameController.text,
      'email': emailController.text,
      'description': descriptionController.text,
      'dueDate':
          '${dayController.text}-${monthController.text}-${yearController.text}',
      'amount': amountController.text,
      'currency': currency.value,
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      await FirebaseFirestore.instance.collection('money_requests').add(data);
      Get.snackbar('Success', 'Money request sent successfully');
      Get.offAllNamed(AppRoutes.mynv);
    } catch (e) {
      Get.snackbar('Error', 'Failed to send money request: $e');
    }
  }

  @override
  void onClose() {
    payerNameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    amountController.dispose();

    super.onClose();
  }
}
