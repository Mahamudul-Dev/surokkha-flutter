import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surokkha/modals/get_data_modal.dart';
import 'package:http/http.dart' as http;
import 'package:surokkha/utils/apis.dart';

class FileListController extends GetxController {
  List<Data> allFileList = [];
  var filteredList = <Data>[].obs;
  var isLoading = false.obs;
  final auth = FirebaseAuth.instance;
  var searchBarController = TextEditingController().obs;
  final db = FirebaseFirestore.instance;
  var currentUserName = ''.obs;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @override
  void onInit() {
    filteredList.clear();
    getCurrentUserName();
    super.onInit();
  }

  Future<GetDataModal> fetchFileList() async {
    final response = await http
        .get(Uri.parse(Api.BASE_URL + Api.GET_DATA + auth.currentUser!.uid));

    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      var fileList = GetDataModal.fromJson(data);

      allFileList.clear();
      for (int i = 0; i < fileList.data!.length; i++) {
        allFileList.add(fileList.data![i]);
      }

      return fileList;
    } else {
      return GetDataModal.fromJson(data);
    }
  }

  queryList(String query) {
    filteredList.clear();
    isLoading.value = true;
    for (int i = 0; i < allFileList.length; i++) {
      if (allFileList[i].name!.toLowerCase().contains(query.toLowerCase()) ||
          allFileList[i].passportNo!.toLowerCase().contains(query)) {
        filteredList.add(allFileList[i]);
      }
    }
    filteredList.isEmpty
        ? Get.snackbar('Opps', 'Your query was not found in database')
        : null;
    isLoading.value = false;
  }

  void deletePdf(int? id) async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse("${Api.BASE_URL}${Api.DELETE_PDF}$id"));

      final data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        if (data["result"] == true) {
          isLoading.value = false;
          Get.snackbar('Success', 'PDF Deleted Sucessfully');
        } else {
          isLoading.value = false;
          Get.snackbar('Sorry',
              'There was an error, I think file already deleted from server');
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Opps', 'Please check your internet connection');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  void getCurrentUserName() async {
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) => currentUserName.value = value['name']);
  }
}
