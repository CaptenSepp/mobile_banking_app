import 'package:flutter/material.dart';

import '../../../../model/transaction.dart';
import '../providers/transaction_provider.dart';

Widget buildContent(List<Transaction> transactions) {
  if (transactions.isEmpty) {
    return Center(
      child: Text(
        'No expenses yet!',
        style: TextStyle(fontSize: 24),
      ),
    );
  } else {
    final netExpense = transactions.fold<double>(
      0,
      (previousValue, transaction) => transaction.isExpense
          ? previousValue - transaction.amount
          : previousValue + transaction.amount,
    );

    final newExpenseString = '€ ${netExpense.toStringAsFixed(2)}';

    final color = netExpense > 0 ? Colors.green : Colors.red;

    return Column(
      children: [
        SizedBox(height: 24),
        Text(
          'Total Expense:  $newExpenseString',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        ),
        SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = transactions[index];

              return buildTransaction(context, transaction);
            },
          ),
        ),
      ],
    );
  }
}
