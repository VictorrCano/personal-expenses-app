import 'package:intl/intl.dart';

class Transaction {
  String id;
  double cost;
  String title;
  DateTime dateTime;
  String date;

  Transaction(this.id, this.cost, this.title, this.dateTime, this.date);
}
