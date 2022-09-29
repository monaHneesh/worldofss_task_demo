import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:eservice_app/features/transactions_history/model/transaction_history_model.dart';
import 'package:flutter/services.dart';

class TransactionHistoryRepository {
  TransactionHistoryModel? transactionHistoryList;
  static const _jsonDir = 'assets/json_files/transaction_history_mock_response';
  static const _jsonExtension = '.json';

  Future TransactionHistoryTest() async {
    final resourcePath = _jsonDir + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    try {
      await Future.delayed(Duration(seconds: 2));
      var response = Response(
        requestOptions: RequestOptions(path: resourcePath),
        data: map,
        statusCode: 200,
      );
      if (response.data != null) {
        dynamic responseData = response.data!;
        var results = responseData['response']['result'];
       transactionHistoryList = TransactionHistoryModel.fromJson(results);

        return transactionHistoryList;
      }
    } catch (e) {
      print(e);
    }
  }

}