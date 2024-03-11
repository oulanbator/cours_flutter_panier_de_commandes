import 'package:cours_flutter_panier_de_commandes/model/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  int quantity = 0;

  _handleRaiseQuantity() {
    setState(() {
      quantity += 1;
    });
  }

  _handleAddToCart() {
    setState(() {
      quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text("Prix unit. : ${widget.product.price}"),
      leading: IconButton(
        onPressed: () => _handleRaiseQuantity(),
        icon: const Icon(Icons.add),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: () => _handleAddToCart(),
              icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
      ),
    );
  }
}
