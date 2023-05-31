import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surokkha/screens/create_new_user_screen.dart';
import 'package:surokkha/screens/mobile/file_list_screen.dart';
import 'package:surokkha/screens/mobile/file_submit_screen.dart';

class MobileScreenHolderController extends GetxController {
  List<IconData> bottomNavigationIcon = [Icons.send, Icons.list, Icons.people];
  var activeIndex = 0.obs;
  List<Widget> screens = [
    FileSubmitScreen(),
    FileListScreen(),
    CreateNewUserScreen()
  ];
}
