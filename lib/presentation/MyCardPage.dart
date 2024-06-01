


import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class MyCardPage extends StatelessWidget {
  final List<CreditCardModel> cards;

  MyCardPage({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CreditCardWidget(
              cardNumber: cards[index].cardNumber,
              expiryDate: cards[index].expiryDate,
              cardHolderName: cards[index].cardHolderName,
              cvvCode: cards[index].cvvCode,
              showBackView: cards[index].isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (CreditCardBrand? brand) {},
            ),
          );
        },
      ),
    );
  }
}
