import 'package:assignment_7/item_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Item> myProducts = [
    Item('Apple', 230.00, 0),
    Item('Mango', 230.00, 0),
    Item('Banana', 230.00, 0),
    Item('Orange', 230.00, 0),
    Item('Egg', 230.00, 0),
    Item('Olive Oil', 230.00, 0),
    Item('Pasta', 230.00, 0),
    Item('Chicken', 230.00, 0),
    Item('Bread', 230.00, 0),
    Item('Light', 230.00, 0),
    Item('Fan', 230.00, 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            var quantityOfItems = 0;
            for (var product in myProducts) {
              quantityOfItems += product.quantity;
            }

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyCart(
                          quantity: quantityOfItems,
                        )));
          }),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(myProducts[index].ItemName),
            subtitle: Text('BDT: ${myProducts[index].ItemPrise}'),
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Counter: ${myProducts[index].quantity}'),
                  ElevatedButton(
                      onPressed: () {
                        myProducts[index].quantity++;
                        setState(() {});
                      },
                      child: const Text('Buy'))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class MyCart extends StatelessWidget {
  MyCart({super.key, required this.quantity});
  int quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Center(
        child: Text('Total bought: $quantity'),
      ),
    );
  }
}
