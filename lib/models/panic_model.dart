class PanicModel {

  List<Panics> panics = [];

  PanicModel({required this.panics});

  PanicModel.fromJson(List<dynamic> json) {
    panics = [];
    json.forEach((v) {
      panics.add(Panics.fromJson(v));
    });
  }
}


class Panics {

  late String panicId;
  late String userName;
  late String device;
  String?     client;
  late String panicType;
  late double lat;
  late double long;
  late int    timestamp;

   Panics({required this.panicId, required this.userName, required this.device, required this.panicType, required this.lat, required this.long, required this.timestamp});

  Panics.fromJson(Map<String, dynamic> json) {
    panicId   = json[""];
    userName  = json[""];
    device    = json[""];
    client    = json[""];
    panicType = json[""];
    lat       = json[""];
    long      = json[""];
    timestamp = json[""];
  }
}