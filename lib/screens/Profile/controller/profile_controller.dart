import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var imageBase64 = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null || userId.isEmpty) return;

      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        final data = userDoc.data();
        if (data != null) {
          fullName.value = data['fullname'] ?? '';
          email.value = data['email'] ?? '';
          phone.value = data['phone'] ?? '';
          imageBase64.value = data['image'] ?? '';
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}
