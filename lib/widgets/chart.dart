import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transcation.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final currentWeekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == currentWeekDay.day &&
            recentTransactions[i].dateTime.month == currentWeekDay.month &&
            recentTransactions[i].dateTime.year == currentWeekDay.year) {
          totalSum += recentTransactions[i].cost;
        }
      }
      return {'day': DateFormat.E().format(currentWeekDay), 'amount': totalSum};
    });
  }

  double get transactionsSum {
    double sum = 0;
    for (var tx in groupedTransactionValues) {
      sum += double.parse(tx['amount'].toString());
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues
              .map((spendingDay) => ChartBar(
                    double.parse(spendingDay['amount'].toString()),
                    (double.parse(spendingDay['amount'].toString()) /
                        transactionsSum),
                    spendingDay['day'].toString(),
                  ))
              .toList(),
        ));
  }
}
