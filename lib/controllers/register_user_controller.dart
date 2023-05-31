import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:surokkha/utils/strings.dart';

class RegisterUserController extends GetxController {
  var isLoading = false.obs;

  // input controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var isAdmin = false.obs;

  @override
  void onInit() {
    isAdminCheck();

    super.onInit();
  }

  var passVisibe = false.obs;
  passToggle() {
    passVisibe.value = !passVisibe.value;
  }

  isAdminCheck() {
    if (_auth.currentUser!.uid == Strings.admin['uid']) {
      isAdmin.value = true;
    } else {
      isAdmin.value = false;
    }
  }

  Future<void> registerUser() async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Save the user's email in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text,
      });
      Get.snackbar('Success', 'User registered successfully');
      nameController.text = '';
      emailController.text = '';
      passController.text = '';
      isLoading.value = false;

      // User registration successful
    } on FirebaseAuthException catch (e) {
      // Error handling code...
      if (e.code == 'weak-password') {
        Get.snackbar('Opps!', 'The password provided is too weak.');
        isLoading.value = false;
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Sorry', 'The account already exists for that email.');

        isLoading.value = false;
      }
    } catch (e) {
      // Error handling code...
      Get.snackbar('Error: ', e.toString());
      isLoading.value = false;
    }
  }
}
