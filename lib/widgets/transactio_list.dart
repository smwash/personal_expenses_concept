import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/model/transcation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: transactions.isEmpty
          ? Container(
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    'No transactions added yet.',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 50.0),
                  Image.asset(
                    'images/pngguru.com (1).png',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 10),
                                  blurRadius: 10.0,
                                  spreadRadius: -12),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              transactions[index].title,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            leading: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff000080),
                                ),
                              ),
                              child: Text(
                                'Ksh.${transactions[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000080),
                                ),
                              ),
                            ),
                            subtitle: Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }
}
