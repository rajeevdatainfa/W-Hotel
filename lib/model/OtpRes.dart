
class OtpRes {
  late String status;
  late String message;
  late DataOTP data;

  OtpRes({required this.status, required this.message, required this.data});

  OtpRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? new DataOTP.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataOTP {
  late int rowId;
  late int otp;

  DataOTP({required this.rowId, required this.otp});

  DataOTP.fromJson(Map<String, dynamic> json) {
    rowId = json['row_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_id'] = this.rowId;
    data['otp'] = this.otp;
    return data;
  }
}