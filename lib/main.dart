import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import './models/transcation.dart';
import './widgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracking App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(titleInput);
    //print(costInput);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
