// To parse this JSON data, do
//
//     final horarioGx = horarioGxFromJson(jsonString);

import 'dart:convert';

HorarioGx horarioGxFromJson(String str) => HorarioGx.fromJson(json.decode(str));

String horarioGxToJson(HorarioGx data) => json.encode(data.toJson());

class HorarioGx {
  List<Horario> horario;

  HorarioGx({
    required this.horario,
  });

  factory HorarioGx.fromJson(Map<String, dynamic> json) => HorarioGx(
        horario:
            List<Horario>.from(json["Horario"].map((x) => Horario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Horario": List<dynamic>.from(horario.map((x) => x.toJson())),
      };
}

class Horario {
  DateTime fecha;
  String dia;
  List<Hora> horas;

  Horario({
    required this.fecha,
    required this.dia,
    required this.horas,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        fecha: DateTime.parse(json["Fecha"]),
        dia: json["Dia"],
        horas: List<Hora>.from(json["Horas"].map((x) => Hora.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "Dia": dia,
        "Horas": List<dynamic>.from(horas.map((x) => x.toJson())),
      };
}

class Hora {
  DateTime hora;
  int asistentes;
  bool openBoxSiNo;

  Hora({
    required this.hora,
    required this.asistentes,
    required this.openBoxSiNo,
  });

  factory Hora.fromJson(Map<String, dynamic> json) => Hora(
        hora: DateTime.parse(json["Hora"]),
        asistentes: json["Asistentes"],
        openBoxSiNo: json["OpenBoxSiNo"],
      );

  Map<String, dynamic> toJson() => {
        "Hora": hora.toIso8601String(),
        "Asistentes": asistentes,
        "OpenBoxSiNo": openBoxSiNo,
      };
}
