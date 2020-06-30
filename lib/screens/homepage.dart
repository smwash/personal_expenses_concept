import 'package:flutter/material.dart';
import 'package:transaction_app/widgets/transactio_list.dart';
import '../model/transcation.dart';
import '../widgets/transactionField.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 'C1', amount: 500, title: 'New shoes', date: DateTime.now()),
    // Transaction(id: 'C2', amount: 500, title: 'Buy Milk', date: DateTime.now()),
    // Transaction(
    //   id: 'C3',
    //   amount: 500,
    //   title: 'New Chair',
    //   date: DateTime.now(),
    // ),
  ];

  void _createUserTransaction(
      String txTitle, double amount, DateTime chosenDate) {
    final newtransaction = Transaction(
      amount: amount,
      title: txTitle,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newtransaction);
    });
  }

  void _showbottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return TransactionField(_createUserTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  bool _switchMode = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PERSONAL EXPENSES'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showbottomSheet(context),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.0),
              _switchMode
                  ? Text('NOthing to show')
                  : TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showbottomSheet(context),
        label: Text('Add Expenses'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
