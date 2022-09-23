class GenRes{
  late String status;
  late String message;

  GenRes({required this.status, required this.message});

  GenRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.message;
    return data;
  }
}