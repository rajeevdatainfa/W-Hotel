class UpdateUserProfileRes{
  late int status_code;
  late String message;
  late User? user;

  UpdateUserProfileRes({required this.status_code, required this.message,required this.user});

  UpdateUserProfileRes.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? pin;

  User({this.name, this.email, this.phone, this.address,this.city,this.pin});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    city = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['pin'] = this.pin;
    return data;
  }
}