import 'package:address_book_app/Homepage.dart';
import 'package:address_book_app/Logo.dart';
import 'package:address_book_app/datainput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: 'logo',
      routes: {
        'home':(context) => Homepage(),
        'input':(context) => DataInput(),
        '/':(context) => Logo(),
      },
    ),
  );
}
