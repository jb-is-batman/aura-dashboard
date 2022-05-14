class ClientsModel {

  List<Client> clients = [];

  ClientsModel({required this.clients});

  ClientsModel.fromJson(List<dynamic> json) {
    clients = [];
    for (var v in json) {
      clients.add(Client.fromJson(v));
    }
  }
}

class Client {
  String? clientId;
  String? name;

  Client({this.clientId, this.name});

  Client.fromJson(Map<String, dynamic> json) {
    clientId  = json['client_id'];
    name      = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['client_id'] = clientId;
    data['name']      = name;
    return data;
  }
}