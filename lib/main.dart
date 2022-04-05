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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
                //Here we are creating a coloumn on main coloumn for transaction
                children: transaction.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Text(tx.amount.toString()),
                  Column(
                    children: [
                      Text(tx.title),
                      Text(tx.date.toString()),
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
