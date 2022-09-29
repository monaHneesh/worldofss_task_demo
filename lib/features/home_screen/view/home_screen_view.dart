import 'package:eservice_app/features/history_search_widget/history_search_card.dart';
import 'package:eservice_app/features/home_screen/model/payment_method_model.dart';
import 'package:eservice_app/features/payment_method_widget/payment_method_list.dart';
import 'package:eservice_app/features/transactions_history/view/transactions_history_dataTable.dart';

import 'package:eservice_app/helper/UI/custom_scaffold.dart';
import 'package:eservice_app/helper/UI/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        pageBuilder: PageBuilder(
            body: _buildPage(),
            context: context,
            scaffoldKey: _scaffoldKey,
            allowBackButtonInAppBar: false,
            enableDrawer: true,
            appBarTitle: 'المحفظه',
            appbar: true));
  }

  Widget _buildPage() {


    return  SingleChildScrollView(
      child: Column(children: [
        PaymentMethodListOfCards(),
        HistorySearchCard(),
        TransactionsHistory()
      ],),
    );



  }

  }

