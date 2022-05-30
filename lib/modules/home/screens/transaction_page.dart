import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_training_johannes/database/boxes.dart';
import 'package:hive_training_johannes/model/transaction.dart';
import 'package:vrouter/vrouter.dart';

import 'providers/transaction_provider.dart';
import 'widgets/transacions_overview.dart';
import 'widgets/transaction_dialog.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void dispose() {
    //! Hive.close();
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
