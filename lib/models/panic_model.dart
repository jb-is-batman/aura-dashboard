class PanicModel {

  List<Panics> panics = [];

  PanicModel({required this.panics});

  PanicModel.fromJson(List<dynamic> json) {
    panics = [];
    for (var v in json) {
      panics.add(Panics.fromJson(v));
    }
  }
}

class Panics {
  String? panicId;
  String? fkUserId;
  String? fkDeviceId;
  String? fkClientId;
  String? fkPanictypeId;
  double? lat;
  double? long;
  int?    timestamp;
  String? userId;
  String? username;
  String? mobile;
  String? address;
  String? deviceId;
  String? devicename;
  String? panictypeId;
  String? panictypename;
  String? clientName;

  Panics(
      {this.panicId,
      this.fkUserId,
      this.fkDeviceId,
      this.fkClientId,
      this.fkPanictypeId,
      this.lat,
      this.long,
      this.timestamp,
      this.userId,
      this.username,
      this.mobile,
      this.address,
      this.deviceId,
      this.devicename,
      this.panictypeId,
      this.panictypename,
      this.clientName});

  Panics.fromJson(Map<String, dynamic> json) {
    panicId       = json['panic_id'];
    fkUserId      = json['fk_user_id'];
    fkDeviceId    = json['fk_device_id'];
    fkClientId    = json['fk_client_id'];
    fkPanictypeId = json['fk_panictype_id'];
    lat           = json['lat'];
    long          = json['long'];
    timestamp     = json['timestamp'];
    userId        = json['user_id'];
    username      = json['username'];
    mobile        = json['mobile'];
    address       = json['address'];
    deviceId      = json['device_id'];
    devicename    = json['devicename'];
    panictypeId   = json['panictype_id'];
    panictypename = json['panictypename'];
  }
}
