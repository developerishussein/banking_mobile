import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/App/AppRoutes.dart';

class Loginbotton extends StatelessWidget {
  const Loginbotton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
  });
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
            final email = emailController.text.trim();
            final password = passwordController.text;

            try {
              // 🔐 تسجيل الدخول باستخدام FirebaseAuth
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              // ✅ إذا نجح تسجيل الدخول، نعرض رسالة
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح')));
              Get.offAllNamed(AppRoutes.mynv);
              // يمكنك أيضًا التوجيه إلى صفحة أخرى هنا
            } on FirebaseAuthException catch (e) {
              // ⚠️ التعامل مع أخطاء تسجيل الدخول
              String message;
              if (e.code == 'user-not-found') {
                message = 'المستخدم غير موجود';
              } else if (e.code == 'wrong-password') {
                message = 'كلمة المرور غير صحيحة';
              } else {
                message = 'حدث خطأ: ${e.message}';
              }

              // عرض رسالة الخطأ
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            }
          }
        },
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
