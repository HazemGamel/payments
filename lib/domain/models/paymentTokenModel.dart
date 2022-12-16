// To parse this JSON data, do
//
//     final paymentTokenModel = paymentTokenModelFromJson(jsonString);

import 'dart:convert';

PaymentTokenModel paymentTokenModelFromJson(String str) => PaymentTokenModel.fromJson(json.decode(str));

String paymentTokenModelToJson(PaymentTokenModel data) => json.encode(data.toJson());

class PaymentTokenModel {
  PaymentTokenModel({
   required this.token,
  });

  String token;

  factory PaymentTokenModel.fromJson(Map<String, dynamic> json) => PaymentTokenModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
