import 'package:flutter/material.dart';

import './transcation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('t1', 89.99, 'New shoes', DateTime.now()),
    Transaction('t2', 39.99, 'Dinner', DateTime.now()),
    Transaction('t3', 19.99, 'Shampoo', DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.all(20),
            elevation: 5,
            color: Colors.purple[300],
            child: Container(
              width: double.infinity,
              child: const Text(
                'Chart to be added',
              ),
            ),
          ),
          Column(
            children: transactions
                .map(
                  (transaction) => Container(
                    //height: 30,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.purple[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(transaction.cost.toString() + ' \$'),
                          ),
                          Column(
                            children: [
                              Text(
                                transaction.title + '\n',
                              ),
                              Text(
                                transaction.date.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
