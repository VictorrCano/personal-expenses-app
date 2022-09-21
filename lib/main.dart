import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart';

import './models/transcation.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
  final List<Transaction> _userTransactions = [];

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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(title: Text('Expenses Tracker'), actions: [
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () => _openNewTransactionSheet(context),
      ),
    ]);

    print(MediaQuery.of(context).size.height);
    print(appBar.preferredSize.height);
    print(MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.25,
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Chart(_userTransactions),
              ),
            ),
            _userTransactions.isEmpty
                ? Column(children: [
                    Container(
                        alignment: Alignment.center,
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.2,
                        child: const Text(
                          'No expenses added yet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                    Image.asset(
                      'assets/images/clipart2333307.png',
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.25,
                    ),
                  ])
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.75,
                    child:
                        TransactionList(_userTransactions, _deleteTransaction),
                  ),
          ],
        ),
      ), //singlechildscrollview
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openNewTransactionSheet(context),
      ),
    );
  }
}
