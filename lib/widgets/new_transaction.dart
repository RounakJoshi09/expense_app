import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);
  void submitAction() {
    final enterTitle = titleController.text;
    final enterAmount = amountController.text;
    if (enterTitle == null || double.parse(enterAmount) <= 0) return;

    addTx(enterTitle, double.parse(enterAmount));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitAction,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitAction,
            ),
            FlatButton(
              onPressed: submitAction,
              child: Text('Add Transaction'),
              textColor: Colors.amberAccent.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
