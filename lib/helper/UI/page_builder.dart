import 'package:flutter/material.dart';

class PageBuilder {
  bool allowBackButtonInAppBar;
  bool appbar;
  String appBarTitle;
  bool enableDrawer;
  GlobalKey<ScaffoldState> scaffoldKey;
  Widget body;
  BuildContext context;
  Function? backButtonCallBack;
  List<Widget>? appBarActions;
  Widget? footer;
  String subTitle;





  PageBuilder({
    this.appBarActions,
    this.enableDrawer=false,
    required this.scaffoldKey,
    this.backButtonCallBack,
    this.appBarTitle = "",
    this.appbar = true,
    required this.context,
    this.allowBackButtonInAppBar = true,
    required this.body,
    this.subTitle="",

  });
}
