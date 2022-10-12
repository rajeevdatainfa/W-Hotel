import 'package:flutter/cupertino.dart';

class BusScheduleRes {
  String? message;
  List<BusDetails>? data;

  BusScheduleRes({this.message, this.data});

  BusScheduleRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BusDetails>[];
      json['data'].forEach((v) {
        data!.add(new BusDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusDetails {
  int? id;
  String? name;
  String? description;
  File? file;
  File? image;

  BusDetails({this.id, this.name, this.description, this.file, this.image});

  BusDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    image = json['image'] != null ? new File.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class File {
  String? createdAt;
  String? updatedAt;
  int? id;
  String? name;
  String? url;

  File({this.createdAt, this.updatedAt, this.id, this.name, this.url});

  File.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}