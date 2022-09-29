import 'package:eservice_app/features/transactions_history/bloc/transaction_history_bloc.dart';
import 'package:eservice_app/features/transactions_history/bloc/transaction_history_event.dart';
import 'package:eservice_app/features/transactions_history/bloc/transaction_history_state.dart';
import 'package:eservice_app/features/transactions_history/model/transaction_history_model.dart';
import 'package:eservice_app/helper/UI/card_with_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({Key? key}) : super(key: key);

  @override
  _TransactionsHistoryState createState() => _TransactionsHistoryState();
}


class _TransactionsHistoryState extends State<TransactionsHistory> {
  List<TransactionHistoryList>? transactionHistoryList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TransactionHistoryBloc>(context).add(
      GetTransactionHistoryList(
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionHistoryBloc,
        TransactionHistoryListBaseState>(listener: (context, state) {
      if (state is GetTransactionHistoryListSuccessfully) {
        transactionHistoryList=state.transactionHistoryList.transactionHistoryList;
      }
      if (state is IsLoading) {
        //TODO:show loading progress

      }
      if (state is FailedStatus) {
        //TODO:show failed dialog
      }
    }, child:
        BlocBuilder<TransactionHistoryBloc, TransactionHistoryListBaseState>(
      builder: (context, state) {
        return CardWithHeader(
            height: MediaQuery.of(context).size.height / 1.4,
            child: Column(
              children: [
                FittedBox(
                  child: DataTable(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                        color: Colors.black,
                      )),
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade200),
                      columns: [
                        DataColumn(
                          label: Text(
                            "رقم العملية",
                          ),
                        ),
                        DataColumn(
                          label: Text('نوع الحركة'),
                        ),
                        DataColumn(
                          label: Text('تاريخ الحركة'),
                        ),
                      ],

                      rows:
                      transactionHistoryList!= null && transactionHistoryList!.length>0?_testRows():[]
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'مشاهدة المزيد',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'تحميل اجمالي عمليات المحفظة',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            title: 'عمليات المحفظة');
      },
    ));
  }
  List<DataRow> _testRows() {
    return transactionHistoryList!.map((history) =>  DataRow(cells:[ DataCell(Text(history.transactionNum)),
      DataCell( Text(history.transactionType)),
      DataCell(Text(history.transactionDate))
    ])).toList();
  }

}
