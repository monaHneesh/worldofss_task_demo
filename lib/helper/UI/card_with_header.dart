import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class CardWithHeader extends StatefulWidget {
  final Widget child;
  final String title;
  final double height;
  const CardWithHeader({Key? key,required this.child,required this.title,required this.height}) : super(key: key);

  @override
  _CardWithHeaderState createState() => _CardWithHeaderState();
}

class _CardWithHeaderState extends State<CardWithHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical:10,horizontal: 15),
        height:widget.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Align(alignment:Alignment.topRight,child: Text(widget.title,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
              Divider(thickness: 2,),
              widget.child
            ],
          ),
        ),
      );
  }
}

