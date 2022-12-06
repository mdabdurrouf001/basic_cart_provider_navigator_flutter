import 'dart:js';

import 'package:basic_cart_provider_navigator_flutter/screen/cartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

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
            child: Text(
              'Item List',
              style: TextStyle(fontSize: 35),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    itemList[index],
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(fontSize: 15),
                    ),
                  ),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartList()));
        },
        child: Icon(Icons.shopping_cart_checkout_outlined),
      ),
    );
  }
}
