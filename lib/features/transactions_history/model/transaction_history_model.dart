// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) => TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) => json.encode(data.toJson());

class TransactionHistoryModel {
  TransactionHistoryModel({
    this.transactionHistoryList,
  });

  List<TransactionHistoryList>? transactionHistoryList;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
    transactionHistoryList: json["transactionHistoryList"] == null ? null : List<TransactionHistoryList>.from(json["transactionHistoryList"].map((x) => TransactionHistoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "transactionHistoryList": transactionHistoryList == null ? null : List<dynamic>.from(transactionHistoryList!.map((x) => x.toJson())),
  };
}

class TransactionHistoryList {
  TransactionHistoryList({
   required this.transactionType,
   required this.transactionNum,
   required this.transactionDate,
  });

  String transactionType;
  String transactionNum;
  String transactionDate;

  factory TransactionHistoryList.fromJson(Map<String, dynamic> json) => TransactionHistoryList(
    transactionType: json["transactionType"] == null ? null : json["transactionType"],
    transactionNum: json["transactionNum"] == null ? null : json["transactionNum"],
    transactionDate: json["transactionDate"] == null ? null : json["transactionDate"],
  );

  Map<String, dynamic> toJson() => {
    "transactionType": transactionType == null ? null : transactionType,
    "transactionNum": transactionNum == null ? null : transactionNum,
    "transactionDate": transactionDate == null ? null : transactionDate,
  };
}
