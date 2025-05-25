import 'package:banking_mobile/screens/Register/widget/from_name.dart';
import 'package:banking_mobile/screens/Register/widget/from_phone.dart';
import 'package:flutter/material.dart';
import 'widget/Register_botton.dart';
import 'widget/login_botton.dart';
import 'widget/from_email.dart';
import 'widget/from_pas.dart';
import 'widget/toptext.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161622),
      appBar: AppBar(backgroundColor: const Color(0xff161622), elevation: 0),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Toptext(),
                  SizedBox(height: 75),
                  FromName(fullnameController: fullnameController),
                  const SizedBox(height: 25),
                  FromPhone(phonenumberController: phonenumberController),
                  const SizedBox(height: 25),
                  FromEmail(emailController: emailController),
                  const SizedBox(height: 25),
                  FromPas(passwordController: passwordController),
                  const SizedBox(height: 50),
                  RegisterButton(
                    fullnameController: fullnameController,
                    phonenumberController: phonenumberController,
                    emailController: emailController,
                    passwordController: passwordController,
                    globalKey: _globalKey,
                  ),
                  const SizedBox(height: 20),
                  const loginBotton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
