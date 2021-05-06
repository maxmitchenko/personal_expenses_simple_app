import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_test_app/utils/strings.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  static const double _HEIGHT = 450;
  static const double _IMAGE_HEIGHT = 200;
  static const double _ELEVATION = 5;
  static const double _RADIUS = 30;

  static const EdgeInsets _MARGIN = EdgeInsets.symmetric(
    vertical: 8,
    horizontal: 5,
  );

  TransactionList({@required this.transactions, @required this.deleteTx})
      : assert(transactions != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _HEIGHT,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  Strings.noTransactionText,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: _IMAGE_HEIGHT,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return Card(
                  elevation: _ELEVATION,
                  margin: _MARGIN,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: _RADIUS,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
