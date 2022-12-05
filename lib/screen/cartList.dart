import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

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
