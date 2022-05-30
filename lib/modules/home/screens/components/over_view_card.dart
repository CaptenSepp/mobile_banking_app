import 'package:flutter/material.dart';

import '../../../../model/transaction.dart';

class OverViewCard extends StatelessWidget {
  const OverViewCard(
      {Key? key,
      required this.amount,
      required this.color,
      required this.context,
      required this.transaction})
      : super(key: key);

  final String amount;
  final MaterialColor color;
  final BuildContext context;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.name,
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: Text(
          amount,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: const [
          // buildButtons(context, transaction),
        ],
      ),
    );
  }
}