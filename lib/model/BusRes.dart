import 'package:flutter/cupertino.dart';

class BusRes {
  String? message;
  List<BusItem>? data;

  BusRes({this.message, this.data});

  BusRes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BusItem>[];
      json['data'].forEach((v) {
        data!.add(new BusItem.fromJson(v));
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

class BusItem {
  String? busNumber;
  String? busName;
  String? busDetail;
  String? busType;
  String? source;
  String? destination;
  String? departureTime;
  String? arrivalTime;
  bool? sunday;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  String? status;
  String? image;

  BusItem(
      {this.busNumber,
        this.busName,
        this.busDetail,
        this.busType,
        this.source,
        this.destination,
        this.departureTime,
        this.arrivalTime,
        this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.status,
        this.image});

  BusItem.fromJson(Map<String, dynamic> json) {
    busNumber = json['busNumber'];
    busName = json['busName'];
    busDetail = json['busDetail'];
    busType = json['busType'];
    source = json['source'];
    destination = json['destination'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['busNumber'] = this.busNumber;
    data['busName'] = this.busName;
    data['busDetail'] = this.busDetail;
    data['busType'] = this.busType;
    data['source'] = this.source;
    data['destination'] = this.destination;
    data['departureTime'] = this.departureTime;
    data['arrivalTime'] = this.arrivalTime;
    data['sunday'] = this.sunday;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}


