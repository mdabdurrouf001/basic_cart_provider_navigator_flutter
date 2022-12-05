import 'dart:js';

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

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: const Text(
              'Item List',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(itemList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      var operations = context.read<Operations>();
                      operations.addItem(itemList[index]);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: const Text(
              'Cart List',
              style: TextStyle(fontSize: 35),
            ),
          ),

          //
          //

          Expanded(
              child: Consumer<Operations>(
            builder: ((context, value, child) => ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(cartList[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          var operations = context.read<Operations>();
                          operations.removeItem(cartList[index]);
                        },
                      ),
                    );
                  },
                )),
          )),
        ],
      ),
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
