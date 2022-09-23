class UserDetails{
  late String status;
  late String message;
  late User user;


  UserDetails({required this.status, required this.message});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
    user =  (json['user'] != null ? new User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.message;
    if (this.user != null) {
      data['data'] = this.user.toJson();
    }
    return data;

  }
}


class User {
  late String name;
  late String uId;


  User({required this.name, required this.uId});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.uId;
    return data;
  }
}