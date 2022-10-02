import 'package:flutter/cupertino.dart';

class RestaurentRes {
  String? message;
  List<RestaurentItem>? data;

  RestaurentRes({this.message, this.data});

  RestaurentRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <RestaurentItem>[];
      json['data'].forEach((v) {
        data!.add(new RestaurentItem.fromJson(v));
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

class RestaurentItem {
  int? id;
  String? name;
  String? description;
  String? city;

  RestaurentItem({this.id, this.name, this.description, this.city});

  RestaurentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['city'] = this.city;
    return data;
  }
}


