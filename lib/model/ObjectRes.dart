class ObjectRes{
  late int status_code;
  late String message = "Success!";

  ObjectRes({required this.status_code, required this.message});

  ObjectRes.fromJson(Map<String, dynamic> json) {
    status_code = json['status_code'];
    if(json['message']!=null){
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.status_code;
    data['message'] = this.message;
    return data;
  }
}