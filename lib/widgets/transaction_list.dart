import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
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
                      ),
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
        }).toList()),
      ),
    );
  }
}
