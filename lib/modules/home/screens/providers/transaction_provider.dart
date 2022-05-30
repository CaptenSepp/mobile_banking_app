import 'package:flutter/material.dart';
import '../../../../database/boxes.dart';
import '../../../../model/transaction.dart';
import '../components/over_view_card.dart';

Widget buildTransaction(
  final BuildContext context,
  final Transaction transaction,
) {
  final color = transaction.isExpense ? Colors.red : Colors.green;
  final amount = '\$' + transaction.amount.toStringAsFixed(2);

  return OverViewCard(
      amount: amount, color: color, context: context, transaction: transaction);
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
