import 'package:flutter/material.dart';

class PaymentMethodModel{
  String cardTitle;
  String cardBalance;
  IconData cardIcon;
  Color cardBackgroundColor;

  PaymentMethodModel({
    required this.cardBackgroundColor,
    required this.cardBalance,
    required this.cardIcon,
    required this.cardTitle});
}