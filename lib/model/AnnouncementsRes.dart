import 'package:flutter/cupertino.dart';

class AnnouncementsRes {
  String? message;
  List<AnnouncementsDetails>? data;

  AnnouncementsRes({this.message, this.data});

  AnnouncementsRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AnnouncementsDetails>[];
      json['data'].forEach((v) {
        data!.add(new AnnouncementsDetails.fromJson(v));
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

class AnnouncementsDetails {
  int? id;
  String? title;
  String? description;
  File? file;
  ImageFile? image;

  AnnouncementsDetails({this.id, this.title, this.description, this.file, this.image});

  AnnouncementsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    image = json['image'] != null ? new ImageFile.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
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

class ImageFile {
  String? createdAt;
  String? updatedAt;
  int? id;
  String? name;
  String? url;

  ImageFile({this.createdAt, this.updatedAt, this.id, this.name, this.url});

  ImageFile.fromJson(Map<String, dynamic> json) {
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