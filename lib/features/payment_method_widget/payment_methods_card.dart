import 'dart:async';
import 'dart:ui';
import 'package:eservice_app/constatnts/app_colors.dart';
import 'package:eservice_app/features/home_screen/model/payment_method_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePaymentMethodsItemView extends StatefulWidget {
  PaymentMethodModel paymentMethod;
  HomePaymentMethodsItemView({Key? key,
  required this.paymentMethod});

  @override
  _HomePaymentMethodsItemViewState createState() =>
      _HomePaymentMethodsItemViewState();
}

class _HomePaymentMethodsItemViewState extends State<HomePaymentMethodsItemView> {


  @override
  void initState() {
    super.initState();


  }



  @override
  Widget build(BuildContext context) {

    return Container(

      width: MediaQuery.of(context).size.width/1.8,
        decoration: BoxDecoration(
          color: widget.paymentMethod.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(overflow: Overflow.visible, children: [
              Container(),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(minHeight: 12, minWidth: 12),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        widget.paymentMethod.cardIcon,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ),
            ]),
            SizedBox(
              height: 60,
            ),
            Text(widget.paymentMethod.cardTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )),

            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.paymentMethod.cardBalance,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),

                  ],
                ),
                Expanded(child: Container()),
              ],
            ),
          ],
        ));
  }
}
