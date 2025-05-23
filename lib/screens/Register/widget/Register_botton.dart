import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/App/AppRoutes.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.fullnameController,
    required this.phonenumberController,
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
  });

  final TextEditingController fullnameController;
  final TextEditingController phonenumberController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    final hscreens = MediaQuery.of(context).size.height;
    final wscreens = MediaQuery.of(context).size.width;

    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          maximumSize: Size(wscreens * 0.7, hscreens * 0.05),
          minimumSize: Size(wscreens * 0.7, hscreens * 0.05),
          backgroundColor: const Color(0xff0066FF),
        ),
        onPressed: () async {
          if (globalKey.currentState!.validate()) {
            final fullname = fullnameController.text.trim();
            final phone = phonenumberController.text.trim();
            final email = emailController.text.trim();
            final password = passwordController.text.trim();

            try {
              // ✅ إنشاء حساب جديد
              final userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: email,
                password: password,
              );

              final uid = userCredential.user!.uid;

              // ✅ إضافة البيانات إلى Firestore
              await FirebaseFirestore.instance.collection('users').doc(uid).set({
                'fullname': fullname,
                'phone': phone,
                'email': email,
                'created_at': Timestamp.now(),
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إنشاء الحساب بنجاح')),
              );

              Get.offAllNamed(AppRoutes.homePage); // أو أي صفحة تريد التوجيه إليها
            } on FirebaseAuthException catch (e) {
              String message;
              if (e.code == 'email-already-in-use') {
                message = 'البريد الإلكتروني مستخدم بالفعل';
              } else if (e.code == 'weak-password') {
                message = 'كلمة المرور ضعيفة جدًا';
              } else {
                message = 'حدث خطأ: ${e.message}';
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          }
        },
        child: const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
