class SignUpRes{
  late int status_code;
  late String message;
  late String ID="";

  SignUpRes({required this.status_code, required this.message});

  SignUpRes.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    message = json['message'];
    if(json['ID']!=null){
      ID = json['ID'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['message'] = this.message;
    data['ID'] = this.ID;
    return data;
  }
}