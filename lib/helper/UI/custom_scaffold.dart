

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'page_builder.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    Key? key,
    @required this.pageBuilder,
  }) : super(
          key: key,
        );

  final PageBuilder? pageBuilder;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.pageBuilder!.backButtonCallBack != null) {
          widget.pageBuilder!.backButtonCallBack!();
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          Scaffold(
            key: widget.pageBuilder!.scaffoldKey,
            backgroundColor: Colors.grey.shade100,
            appBar: (widget.pageBuilder!.appbar)
                ? AppBar(
                    automaticallyImplyLeading:
                        widget.pageBuilder!.allowBackButtonInAppBar,
                    primary: true,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.grey.shade100),
                    actions: widget.pageBuilder!.enableDrawer
                        ? [
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: IconButton(
                                  icon: Icon(Icons.menu),
                                  color: Colors.black, onPressed: () {
                                  widget.pageBuilder!.scaffoldKey.currentState!.openDrawer();
                                  },
                                ))
                          ]
                        : [],

                    title: Padding(
                        padding: EdgeInsets.only(
                            left: widget.pageBuilder!.allowBackButtonInAppBar
                                ? 0.0
                                : 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: _appbarTitle(),
                        )),
                    backgroundColor: Colors.grey.shade100,
                    centerTitle: false,
                    iconTheme: const IconThemeData(color: Colors.black),
                  )
                : null,
            body: (!widget.pageBuilder!.appbar)
                ? Container(
                    color: Colors.white,
                    child: SafeArea(
                      child: _buildBody(widget.pageBuilder!),
                    ),
                  )
                : _buildBody(widget.pageBuilder!),
          ),
        ],
      ),
    );
  }

  Text _appbarTitle() {
    return Text(
      widget.pageBuilder!.appBarTitle,
      style: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }

  _buildBody(PageBuilder pageBuilder) {
    return GestureDetector(onTap: () {}, child: pageBuilder.body);
  }
}
