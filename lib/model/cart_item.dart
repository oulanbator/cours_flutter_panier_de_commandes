import 'package:cours_flutter_panier_de_commandes/model/product.dart';

class CartItem {
  Product product;
  int quantity;
  double price;

  CartItem(
      {required this.product, required this.quantity, required this.price});
}
