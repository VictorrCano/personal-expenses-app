import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import './models/transcation.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracking App',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.greenAccent,
          fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    /**
    Transaction('1', 7, 't1', DateTime(2022, 09, 15, 23, 21, 19, 807517),
        'Fri, Sep 15, 2022'),
    Transaction('1', 5, 't1', DateTime(2022, 09, 16, 23, 21, 19, 807517),
        'Fri, Sep 16, 2022'),
        */
    //Transaction('2', 5, 't2', DateTime(2022, 09, 17, 23, 21, 19, 807517),
    //    'Fri, Sep 17, 2022'),
    //Transaction('3', 5, 't3', DateTime(2022, 09, 18, 23, 21, 19, 807517),
    //    'Fri, Sep 18, 2022'),
    /**Transaction('4', 5, 't4', DateTime(2022, 09, 19, 23, 21, 19, 807517),
        'Fri, Sep 19, 2022'),
    Transaction('5', 5, 't5', DateTime(2022, 09, 20, 23, 21, 19, 807517),
        'Fri, Sep 20, 2022'),
    Transaction('6', 5, 't6', DateTime(2022, 09, 21, 23, 21, 19, 807517),
        'Fri, Sep 21, 2022'),
    Transaction('7', 5, 't7', DateTime(2022, 09, 22, 23, 21, 19, 807517),
        'Fri, Sep 22, 2022'),
    Transaction('8', 5, 't8', DateTime(2022, 09, 22, 23, 21, 20, 807517),
        'Fri, Sep 22, 2022'),
      */
  ];

  void _openNewTransactionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  void _addTransaction(double cost, String title, DateTime dateTime) {
    var uuid = Uuid();
    setState(() {
      _userTransactions.add(
        Transaction(
          uuid.v1(),
          cost,
          title,
          dateTime,
          DateFormat.yMMMEd().format(dateTime),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(titleInput);
    //print(costInput);
    return Scaffold(
      appBar: AppBar(title: Text('Expenses Tracker'), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openNewTransactionSheet(context),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              color: Theme.of(context).primaryColor,
              child: Chart(_userTransactions),
            ),
            _userTransactions.isEmpty
                ? Column(children: [
                    Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: const Text(
                          'No expenses added yet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                    Image.asset(
                      'assets/images/clipart2333307.png',
                      height: 150,
                    ),
                  ])
                : TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openNewTransactionSheet(context),
      ),
    );
  }
}
