import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  final List<Transaction> transaction = [
    Transaction(
        id: 't1', amount: 99.25, date: DateTime.now(), title: 'Groceries'),
    Transaction(id: 't2', amount: 98, date: DateTime.now(), title: 'Books'),
  ];
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(),
      TransactionList(transaction),
    ]);
  }
}
