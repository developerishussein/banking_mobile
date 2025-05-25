import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final fullname = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final birthdate = DateTime.now().obs;
  final imageBase64 = ''.obs;
  final createdAtText = ''.obs;

  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String get monthName => _monthName(birthdate.value.month);

  Future<void> loadUserData(String uid) async {
    final doc = await _firestore.collection("users").doc(uid).get();
    final data = doc.data();
    if (data != null) {
      fullname.value = data['fullname'];
      email.value = data['email'];
      phone.value = data['phone'];

      createdAtText.value = _formatDate(data['created_at'].toDate());

      fullnameController.text = fullname.value;
      emailController.text = email.value;
      phoneController.text = phone.value;
    }
  }

  void updateBirthDate(int day, int month, int year) {
    birthdate.value = DateTime(year, month, day);
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      imageBase64.value = base64Encode(bytes);
    }
  }

Future<void> updateUserData(String uid, BuildContext context) async {
  try {
    await _firestore.collection("users").doc(uid).update({
      "fullname": fullnameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "birthdate": birthdate.value.toIso8601String(),
      "image": imageBase64.value,
    });

    Get.snackbar("تم التحديث", "تم حفظ بياناتك بنجاح");

    // الرجوع للصفحة السابقة بعد حفظ البيانات
    Navigator.pop(context);
  } catch (e) {
    Get.snackbar("خطأ", "حدث خطأ أثناء تحديث البيانات");
  }
}


  String _formatDate(DateTime date) {
    return "Joined ${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}
