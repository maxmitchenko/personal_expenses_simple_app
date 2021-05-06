import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  static const double _AMOUNT_HEIGHT = 20;
  static const double _PERCENT_COLUMN_HEIGHT = 60;
  static const double _PERCENT_COLUMN_WIDTH = 10;
  static final BoxDecoration _notSpendedDecoration = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 1.0),
    color: Color.fromRGBO(220, 220, 220, 1),
    borderRadius: BorderRadius.circular(10),
  );

  ChartBar({this.label, this.spendingAmount, this.spendingPctOfTotal})
      : assert(label != null &&
            spendingAmount != null &&
            spendingPctOfTotal != null);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration spendedDecoration = BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
    );
    return Column(
      children: <Widget>[
        Container(
          height: _AMOUNT_HEIGHT,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: _PERCENT_COLUMN_HEIGHT,
          width: _PERCENT_COLUMN_WIDTH,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: _notSpendedDecoration,
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: spendedDecoration,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
