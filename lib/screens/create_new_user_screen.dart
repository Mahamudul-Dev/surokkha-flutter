import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/register_user_controller.dart';
import 'package:surokkha/screens/all_users_screen.dart';
import 'package:surokkha/widgets/global/input_field.dart';

class CreateNewUserScreen extends StatelessWidget {
  CreateNewUserScreen({super.key});
  final RegisterUserController controller = Get.put(RegisterUserController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
          title: const Text('Register New User'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.isAdmin.value
                      ? Get.to(AllUsersScreen())
                      : Get.snackbar('Sorry',
                          'You dont have permission to access this page');
                },
                icon: const Icon(Icons.group)),
            const SizedBox(width: 10)
          ],
        ),
        body: Obx(() => Center(
            child: controller.isLoading.value
                ? Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.blue, size: 50),
                  )
                : Obx(() {
                    return controller.isAdmin.value
                        ? Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: const EdgeInsets.symmetric(vertical: 25),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(15)),
                            child: Form(
                              key: formKey,
                              child: ListView(
                                children: [
                                  InputField(
                                    textEditingController:
                                        controller.nameController,
                                    label: Text('Name'),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InputField(
                                    textEditingController:
                                        controller.emailController,
                                    label: Text('Email'),
                                    textInputType: TextInputType.emailAddress,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() => InputField(
                                        obscureText:
                                            !controller.passVisibe.value,
                                        maxLines: 1,
                                        prefixIcon: const Icon(Icons.lock,
                                            color: Colors.blue),
                                        suffixIcon: IconButton(
                                            onPressed: () =>
                                                controller.passToggle(),
                                            icon: controller.passVisibe.value
                                                ? const Icon(Icons
                                                    .remove_red_eye_rounded)
                                                : const Icon(Icons.password)),
                                        label: const Text('Password'),
                                        textEditingController:
                                            controller.passController,
                                        hint: 'Your password',
                                        validator: (value) {
                                          if (value == '' || value == null) {
                                            return 'Please enter your password';
                                          } else {
                                            return null;
                                          }
                                        },
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: CupertinoButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          controller.registerUser();
                                        } else {
                                          Get.snackbar('Opps',
                                              'Please double check all the fields');
                                        }
                                      },
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      child: const Text('Register'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Sorry',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'You dont have permission to access this page!',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              )
                            ],
                          ));
                  }))));
  }
}
