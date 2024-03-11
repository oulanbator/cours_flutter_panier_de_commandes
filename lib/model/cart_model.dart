import 'package:cours_flutter_panier_de_commandes/model/cart_item.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // Notifie les écouteurs qu'un élément a été ajouté
  }

  removeItemAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners(); // Notifie les écouteurs après la suppression d'un élément par son indice
    }
  }

  double getTotal() {
    double total = 0;

    for (var item in _items) {
      total += item.price;
    }

    return total;
  }
}
