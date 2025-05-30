import '../eimports.dart';

Widget dateBox(String text) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xff1E1E2E),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}
