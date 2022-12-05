import 'dart:js';

import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> itemList = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten",
];

List<String> cartList = [
  "One",
];

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Operations(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemList(),
    );
  }
}

class Operations with ChangeNotifier {
  String item = '';

  void addItem(String item) {
    cartList.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    cartList.remove(item);
    notifyListeners();
  }
}
