import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key key,
    @required List<Transaction> transactions,
  })  : _transactions = transactions,
        super(key: key);

  final List<Transaction> _transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, index) {
          final tr = _transactions[index];
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.lime,
                        // style: BorderStyle.solid,
                        width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$' + tr.value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.pinkAccent[200]),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(DateFormat('d MMM y').format(tr.date),
                      style: TextStyle(color: Colors.grey))
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
