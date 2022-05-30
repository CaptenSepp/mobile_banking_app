import 'package:hive_training_johannes/model/transaction.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Transaction> getTransactions() {
    return Hive.box<Transaction>('transactions');
  }
}
