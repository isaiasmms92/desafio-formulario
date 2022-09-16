import 'dart:convert';

List<FormModel> testeFromJson(String str) =>
    List<FormModel>.from(json.decode(str).map((x) => FormModel.fromJson(x)));

class FormModel {
  FormModel({
    required this.uid,
    required this.birthday,
    required this.name,
    required this.sex,
    required this.eligibilityStatus,
    required this.fillStatus,
  });

  String uid;
  DateTime birthday;
  String name;
  int sex;
  String eligibilityStatus;
  String fillStatus;

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        uid: json["uid"],
        birthday: DateTime.parse(json["birthday"]),
        name: json["name"],
        sex: json["sex"],
        eligibilityStatus: json["eligibilityStatus"],
        fillStatus: json["fillStatus"],
      );
}
