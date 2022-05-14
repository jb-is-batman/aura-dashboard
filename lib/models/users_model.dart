class UsersModel {

  List<User> users = [];

  UsersModel({required this.users});

  UsersModel.fromJson(List<dynamic> json) {
    users = [];
    for (var v in json) {
      users.add(User.fromJson(v));
    }
  }
}

class User {
  String? userId;
  String? name;
  String? mobile;
  String? address;

  User({this.userId, this.name, this.mobile, this.address});

  User.fromJson(Map<String, dynamic> json) {
    userId  = json['user_id'];
    name    = json['name'];
    mobile  = json['mobile'];
    address = json['address'];
  }
}