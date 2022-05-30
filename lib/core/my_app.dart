import 'package:flutter/material.dart';
import 'package:hive_training_johannes/core/provider/my_app_provider.dart';
import 'package:hive_training_johannes/page/transaction_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  static final String title = 'Hive Expense App';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => MyAppProvider(), child: const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: title,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: TransactionPage(),
    );
  }
}
