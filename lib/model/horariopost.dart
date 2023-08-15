// To parse this JSON data, do
//
//     final horarioPost = horarioPostFromJson(jsonString);

import 'dart:convert';

HorarioPost horarioPostFromJson(String str) =>
    HorarioPost.fromJson(json.decode(str));

String horarioPostToJson(HorarioPost data) => json.encode(data.toJson());

class HorarioPost {
  int iBoxNid;
  DateTime iFecha;
  bool iSemanaSiNo;

  HorarioPost({
    required this.iBoxNid,
    required this.iFecha,
    required this.iSemanaSiNo,
  });

  factory HorarioPost.fromJson(Map<String, dynamic> json) => HorarioPost(
        iBoxNid: json["iBoxNid"],
        iFecha: DateTime.parse(json["iFecha"]),
        iSemanaSiNo: json["iSemanaSiNo"],
      );

  Map<String, dynamic> toJson() => {
        "iBoxNid": iBoxNid,
        "iFecha":
            "${iFecha.year.toString().padLeft(4, '0')}-${iFecha.month.toString().padLeft(2, '0')}-${iFecha.day.toString().padLeft(2, '0')}",
        "iSemanaSiNo": iSemanaSiNo,
      };
}
