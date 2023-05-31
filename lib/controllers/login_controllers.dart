import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:surokkha/screens/web_screenholder.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var passVisibe = false.obs;
  final auth = FirebaseAuth.instance;

  Future<void> signInUser(String email, String password) async {
    isLoading.value = !isLoading.value;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = !isLoading.value;

      // Sign in successful, do something with the userCredential object
      Get.snackbar('Success', 'Successfully logged in');
      Get.offAll(WebScreenHolder());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        isLoading.value = !isLoading.value;
        Get.snackbar('Not found', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        isLoading.value = !isLoading.value;
        Get.snackbar('Opps', 'Wrong password provided for that user.');
      } else {
        Get.snackbar('Error', e.message.toString());
      }
    }
  }

  passToggle() {
    passVisibe.value = !passVisibe.value;
  }
}
