import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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

  void onSubmittedCallBack() {
    final costVal = costController.text;
    final titleVal = titleController.text;

    if (titleVal.isEmpty || costVal.isEmpty || double.parse(costVal) <= 0) {
      return;
    }

    widget.addTransactionPtr(double.parse(costVal), titleVal);

    Navigator.of(context).pop();
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
              TextButton(
                  onPressed: onSubmittedCallBack,
                  child: Text(
                    'Submit Transaction',
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
