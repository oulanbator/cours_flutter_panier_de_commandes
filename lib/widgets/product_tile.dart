import 'package:cours_flutter_panier_de_commandes/model/cart_item.dart';
import 'package:cours_flutter_panier_de_commandes/model/cart_model.dart';
import 'package:cours_flutter_panier_de_commandes/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    if (quantity > 0) {
      // Crée un CartItem
      var item = CartItem(
        product: widget.product,
        quantity: quantity,
        price: widget.product.price * quantity,
      );
      // Ajoute l'item au panier
      // On n'a pas besoin d'être notifié si le panier change, on utilise donc Provider.of pour récupérer une référence à notre CartModel
      var cartModel = Provider.of<CartModel>(context, listen: false);
      cartModel.addItem(item);
      // Remet le compteur à 0
      setState(() {
        quantity = 0;
      });
    }
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
