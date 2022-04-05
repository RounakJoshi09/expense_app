import 'dart:ui';
import './transaction.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  List<Transaction> transaction = [
    Transaction(
        id: 't1', amount: 99.25, date: DateTime.now(), title: 'Groceries'),
    Transaction(id: 't2', amount: 98, date: DateTime.now(), title: 'Books'),
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 48.0,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'Chart:)',
                  style: TextStyle(color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Add Transaction'),
                      textColor: Colors.amberAccent.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Column(
                //Here we are creating a coloumn on main coloumn for transaction
                children: transaction.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                      width: 100,
                      margin: EdgeInsets.only(
                          left: 15.0, right: 20.0, top: 15, bottom: 15),
                      child: Text(
                        '\$ ${tx.amount}',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 3,
                        ),
                      ),
                      padding:
                          // EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                          EdgeInsets.symmetric(horizontal: 5, vertical: 5)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          tx.title,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold,
                              fontFeatures: [FontFeature.alternative(2)]),
                        ),
                      ),
                      Container(
                        child: Text(
                          tx.date.toString().substring(0, 11),
                          style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  )
                ],
              ));
            }).toList())
          ],
        ));
    ;
  }
}
