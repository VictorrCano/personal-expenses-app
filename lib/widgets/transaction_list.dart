import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';

import '../models/transcation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  TransactionList(this._transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: ((context, index) {
          return Container(
            //height: 30,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              color: Colors.purple[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    child: Text('\$ ' + _transactions[index].cost.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.purple)),
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
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void addTransaction(String costInput, String titleInput) {
    var uuid = Uuid();
    _transactions.add(Transaction(
        uuid.v1(),
        double.parse(costInput),
        titleInput,
        DateTime.now(),
        DateFormat.yMMMEd().format(DateTime.now())));
  }
}
