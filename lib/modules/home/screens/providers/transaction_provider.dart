import 'package:flutter/material.dart';
import '../../../../database/boxes.dart';
import '../../../../model/transaction.dart';

Widget buildTransaction(
  BuildContext context,
  Transaction transaction,
) {
  final color = transaction.isExpense ? Colors.red : Colors.green;
  final amount = '\$' + transaction.amount.toStringAsFixed(2);

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
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      children: const [
        // buildButtons(context, transaction),
      ],
    ),
  );
}

Future addTransaction(String name, double amount, bool isExpense) async {
  final transaction = Transaction()
    ..name = name
    ..createdDate = DateTime.now()
    ..amount = amount
    ..isExpense = isExpense;

  final box = Boxes.getTransactions();

  box.add(transaction);
}

void editTransaction(
  Transaction transaction,
  String name,
  double amount,
  bool isExpense,
) {
  transaction.name = name;
  transaction.amount = amount;
  transaction.isExpense = isExpense;
  transaction.save();
}

void deleteTransaction(Transaction transaction) {
  transaction.delete();
}
