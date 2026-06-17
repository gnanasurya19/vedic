import 'dart:ui';

class RitualDetailModel {
  String? id;
  String? name;
  int? totalAmount;
  String? serviceName;
  String? location;
  String? status;
  int? statusID;
  String? datetime;
  String? duration;
  bool? isApproved;
  double? rating;
  int? usersRated;
  String? phone;
  String? email;
  int? attendies;
  PaymentDetails? paymentDetails;
  String? speacialInstruction;
  double? latitude;
  double? longitude;
  Color? color;

  RitualDetailModel(
      {this.id,
      this.name,
      this.totalAmount,
      this.serviceName,
      this.location,
      this.status,
      this.statusID,
      this.datetime,
      this.duration,
      this.isApproved,
      this.rating,
      this.usersRated,
      this.phone,
      this.email,
      this.attendies,
      this.paymentDetails,
      this.speacialInstruction,
      this.latitude,
      this.longitude,
      this.color
      });

  RitualDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalAmount = json['price'];
    serviceName = json['serviceName'];
    location = json['location'];
    status = json['status'];
    statusID = json['statusID'];
    datetime = json['datetime'];
    duration = json['duration'];
    isApproved = json['isApproved'];
    rating = json['rating'] * 1.0;
    usersRated = json['usersRated'];
    phone = json['phone'];
    email = json['email'];
    attendies = json['attendies'];
    paymentDetails = json['paymentDetails'] != null
        ?  PaymentDetails.fromJson(json['paymentDetails'])
        : null;
    speacialInstruction = json['speacialInstruction'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = totalAmount;
    data['serviceName'] = serviceName;
    data['location'] = location;
    data['status'] = status;
    data['statusID'] = statusID;
    data['datetime'] = datetime;
    data['duration'] = duration;
    data['isApproved'] = isApproved;
    data['rating'] = rating;
    data['usersRated'] = usersRated;
    data['phone'] = phone;
    data['email'] = email;
    data['attendies'] = attendies;
    if (paymentDetails != null) {
      data['paymentDetails'] = paymentDetails!.toJson();
    }
    data['speacialInstruction'] = speacialInstruction;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class PaymentDetails {
  int? serviceFee;
  int? platformFee;
  int? gST;

  PaymentDetails({this.serviceFee, this.platformFee, this.gST});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    serviceFee = json['serviceFee'];
    platformFee = json['PlatformFee'];
    gST = json['GST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceFee'] = serviceFee;
    data['PlatformFee'] = platformFee;
    data['GST'] = gST;
    return data;
  }
}
