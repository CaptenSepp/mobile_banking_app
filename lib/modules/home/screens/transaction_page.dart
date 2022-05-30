import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_training_johannes/database/boxes.dart';
import 'package:hive_training_johannes/model/transaction.dart';
import 'package:vrouter/vrouter.dart';

import '../widgets/transaction_dialog.dart';
import 'providers/transaction_provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key, required BuildContext context})
      : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void dispose() {
    // Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text('Hive Expense Tracker'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<Transaction>>(
          valueListenable: Boxes.getTransactions().listenable(),
          builder: (context, box, _) {
            final transactions = box.values.toList().cast<Transaction>();
            return buildContent(transactions);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => TransactionDialog(
              onClickedDone: addTransaction,
            ),
          ),
        ),
        bottomSheet: IconButton(
          onPressed: () => VRouter.of(context).to('/'),
          icon: Icon(Icons.home),
        ),
      );

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

      final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
      final color = netExpense > 0 ? Colors.green : Colors.red;

      return Column(
        children: [
          SizedBox(height: 24),
          Text(
            'Net Expense: $newExpenseString',
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

  

  // Widget buildButtons(BuildContext context, Transaction transaction) => Row(
  //       children: [
  //         Expanded(
  //           child: TextButton.icon(
  //             label: Text('Edit'),
  //             icon: Icon(Icons.edit),
  //             onPressed: () => Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (context) => TransactionDialog(
  //                   transaction: transaction,
  //                   onClickedDone: (name, amount, isExpense) =>
  //                       editTransaction(transaction, name, amount, isExpense),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: TextButton.icon(
  //             label: Text('Delete'),
  //             icon: Icon(Icons.delete),
  //             onPressed: () => deleteTransaction(transaction),
  //           ),
  //         )
  //       ],
  //     );

 
}
