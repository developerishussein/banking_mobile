import 'imports.dart';
class RequestMoneyPage extends StatelessWidget {
  final controller = Get.put(RequestMoneyController());

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(color: Colors.white70);
    final inputDecoration = InputDecoration(
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.white),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text("Request Money", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label("Payer Name"),
              inputField(controller.payerNameController),
              label("Email Address"),
              inputField(controller.emailController, icon: Icons.email),
              label("Description"),
              inputField(controller.descriptionController),
              label("Monthly Due By"),
              Row(
                children: [
                  Expanded(
                    child: inputField(controller.dayController, hint: "DD"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: inputField(controller.monthController, hint: "MM"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: inputField(controller.yearController, hint: "YYYY"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF1B1B2F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter Your Amount", style: labelStyle),
                    SizedBox(height: 8),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.currency.value} ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.currency.value =
                                  controller.currency.value == 'USD'
                                      ? 'EUR'
                                      : 'USD';
                            },
                            child: Text(
                              "Change Currency?",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      controller: controller.amountController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      decoration: inputDecoration,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0066FF),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: controller.sendMoneyRequest,
                child: Center(
                  child: Text(
                    "Request Money ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget label(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(text, style: TextStyle(color: Colors.white70)),
  );

  Widget inputField(
    TextEditingController controller, {
    String? hint,
    IconData? icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white12)),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon:
              icon != null ? Icon(icon, color: Colors.white70, size: 20) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
