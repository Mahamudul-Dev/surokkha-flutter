class GetDataModal {
  bool? result;
  List<Data>? data;

  GetDataModal({this.result, this.data});

  GetDataModal.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? certificateNo;
  String? nationalId;
  String? birthCertificateNo;
  String? passportNo;
  String? nationality;
  String? name;
  String? dateOfBirth;
  String? gender;
  String? dateOfVaccinationDose1;
  String? nameOfVaccinationDose1;
  String? dateOfVaccinationDose2;
  String? nameOfVaccinationDose2;
  String? dateOfVaccinationDose3;
  String? nameOfVaccinationDose3;
  String? vaccinationCenter;
  String? vaccinatedBy;
  String? totalDoes;
  String? pdfUrl;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.certificateNo,
      this.nationalId,
      this.birthCertificateNo,
      this.passportNo,
      this.nationality,
      this.name,
      this.dateOfBirth,
      this.gender,
      this.dateOfVaccinationDose1,
      this.nameOfVaccinationDose1,
      this.dateOfVaccinationDose2,
      this.nameOfVaccinationDose2,
      this.dateOfVaccinationDose3,
      this.nameOfVaccinationDose3,
      this.vaccinationCenter,
      this.vaccinatedBy,
      this.totalDoes,
      this.pdfUrl,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    certificateNo = json['certificate_no'];
    nationalId = json['national_id'];
    birthCertificateNo = json['birth_certificate_no'];
    passportNo = json['passport_no'];
    nationality = json['nationality'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    dateOfVaccinationDose1 = json['date_of_vaccination_dose_1'];
    nameOfVaccinationDose1 = json['name_of_vaccination_dose_1'];
    dateOfVaccinationDose2 = json['date_of_vaccination_dose_2'];
    nameOfVaccinationDose2 = json['name_of_vaccination_dose_2'];
    dateOfVaccinationDose3 = json['date_of_vaccination_dose_3'];
    nameOfVaccinationDose3 = json['name_of_vaccination_dose_3'];
    vaccinationCenter = json['vaccination_center'];
    vaccinatedBy = json['vaccinated_by'];
    totalDoes = json['total_does'];
    pdfUrl = json['pdf_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['certificate_no'] = certificateNo;
    data['national_id'] = nationalId;
    data['birth_certificate_no'] = birthCertificateNo;
    data['passport_no'] = passportNo;
    data['nationality'] = nationality;
    data['name'] = name;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['date_of_vaccination_dose_1'] = dateOfVaccinationDose1;
    data['name_of_vaccination_dose_1'] = nameOfVaccinationDose1;
    data['date_of_vaccination_dose_2'] = dateOfVaccinationDose2;
    data['name_of_vaccination_dose_2'] = nameOfVaccinationDose2;
    data['date_of_vaccination_dose_3'] = dateOfVaccinationDose3;
    data['name_of_vaccination_dose_3'] = nameOfVaccinationDose3;
    data['vaccination_center'] = vaccinationCenter;
    data['vaccinated_by'] = vaccinatedBy;
    data['total_does'] = totalDoes;
    data['pdf_url'] = pdfUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
