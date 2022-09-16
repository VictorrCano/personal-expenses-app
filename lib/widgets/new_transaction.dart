import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransactionPtr;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  NewTransaction(this.addTransactionPtr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        color: Colors.purple[100],
        elevation: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: 'Name', hintStyle: TextStyle(color: Colors.grey)),
                controller: titleController,
              ),
              SizedBox(height: 5.0),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(color: Colors.grey)),
                controller: costController,
              ),
              TextButton(
                child: Text('Submit Transaction',
                    style: TextStyle(
                      color: Colors.purple,
                    )),
                onPressed: () => addTransactionPtr(
                    costController.text, titleController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
