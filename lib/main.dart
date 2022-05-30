import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_training_johannes/core/my_app.dart';
import 'package:hive_training_johannes/model/transaction.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());
}
