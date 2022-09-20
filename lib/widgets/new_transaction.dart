import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionPtr;

  NewTransaction(this.addTransactionPtr, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  DateTime _dateVal = DateTime(0);

  void onSubmittedCallBack() {
    final costVal = costController.text;
    final titleVal = titleController.text;

    if (titleVal.isEmpty || costVal.isEmpty || double.parse(costVal) <= 0) {
      return;
    }

    if (_dateVal.year == 0) {
      widget.addTransactionPtr(double.parse(costVal), titleVal, DateTime.now());
    } else {
      widget.addTransactionPtr(double.parse(costVal), titleVal, _dateVal);
    }

    Navigator.of(context).pop();
  }

  void datePickingButton() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2016),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateVal = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle:
                        TextStyle(color: Theme.of(context).primaryColorDark)),
                controller: titleController,
                onSubmitted: (_) => onSubmittedCallBack(),
              ),
              SizedBox(height: 5.0),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle:
                        TextStyle(color: Theme.of(context).primaryColorDark)),
                controller: costController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => onSubmittedCallBack(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6.0, 5.0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dateVal.year == 0
                          ? Text(
                              'Date of Transaction',
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 16,
                              ),
                            )
                          : Text(DateFormat.yMMMEd()
                              .format(_dateVal)), //Text('Date of Transaction')
                      TextButton(
                          onPressed: datePickingButton,
                          child: const Text(
                            'Select',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 16),
                          )),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: onSubmittedCallBack,
                    child: const Text(
                      'Submit Transaction',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold
                          //fontSize: 18,
                          ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
