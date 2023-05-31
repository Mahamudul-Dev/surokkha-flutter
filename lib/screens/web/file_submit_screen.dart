import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/controllers/file_submission_controller.dart';
import 'package:surokkha/utils/strings.dart';
import 'package:surokkha/widgets/global/input_field.dart';

class FileSubmissionScreen extends StatelessWidget {
  FileSubmissionScreen({super.key});

  final FileSubmissionController controller =
      Get.put(FileSubmissionController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'File Submit',
            style: TextStyle(color: Colors.blue.shade800),
          ),
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue, size: 50),
                )
              : Form(
                  key: formKey,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Form(
                            child: ListView(
                              children: [
                                InputField(
                                  textEditingController:
                                      controller.certNoController,
                                  label: const Text('Certificate No'),
                                  prefixText: 'BD',
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
                                Obx(() => DropdownField(
                                      selectedValue:
                                          controller.nationality.value,
                                      items: Strings.nationality,
                                      function: (String? newValue) =>
                                          controller.onNationalityTap(newValue),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController:
                                      controller.nameController,
                                  label: const Text('Name'),
                                  validator: (value) {
                                    if (value == '' || value == null) {
                                      return 'Required This Field';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController:
                                      controller.dobController,
                                  label: const Text('Date of Birth'),
                                  suffixIcon: InkWell(
                                    onTap: () => controller.onDobTap(context),
                                    child: const Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.blue,
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
                                InputField(
                                  textEditingController:
                                      controller.dov1Controller,
                                  label:
                                      const Text('Date of Vaccine (Doese 1)'),
                                  suffixIcon: InkWell(
                                    onTap: () => controller.onDov1Tap(context),
                                    child: const Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.blue,
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
                                Obx(() => DropdownField(
                                      items: Strings.doses,
                                      label: const Text(
                                          'Name of Vaccine (Doese 1)'),
                                      selectedValue: controller.nov1.value,
                                      function: (newValue) =>
                                          controller.onNov1Tap(newValue),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController:
                                      controller.dov3Controller,
                                  label:
                                      const Text('Date of Vaccine (Doese 3)'),
                                  suffixIcon: InkWell(
                                    onTap: () => controller.onDov3Tap(context),
                                    child: const Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => DropdownField(
                                      items: Strings.dose3,
                                      label: const Text(
                                          'Name of Vaccine (Doese 3)'),
                                      selectedValue: controller.nov3.value,
                                      function: (newValue) =>
                                          controller.onNov3Tap(newValue),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController:
                                      controller.totalDoesController,
                                  label: const Text('Total Doses Given'),
                                  validator: (value) {
                                    if (value == '' || value == null) {
                                      return 'Total doese number is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: ListView(
                            children: [
                              InputField(
                                textEditingController: controller.nidController,
                                label: const Text('National Id'),
                                maxLength: 13,
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                textEditingController:
                                    controller.bdrisController,
                                label: const Text('Birth Reg No'),
                                maxLength: 17,
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                textEditingController:
                                    controller.passportController,
                                label: const Text('Passport No'),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() => DropdownField(
                                    items: Strings.gender,
                                    label: const Text('Gender'),
                                    selectedValue: controller.gender.value,
                                    function: (newValue) =>
                                        controller.onGenderTap(newValue),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                textEditingController:
                                    controller.dov2Controller,
                                label: const Text('Date of Vaccine (Doese 2)'),
                                suffixIcon: InkWell(
                                  onTap: () => controller.onDov2Tap(context),
                                  child: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.blue,
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
                              Obx(() => DropdownField(
                                    items: Strings.doses,
                                    label:
                                        const Text('Name of Vaccine (Doese 2)'),
                                    selectedValue: controller.nov2.value,
                                    function: (newValue) =>
                                        controller.onNov2Tap(newValue),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() => DropdownField(
                                    items: Strings.hospitals,
                                    label: const Text('Vaccination Center'),
                                    selectedValue: controller.vacCenter.value,
                                    function: (String? newValue) =>
                                        controller.onVacCenterTap(newValue),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(() {
                                return controller.secondaryVacCenter.value
                                    ? InputField(
                                        textEditingController:
                                            controller.newVaccenterController,
                                        label: const Text('Write Center Name'),
                                        prefixIcon: const Icon(
                                          Icons.account_balance_rounded,
                                          color: Colors.blue,
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
                              InputField(
                                readOnly: true,
                                textEditingController: controller.vaccineby,
                                label: const Text('Vaccinated By'),
                              )
                            ],
                          ),
                        ),
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
        ));
  }
}
