import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewProductsWidget extends StatefulWidget {
  @override
  _NewProductsWidgetState createState() => _NewProductsWidgetState();
}

class _NewProductsWidgetState extends State<NewProductsWidget> {
  List<Product> newProducts = [];

  @override
  void initState() {
    super.initState();
    fetchNewProducts();
  }

  Future<void> fetchNewProducts() async {
    final response = await http.get(Uri.parse('https://192.168.220.48/art/get_products.php')); // Remplacez par votre URL de l'API

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        newProducts = responseData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to fetch new products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newProducts.length,
        itemBuilder: (context, index) {
          final product = newProducts[index];
          return NewProductCard(product);
        },
      ),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String type;
  final double stars;
  final double price;

  Product(this.image, this.name, this.type, this.stars, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['images'],
      json['nom'],
      json['type'],
      double.parse(json['etoile']),
      double.parse(json['prix']),
    );
  }
}

class NewProductCard extends StatelessWidget {
  final Product product;

  NewProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'http://192.168.220.48/art/stockage/images/${product.image}.jpg';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 120,
              width: 200, // Hauteur souhaitée
              fit: BoxFit.cover, // Remplissage en mode "cover"
            ),
            SizedBox(height: 10),
            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(product.type),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4),
                Text('${product.stars}'),
              ],
            ),
            Text('\$${product.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
