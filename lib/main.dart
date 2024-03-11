import 'package:cours_flutter_panier_de_commandes/app.dart';
import 'package:cours_flutter_panier_de_commandes/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: const App(),
  ));
}
