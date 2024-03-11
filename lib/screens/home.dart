import 'package:cours_flutter_panier_de_commandes/model/product.dart';
import 'package:cours_flutter_panier_de_commandes/screens/cart_page.dart';
import 'package:cours_flutter_panier_de_commandes/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Product> products = [
    Product(name: "Pommes", price: 1.8),
    Product(name: "Poires", price: 2),
    Product(name: "Bananes", price: 1.2),
    Product(name: "Ananas", price: 2.5),
    Product(name: "Pêches", price: 1.8),
    Product(name: "Tomates", price: 0.5),
    Product(name: "Salade", price: 0.5),
    Product(name: "Carottes", price: 0.6),
    Product(name: "Concombre", price: 0.9),
    Product(name: "Choux", price: 1.2),
    Product(name: "Endives", price: 1.3),
    Product(name: "Courgettes", price: 0.75),
    Product(name: "Potiron", price: 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Produits"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            ),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ProductTile(product: products[index]),
      ),
    );
  }
}
