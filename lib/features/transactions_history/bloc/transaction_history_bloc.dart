import 'dart:convert';

import 'package:eservice_app/features/transactions_history/bloc/transaction_history_event.dart';
import 'package:eservice_app/features/transactions_history/bloc/transaction_history_state.dart';
import 'package:eservice_app/features/transactions_history/model/transaction_history_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TransactionHistoryBloc extends Bloc<TransactionHistoryBaseEvent, TransactionHistoryListBaseState> {


  TransactionHistoryBloc() :
        super(InitialState()) {
    on<GetTransactionHistoryList>(_getTransactionHistory);
  }

  void _getTransactionHistory(GetTransactionHistoryList event, Emitter<TransactionHistoryListBaseState> emit) async {
    try {
      //authContainers
      emit(IsLoading());
      dynamic response =
          await TransactionHistoryRepository().TransactionHistoryTest();

      if (response!= null) {
        emit(
          GetTransactionHistoryListSuccessfully(response),
        );

      }
    } catch (e) {
      if (e is PlatformException) {
        emit(FailedStatus(errorCode: e.code, errorMessage: e.message!));
      }
    }
  }

}
