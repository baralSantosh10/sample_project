class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? type;
  String? phone;

  User({this.id, this.name, this.email, this.password, this.type, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['phone'] = phone;
    return data;
  }
}
