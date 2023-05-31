class PostDataModal {
  String user_id;
  String certificate_no;
  String national_id;
  String birth_certificate_no;
  String passport_no;
  String nationality;
  String name;
  String date_of_birth;
  String gender;
  String date_of_vaccination_dose_1;
  String name_of_vaccination_dose_1;
  String date_of_vaccination_dose_2;
  String name_of_vaccination_dose_2;
  String date_of_vaccination_dose_3;
  String name_of_vaccination_dose_3;
  String vaccination_center;
  String vaccinated_by;
  String total_does;

  PostDataModal({
    required this.user_id,
    required this.certificate_no,
    required this.national_id,
    required this.birth_certificate_no,
    required this.passport_no,
    required this.nationality,
    required this.name,
    required this.date_of_birth,
    required this.gender,
    required this.date_of_vaccination_dose_1,
    required this.name_of_vaccination_dose_1,
    required this.date_of_vaccination_dose_2,
    required this.name_of_vaccination_dose_2,
    required this.date_of_vaccination_dose_3,
    required this.name_of_vaccination_dose_3,
    required this.vaccination_center,
    required this.vaccinated_by,
    required this.total_does,
  });

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'certificate_no': certificate_no,
        'national_id': national_id,
        'birth_certificate_no': birth_certificate_no,
        'passport_no': passport_no,
        'nationality': nationality,
        'name': name,
        'date_of_birth': date_of_birth,
        'gender': gender,
        'date_of_vaccination_dose_1': date_of_vaccination_dose_1,
        'name_of_vaccination_dose_1': name_of_vaccination_dose_1,
        'date_of_vaccination_dose_2': date_of_vaccination_dose_2,
        'name_of_vaccination_dose_2': name_of_vaccination_dose_2,
        'date_of_vaccination_dose_3': date_of_vaccination_dose_3,
        'name_of_vaccination_dose_3': name_of_vaccination_dose_3,
        'vaccination_center': vaccination_center,
        'vaccinated_by': vaccinated_by,
        'total_does': total_does,
      };
}
