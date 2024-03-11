import 'package:cours_flutter_panier_de_commandes/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Panier"),
      ),
      // Le panier doit être mis à jour lorsque son contenu change, on utilise donc Consumer
      body: Consumer<CartModel>(
        builder: (context, cart, child) => ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            // Récupère l'item et retourne un ListTile
            var item = cart.items[index];
            return ListTile(
              title: Text('${item.quantity} ${item.product.name}'),
              subtitle: Text('${item.price} €'),
              trailing: IconButton(
                onPressed: () => cart.removeItemAt(index),
                icon: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
