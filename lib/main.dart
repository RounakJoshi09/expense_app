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
                  Container(
                    width: 77,
                    margin: EdgeInsets.only(
                        left: 15.0, right: 80.0, top: 15, bottom: 15),
                    child: Text(
                      tx.amount.toString(),
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
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  ),
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
