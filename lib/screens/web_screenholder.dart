import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:surokkha/screens/create_new_user_screen.dart';
import 'package:surokkha/screens/web/file_list_screen.dart';
import 'package:surokkha/screens/web/file_submit_screen.dart';
import 'package:surokkha/services/auth_services/auth_service.dart';
import 'package:surokkha/utils/strings.dart';

class WebScreenHolder extends StatefulWidget {
  const WebScreenHolder({super.key});

  @override
  State<WebScreenHolder> createState() => _WebScreenHolderState();
}

class _WebScreenHolderState extends State<WebScreenHolder> {
  List<Widget> screens = [
    FileSubmissionScreen(),
    const FileListScreen(),
    CreateNewUserScreen()
  ];

  int selectedScreens = 0;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Surokkha File Submission Software'),
        ),
        body: Row(
          children: [
            SidebarX(
              controller: SidebarXController(selectedIndex: selectedScreens),
              items: [
                SidebarXItem(
                    icon: Icons.send,
                    label: 'File Submit',
                    onTap: () {
                      setState(() {
                        selectedScreens = 0;
                      });
                    }),
                SidebarXItem(
                    icon: Icons.list,
                    label: 'Submission List',
                    onTap: () {
                      setState(() {
                        selectedScreens = 1;
                      });
                    }),
                SidebarXItem(
                    icon: Icons.people_alt_rounded,
                    label: 'Create new user',
                    onTap: () {
                      setState(() {
                        selectedScreens = 2;
                      });
                    }),
                SidebarXItem(
                    icon: Icons.logout_rounded,
                    label: 'Logout',
                    onTap: () => AuthService().logOut())
              ],
              theme: SidebarXTheme(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                hoverColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                selectedTextStyle: const TextStyle(color: Colors.white),
                itemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemTextPadding: const EdgeInsets.only(left: 30),
                itemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: Colors.black),
                ),
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.blue],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 30,
                    )
                  ],
                ),
                iconTheme: IconThemeData(
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 20,
                ),
              ),
              extendedTheme: const SidebarXTheme(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(child: screens[selectedScreens])
          ],
        ));
  }
}
