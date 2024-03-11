# TP : State Management

Un TP pour voir différents concepts clés dans Flutter :
- La création de composants stateful
- L'implémentation de la librairie Provider au sein du projet
- La gestion du state à travers plusieurs écrans

Les répertoires spécifiques aux plateformes ont été supprimés pour garder le repo clean.
Vous pouvez le retrouver avec l'une des commandes suivantes dans le répertoire du projet :
> flutter create --platforms=windows .

> flutter create --platforms=linux .

> flutter create --platforms=macos .

> flutter create --platforms=android .

Ou plusieurs plateformes simultanément :
> flutter create --platforms=windows,android .

## Copier le projet
```
git clone https://github.com/oulanbator/cours_flutter_panier_de_commandes.git
cd ./cours_flutter_panier_de_commandes
flutter create --platforms=windows .
```

## Exercice 1 - Afficher la liste de produits
- Créer une classe Product avec deux propriétés : name (String) et price (double)
- Créer une liste de Products "en dur" dans votre Widget Home

```
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
```

- Implémenter un ListView dans le widget Home.
- Plutôt que de générer des ListTile directement, le ListView va générer des ProductTile (que vous devez implémenter)
- ProductTile doit être stateful pour pouvoir suivre le state du compteur affiché sur la tuile
- Utiliser un IconButton pour le **leading** du ListTile
- Utiliser un SizedBox (width: 100) pour le **trailing** du ListTile. Vous pouvez alors encapsuler un Row à l'intérieur pour afficher le compteur et le bouton "Panier" côte à côte, sans avoir d'erreur de layout.

## Exercice 2 - Ecran Panier (CartPage)

- Créer un Widget CartPage. Pour le momen il ne contient qu'un Scaffold avec un Container
- Dans l'AppBar de la page Home, ajouter un IconButton pour le panier grâce à la propriété **actions**
- Mettre en place la navigation vers le widget CartPage

## Exercice 3 - Mettre en place le state management

> https://pub.dev/packages/provider

- Installer le package provider. Dans le répertoire du projet, exécuter :
```
flutter pub add provider
```

- Il est probablement utile de créer une classe CartItem. Puisque nous avons la possibilité de changer la quantité d'un produit avant de le rajouter au Panier, un CartItem doit permettre de faire référence au produit (soit le stocker, soit en hériter), possède un champ quantity, et peut également stocker le prix final (prix unitaire * quantité)
- Créer un CartModel. Ce doit être un ChangerNotifier.
- CartModel stocke une liste de CartItem (le contenu du panier) que l'on veut rendre disponible au sein de notre application. Il possède également une méthode pour ajouter et supprimer des produits du panier
- Modifier main.dart et utiliser ChangeNotifierProvider pour partager le State de CartModel au sein de notre application
- Modifier ProductTile pour pouvoir ajouter un item au panier lorsqu'on appuie sur "l'icône panier" (vous aurez besoin de récupérer une référence au CartModel avec Consumer ou Provider.of)
- Modifier le widget CartPage pour afficher la liste des items dans le panier (vous aurez besoin de récupérer une référence au CartModel avec Consumer ou Provider.of)
- Ajouter un IconButton sur les items du panier pour pouvoir les supprimer

## Exercice 4 - Total du Panier
- Ajouter un champ Total au panier 
- Le total doit se mettre à jour en fonction des items contenus dans le panier
