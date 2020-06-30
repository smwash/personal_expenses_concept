import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class TransactionField extends StatefulWidget {
  final Function addtransaction;

  TransactionField(this.addtransaction);

  @override
  _TransactionFieldState createState() => _TransactionFieldState();
}

class _TransactionFieldState extends State<TransactionField> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredamount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtransaction(
      enteredtitle,
      enteredamount,
      _selectedDate,
    );
    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10.0,
            left: 14.0,
            right: 10.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 10.0,
                spreadRadius: -12),
          ],
        ),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Spending title'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: amountController,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.numberWithOptions(),
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Amount spent'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No Date Picked'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                        _selectedDate == null ? 'Choose date' : 'Change Date'),
                  ),
                  onTap: _presentDatePicker,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: submitData,
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
