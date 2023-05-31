import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:surokkha/screens/login_screen.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  bool checkAuth() {
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  logOut() async {
    await auth.signOut().then((value) => Get.offAll(LoginScreen()));
  }
}
