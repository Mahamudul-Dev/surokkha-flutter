import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:surokkha/modals/post_data_modal.dart';
import 'package:surokkha/modals/post_data_response_modal.dart';
import 'package:surokkha/services/rangen.dart';
import 'package:surokkha/utils/apis.dart';
import 'package:surokkha/utils/strings.dart';

class FileSubmissionController extends GetxController {
  // controllers
  final certNoController = TextEditingController();
  final nidController = TextEditingController();
  final passportController = TextEditingController();
  final bdrisController = TextEditingController();
  final nationalityController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final Rx<DateTime> selectedDob = Rx<DateTime>(DateTime.now());
  final genderController = TextEditingController();
  final dov1Controller = TextEditingController();
  final dov2Controller = TextEditingController();
  final dov3Controller = TextEditingController();
  final newVaccenterController = TextEditingController();
  final vaccineby = TextEditingController();
  final totalDoesController = TextEditingController();

  final rangen = GenerateInt();

  // -----
  var nationality = Strings.nationality.first.obs;
  var gender = Strings.gender.first.obs;
  var nov1 = Strings.doses.first.obs;
  var nov2 = Strings.doses.first.obs;
  var nov3 = Strings.dose3.first.obs;
  var vacCenter = Strings.hospitals.first.obs;
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var secondaryVacCenter = false.obs;
  String secondaryCenterName = '';
  String vacCenterName = '';

  @override
  void onInit() {
    var certNumber = rangen.generate(12);
    certNoController.text = certNumber;
    vaccineby.text = 'Directorate General of Health Services (DGHS)';
    totalDoesController.text = '2';
    super.onInit();
  }

  void onNationalityTap(String? newValue) {
    nationality.value = newValue ?? '';
  }

  void onGenderTap(String? newvalue) {
    gender.value = newvalue ?? '';
  }

  void onNov1Tap(String? newValue) {
    nov1.value = newValue ?? '';
  }

  void onNov2Tap(String? newValue) {
    nov2.value = newValue ?? '';
  }

  void onNov3Tap(String? newValue) {
    nov3.value = newValue ?? '';
    if (newValue == 'None') {
      totalDoesController.text = '2';
    } else {
      totalDoesController.text = '3';
    }
  }

  void onVacCenterTap(String? newValue) {
    if (newValue == 'None of this') {
      secondaryVacCenter.value = true;
      vacCenter.value = newValue ?? '';
    } else if (newValue == 'Upazilla Health Complex, ') {
      secondaryVacCenter.value = true;
      vacCenter.value = newValue ?? '';
    } else {
      secondaryVacCenter.value = false;
      vacCenter.value = newValue ?? '';
    }
  }

  void onDobTap(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDob.value,
      firstDate: DateTime(1700),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dobController.text = dateFormat.format(picked).toString();
    }
  }

  void onDov1Tap(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dov1Controller.text = dateFormat.format(picked).toString();
    }
  }

  void onDov2Tap(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dov2Controller.text = dateFormat.format(picked).toString();
    }
  }

  void onDov3Tap(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dov3Controller.text = dateFormat.format(picked).toString();
    }
  }

  Future<void> submitFile() async {
    isLoading.value = true;
    // check vaccination center
    if (newVaccenterController.text != '') {
      if (vacCenter.value == 'None of this') {
        vacCenterName = newVaccenterController.text;
      } else {
        vacCenterName = vacCenter.value + newVaccenterController.text;
      }
    } else {
      vacCenterName = vacCenter.value;
    }
    final data = PostDataModal(
        user_id: auth.currentUser!.uid,
        certificate_no: "BD${certNoController.text}",
        national_id: nidController.text,
        birth_certificate_no: bdrisController.text,
        passport_no: passportController.text,
        nationality: nationality.value,
        name: nameController.text.toUpperCase(),
        date_of_birth: dobController.text,
        gender: gender.value,
        date_of_vaccination_dose_1: dov1Controller.text,
        name_of_vaccination_dose_1: nov1.value,
        date_of_vaccination_dose_2: dov2Controller.text,
        name_of_vaccination_dose_2: nov2.value,
        date_of_vaccination_dose_3: dov3Controller.text,
        name_of_vaccination_dose_3: nov3.value,
        vaccination_center: vacCenterName,
        vaccinated_by: vaccineby.text,
        total_does: totalDoesController.text);

    try {
      final request = await http.post(
          Uri.parse(Api.BASE_URL + Api.GENERATE_PDF),
          body: data.toJson());
      final response = jsonDecode(request.body.toString());

      var result = PostDataResponseModal.fromJson(response);
      if (result.result == true || result.pdfUrl.isNotEmpty) {
        isLoading.value = false;
        Get.snackbar('Success', 'File Submited successfully');
        resetAllFields();
      } else if (result.result == false) {
        Get.snackbar('Sorry', 'Please double check all fields');
      } else {
        isLoading.value = false;

        Get.snackbar('Opps', 'We are facing some error');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  void resetAllFields() {
    // certificate number
    certNoController.text = rangen.generate(12);
    // name
    nameController.text = '';
    // date of birth
    dobController.text = '';
    // date of vaccine
    dov1Controller.text = '';
    dov2Controller.text = '';
    dov3Controller.text = '';
    // nid or bdris
    nidController.text = '';
    bdrisController.text = '';
    // passport
    passportController.text = '';
  }
}
