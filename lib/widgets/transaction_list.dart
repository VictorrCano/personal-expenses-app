import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import '../models/transcation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function removeTransactionPtr;

  TransactionList(this._transactions, this.removeTransactionPtr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: ((context, index) {
          return Container(
            //height: 30,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              color: Theme.of(context).backgroundColor, //Colors.purple[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColorDark,
                        width: 2,
                      ),
                    ),
                    child: Text(
                        '\$ ' + _transactions[index].cost.toStringAsFixed(2),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _transactions[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        _transactions[index].date,
                        style: TextStyle(
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 80),
                  IconButton(
                      onPressed: () =>
                          removeTransactionPtr(_transactions[index].id),
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
