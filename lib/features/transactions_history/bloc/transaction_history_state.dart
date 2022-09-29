
import 'package:eservice_app/features/transactions_history/model/transaction_history_model.dart';

abstract class TransactionHistoryListBaseState {
  TransactionHistoryListBaseState();
}

class InitialState extends TransactionHistoryListBaseState{}

class IsLoading extends TransactionHistoryListBaseState {}

class GetTransactionHistoryListSuccessfully extends TransactionHistoryListBaseState {
  final TransactionHistoryModel transactionHistoryList;

  GetTransactionHistoryListSuccessfully( this.transactionHistoryList);

  List<Object> get props => [transactionHistoryList];
}

class FailedStatus extends TransactionHistoryListBaseState {
  final String errorCode;
  final String errorMessage;

  FailedStatus({required this.errorCode, required this.errorMessage});
  @override
  List<Object> get props => [];
}