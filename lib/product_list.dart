import 'package:flutter/material.dart';
import 'item_model.dart';
import 'my_cart.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Item> myProducts = [
    Item('Apple', 230.00, 0),
    Item('Mango', 65.00, 0),
    Item('Banana', 80.00, 0),
    Item('Orange', 250.00, 0),
    Item('Egg', 11.00, 0),
    Item('Olive Oil', 300.00, 0),
    Item('Pasta', 120.00, 0),
    Item('Chicken', 210.00, 0),
    Item('Bread', 50.00, 0),
    Item('Light', 560.00, 0),
    Item('Fan', 2500.00, 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),

      /// FAB button
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            int totalQuantity = 0;
            for (var product in myProducts) {
              totalQuantity += product.quantity;
            }

// Navigate to cart page
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(
                          quantity: totalQuantity,
                        )));
          }),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(myProducts[index].productName),
            subtitle: Text('BDT: ${myProducts[index].productPrice}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text('Counter: ${myProducts[index].quantity}')),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        myProducts[index].quantity++;
                        setState(() {});
                        if (myProducts[index].quantity == 5) {
                          _showMyDialog(context, myProducts[index].productName);
                        }
                      },
                      child: const Text('Buy')),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

// show alert dialog
void _showMyDialog(context, productName) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: Text('You have bought 5 $productName'),
          actions: [
            IconButton(
                onPressed: () {
                  /// close the dialog
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close))
          ],
        );
      });
}
