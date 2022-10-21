import 'dart:convert';

NotificacionesResponse notificacionesResponseFromMap(String str) =>
    NotificacionesResponse.fromMap(json.decode(str));

String notificacionesResponseToMap(NotificacionesResponse data) =>
    json.encode(data.toMap());

class NotificacionesResponse {
  NotificacionesResponse({
    required this.data,
  });

  List<Sedes> data;

  factory NotificacionesResponse.fromMap(Map<String, dynamic> json) =>
      NotificacionesResponse(
        data: List<Sedes>.from(json["Data"].map((x) => Sedes.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Sedes {
  Sedes({
    required this.sede,
    required this.room,
  });

  String sede;
  String room;

  factory Sedes.fromMap(Map<String, dynamic> json) => Sedes(
        sede: json["sede"],
        room: json["room"],
      );

  Map<String, dynamic> toMap() => {
        "sede": sede,
        "room": room,
      };
}
