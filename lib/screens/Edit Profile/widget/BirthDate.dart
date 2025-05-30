import '../eimports.dart';
final controller = Get.put(EditProfileController());
  Widget buildBirthDateRow(BuildContext context, ) {
    final day = controller.birthdate.value.day;
    final month = controller.monthName;
    final year = controller.birthdate.value.year;

    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: controller.birthdate.value,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                primaryColor: Colors.blueAccent,
                colorScheme: const ColorScheme.dark(primary: Colors.blueAccent),
                dialogBackgroundColor: const Color(0xff1E1E2E),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          controller.birthdate.value = pickedDate;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dateBox(day.toString()),
          dateBox(month),
          dateBox(year.toString()),
        ],
      ),
    );
  }