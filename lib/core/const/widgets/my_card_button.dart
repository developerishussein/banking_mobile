import 'mycard_imports.dart';

class MyCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyCardButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("ADD CARD"),
    );
  }
}
