import 'package:flutter/material.dart';
import '../model//product.dart';

class DetailsArtScreen extends StatefulWidget {
  final Product product;

  DetailsArtScreen(this.product);

  @override
  _DetailsArtScreenState createState() => _DetailsArtScreenState();
}

class _DetailsArtScreenState extends State<DetailsArtScreen> {
  int quantity = 1;
  bool isFavorite = false; 
  List<Product> favoriteProducts = []; // Liste des produits favoris

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        favoriteProducts.add(widget.product); // Ajoute le produit à la liste des favoris
      } else {
        favoriteProducts.remove(widget.product); // Retire le produit de la liste des favoris
      }
    });
  }// État pour gérer l'état de la favori

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.product.price * quantity;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Retour à l'écran précédent
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack( // Utilisation de Stack pour superposer l'icône Favorite
                    children: [
                      Image.network(
                        'http://192.168.220.48/art/stockage/images/${widget.product.image}.jpg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(widget.product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Type: ${widget.product.type}'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text('${widget.product.stars}'),
                    ],
                  ),
                  Text('MGA ${widget.product.price.toStringAsFixed(2)}'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            }
                          });
                        },
                      ),
                      Text(quantity.toString()), // Affiche la quantité sélectionnée
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.product.description),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Ajoutez ici la logique pour ajouter au panier
                    },
                    child: Text('Payer - \$${totalPrice.toStringAsFixed(2)}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
