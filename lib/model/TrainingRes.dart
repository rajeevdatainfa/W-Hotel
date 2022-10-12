import 'package:flutter/cupertino.dart';

class TrainingRes {
  String? message;
  List<TrainingDetails>? data;

  TrainingRes({this.message, this.data});

  TrainingRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TrainingDetails>[];
      json['data'].forEach((v) {
        data!.add(new TrainingDetails.fromJson(v));
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

class TrainingDetails {
  int? id;
  String? name;
  String? description;
  String? status;
  FileDetails? file;
  FileDetails? image;

  TrainingDetails(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.file,
        this.image});

  TrainingDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    file = json['file'] != null ? new FileDetails.fromJson(json['file']) : null;
    image = json['image'] != null ? new FileDetails.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class FileDetails {
  String? createdAt;
  String? updatedAt;
  int? id;
  String? name;
  String? url;

  FileDetails({this.createdAt, this.updatedAt, this.id, this.name, this.url});

  FileDetails.fromJson(Map<String, dynamic> json) {
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


