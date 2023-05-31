import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/all_users_controller.dart';

class AllUsersScreen extends StatelessWidget {
  AllUsersScreen({super.key});
  final AllUsersController controller = Get.put(AllUsersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.blue,
          title: const Text('All Users'),
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 50),
                )
              : FutureBuilder(
                  future: controller.getUsers(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.blue, size: 50),
                      );
                    } else {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return Material(
                              elevation: 3,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                title: Text(snapshot.data!.docs[index]['name']),
                                subtitle: Text(
                                    "UID: ${snapshot.data!.docs[index].id}"),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                thickness: 1,
                              ),
                          itemCount: snapshot.data!.docs.length);
                    }
                  },
                );
        }));
  }
}
