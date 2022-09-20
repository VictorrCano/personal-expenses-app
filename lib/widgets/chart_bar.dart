import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingForDay;
  final double spendingPecentage;
  const ChartBar(this.spendingForDay, this.spendingPecentage, this.label,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(label),
      SizedBox(height: 5),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 3.0),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPecentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 5),
      Text(spendingForDay.toString()),
    ]);
  }
}
