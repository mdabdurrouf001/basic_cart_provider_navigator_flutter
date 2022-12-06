import 'dart:js';

import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:basic_cart_provider_navigator_flutter/screen/itemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> itemList = [
  "Ball Cactus",
  "Aloe Vera",
  "Panda Plant",
  "Money Plant",
  "Dolphin Succulent",
  "Bunny Ears Cactus",
  "Pothos",
  "Monstera",
  "Lucky Bamboo",
  "Spider Plant",
  "Snake Plant",
  "Olivia",
  "Christmas Cactus",
  "Panda Plant",
  "Easter Cactus",
  "Old Lady Cactus",
  "Star Cactus"
];

List<String> cartList = [];

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
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
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
