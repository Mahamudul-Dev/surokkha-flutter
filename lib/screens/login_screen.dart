import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/login_controllers.dart';
import 'package:surokkha/widgets/global/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login With Account'),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 50),
                )
              : Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    //height: MediaQuery.of(context).size.height / 1.3,
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade100),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.width >= 700
                                    ? 150.h
                                    : 230.h,
                                width: MediaQuery.of(context).size.width >= 700
                                    ? 150.w
                                    : 230.w,
                                child: const Image(
                                  image: AssetImage('assets/gov_logo.png'),
                                )),
                            const SizedBox(
                              height: 25,
                            ),
                            InputField(
                              prefixIcon: const Icon(Icons.email_rounded,
                                  color: Colors.blue),
                              label: const Text('E-mail'),
                              textEditingController: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'You need to enter your email';
                                } else if (!value.contains('@')) {
                                  return 'Please provide a valid email addres';
                                } else {
                                  return null;
                                }
                              },
                              hint: 'Your email address',
                            ),
                            const SizedBox(height: 15),
                            Obx(() => InputField(
                                  obscureText: !controller.passVisibe.value,
                                  maxLines: 1,
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Colors.blue),
                                  suffixIcon: IconButton(
                                      onPressed: () => controller.passToggle(),
                                      icon: controller.passVisibe.value
                                          ? const Icon(
                                              Icons.remove_red_eye_rounded)
                                          : const Icon(Icons.password)),
                                  label: const Text('Password'),
                                  textEditingController: passController,
                                  hint: 'Your password',
                                  validator: (value) {
                                    if (value == '' || value == null) {
                                      return 'Please enter your password';
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            CupertinoButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.signInUser(
                                      emailController.text.trim(),
                                      passController.text.trim());
                                } else {
                                  Get.snackbar('Opps',
                                      'Please double check all the fields');
                                }
                              },
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                              child: const Text('Login'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        }));
  }
}
