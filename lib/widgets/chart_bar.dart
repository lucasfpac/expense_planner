import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.12, // size of the amount
              child: FittedBox(
                child: Text('€${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight *
                  0.05, // distance between amount and bars
            ),
            SizedBox(
              height: constraints.maxHeight * 0.4, // hight of the bars
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.4, // hight of the bars
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 10, 10, 10),
                          width: 1.0),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight *
                  0.05, // distance between bar and initials
            ),
            Container(
              height: constraints.maxHeight * 0.12, // days initials M,T,W...
              child: FittedBox(
                child: Text(label),
              ),
            )
          ],
        );
      },
    );
  }
}
