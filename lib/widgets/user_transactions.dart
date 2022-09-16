import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transcation.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction('t1', 89.99, 'New shoes', DateTime.now(),
        DateFormat.yMMMEd().format(DateTime.now())),
    Transaction('t2', 39.99, 'Dinner', DateTime.now(),
        DateFormat.yMMMEd().format(DateTime.now())),
    Transaction('t3', 19.99, 'Shampoo', DateTime.now(),
        DateFormat.yMMMEd().format(DateTime.now()))
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(addTransaction),
      TransactionList(_userTransactions),
    ]);
  }

  void addTransaction(String cost, String title) {
    var uuid = Uuid();
    setState(() {
      _userTransactions.add(
        Transaction(
          uuid.v1(),
          double.parse(cost),
          title,
          DateTime.now(),
          DateFormat.yMMMEd().format(DateTime.now()),
        ),
      );
    });
  }
}
