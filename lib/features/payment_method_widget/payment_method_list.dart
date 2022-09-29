import 'package:eservice_app/features/home_screen/model/payment_method_model.dart';
import 'package:eservice_app/features/payment_method_widget/payment_methods_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentMethodListOfCards extends StatelessWidget {
  const PaymentMethodListOfCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PaymentMethodModel> homePagePaymentMethod = [
      PaymentMethodModel(
        cardTitle: "الرصيد المتوفر",
        cardBackgroundColor: Colors.blueAccent,
        cardBalance: '2585 ريال',
        cardIcon: Icons.food_bank_outlined,
      ),
      PaymentMethodModel(
        cardTitle: "الرصيد المحجوز",
        cardBackgroundColor: Colors.redAccent,
        cardBalance: '140 ريال',
        cardIcon: Icons.money,
      )
    ];
    double _cardWidthToScreenRatio = 0.30;
    double cardHeight =
        MediaQuery.of(context).size.height * _cardWidthToScreenRatio;

    return Container(
      padding: EdgeInsets.only(top: 20, right: 5, left: 10, bottom: 20),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: cardHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homePagePaymentMethod.length,
              itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: HomePaymentMethodsItemView(
                    paymentMethod: homePagePaymentMethod[index],
                  )),
            )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('شحن المحفظه'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
