import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/file_submission_controller.dart';
import 'package:surokkha/services/auth_services/auth_service.dart';
import 'package:surokkha/utils/strings.dart';
import 'package:surokkha/widgets/global/input_field.dart';

class FileSubmitScreen extends StatelessWidget {
  FileSubmitScreen({super.key});
  final FileSubmissionController controller =
      Get.put(FileSubmissionController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: const Text('Surokkha Agent'),
        actions: [
          IconButton(
              onPressed: () => AuthService().logOut(),
              icon: const Icon(
                Icons.logout,
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 50),
              )
            : Form(
                key: formKey,
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: const [
                          //##########
                          //personal information
                          //##########
                          Text(
                            'Personal Information',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    InputField(
                      textEditingController: controller.certNoController,
                      hint: 'Certificate No',
                      prefixText: 'BD',
                      isFilled: true,
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Certificate number is required';
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // national id number
                    const Text('National Id'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.nidController,
                      hint: 'National Id',
                      isFilled: true,
                      textInputType: TextInputType.number,
                      maxLength: 13,
                      maxLines: 1,
                    ),
                    // bdris number
                    const Text('Birth Registration No'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.bdrisController,
                      hint: 'Birth Reg No',
                      isFilled: true,
                      textInputType: TextInputType.number,
                      maxLength: 17,
                      maxLines: 1,
                    ),
                    // passport number
                    const Text('Passport No'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.passportController,
                      hint: 'Passport No',
                      isFilled: true,
                      maxLength: 9,
                      maxLines: 1,
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Passport number is required';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // nationality
                    const Text('Nationality'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          selectedValue: controller.nationality.value,
                          items: Strings.nationality,
                          isFilled: true,
                          function: (String? newValue) =>
                              controller.onNationalityTap(newValue),
                        )),
                    const SizedBox(height: 10),

                    // name
                    const Text('Name'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.nameController,
                      hint: 'Name',
                      textInputType: TextInputType.name,
                      isFilled: true,
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Required This Field';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),

                    // date of birth
                    const Text('Date of Birth'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.dobController,
                      hint: 'Date of Birth',
                      isFilled: true,
                      textInputType: TextInputType.number,
                      suffixIcon: InkWell(
                        onTap: () => controller.onDobTap(context),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Date of Birth is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // gender
                    const Text('Gender'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          items: Strings.gender,
                          isFilled: true,
                          hint: 'Gender',
                          selectedValue: controller.gender.value,
                          function: (newValue) =>
                              controller.onGenderTap(newValue),
                        )),

                    const SizedBox(
                      height: 10,
                    ),
                    //##########
                    //vaccination information
                    //##########
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: const [
                          Text(
                            'Vaccine Information',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // date of vaccine does 1
                    const Text('Date of Vaccine  (Does 1)'),
                    const SizedBox(
                      height: 5,
                    ),

                    InputField(
                      textEditingController: controller.dov1Controller,
                      hint: 'Date of Vaccine (Doese 1)',
                      textInputType: TextInputType.number,
                      isFilled: true,
                      suffixIcon: InkWell(
                        onTap: () => controller.onDov1Tap(context),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Date of vaccine does 1 is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // name of vaccine does 1
                    const Text('Name of Vaccine  (Does 1)'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          items: Strings.doses,
                          isFilled: true,
                          hint: 'Name of Vaccine (Doese 1)',
                          selectedValue: controller.nov1.value,
                          function: (newValue) =>
                              controller.onNov1Tap(newValue),
                        )),

                    const SizedBox(
                      height: 10,
                    ),
                    // date of vaccine does 2
                    const Text('Date of Vaccine  (Does 2)'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.dov2Controller,
                      hint: 'Date of Vaccine (Doese 2)',
                      isFilled: true,
                      textInputType: TextInputType.number,
                      suffixIcon: InkWell(
                        onTap: () => controller.onDov2Tap(context),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Date of vaccine does 2 is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // name of vaccine does 2
                    const Text('Name of Vaccine  (Does 2)'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          items: Strings.doses,
                          hint: 'Name of Vaccine (Doese 2)',
                          isFilled: true,
                          selectedValue: controller.nov2.value,
                          function: (newValue) =>
                              controller.onNov2Tap(newValue),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    // date of vaccine does 3
                    const Text('Date of Vaccine  (Does 3)'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.dov3Controller,
                      hint: 'Date of Vaccine (Doese 3)',
                      isFilled: true,
                      textInputType: TextInputType.number,
                      suffixIcon: InkWell(
                        onTap: () => controller.onDov3Tap(context),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // name of vaccine does 3
                    const Text('Name of Vaccine  (Does 3)'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          items: Strings.dose3,
                          hint: 'Name of Vaccine (Doese 3)',
                          isFilled: true,
                          selectedValue: controller.nov3.value,
                          function: (newValue) =>
                              controller.onNov3Tap(newValue),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    // vaccination center
                    const Text('Vaccination Center'),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(() => DropdownField(
                          items: Strings.hospitals,
                          hint: 'Vaccination Center',
                          isFilled: true,
                          selectedValue: controller.vacCenter.value,
                          function: (String? newValue) =>
                              controller.onVacCenterTap(newValue),
                        )),
                    const SizedBox(height: 5),
                    Obx(() {
                      return controller.secondaryVacCenter.value
                          ? InputField(
                              textEditingController:
                                  controller.newVaccenterController,
                              hint: 'Write Center Name',
                              isFilled: true,
                              prefixIcon: const Icon(
                                Icons.account_balance_rounded,
                                color: Colors.white,
                              ),
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Center name is required';
                                } else {
                                  return null;
                                }
                              },
                            )
                          : const SizedBox.shrink();
                    }),
                    const SizedBox(
                      height: 10,
                    ),

                    // vaccinated by
                    const Text('Vaccinated By'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      readOnly: true,
                      textEditingController: controller.vaccineby,
                      isFilled: true,
                      hint: 'Vaccinated By',
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // total doese
                    const Text('Total Doses Given'),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                      textEditingController: controller.totalDoesController,
                      hint: 'Total Doses Given',
                      textInputType: TextInputType.number,
                      isFilled: true,
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Total doese number is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            controller.submitFile();
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.send),
      ),
    );
  }
}
