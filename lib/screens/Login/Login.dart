import 'Limports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.backgroundColor,
      appBar: AppBar(backgroundColor: Mycolors.backgroundColor, elevation: 0),
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
                  const SizedBox(height: 100),
                  FromEmail(emailController: emailController),
                  const SizedBox(height: 25),
                  FromPas(passwordController: passwordController),
                  const SizedBox(height: 50),
                  Loginbotton(
                    emailController: emailController,
                    passwordController: passwordController,
                    globalKey: _globalKey,
                  ),
                  const SizedBox(height: 20),
                  const RegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
