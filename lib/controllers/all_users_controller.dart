import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AllUsersController extends GetxController {
  var isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getUsers() async {
    return await db.collection('users').get();
  }
}
