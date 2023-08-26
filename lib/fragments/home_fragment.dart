import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../details_screen.dart';
import '../model//product.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<Product> products = [];
  List<Product> newProducts = [];
  

  @override
  void initState() {
    super.initState();
    fetchProducts();
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

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://192.168.220.48/art/get_products.php')); // Remplacez par votre URL de l'API

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        products = responseData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to fetch products');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 190, 161),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 229, 120, 17),
        title: Text('Art malagasy', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      ),
      body: SingleChildScrollView(
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 244, 244, 244)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search,color: Colors.white,),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'Hikaroka ...', 
                              ),
                            ),
                          ),
                          Icon(Icons.shopping_cart,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Art malagasy rehetra',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 22, 200, 28)),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(product);
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Art vaovao',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 5, 224, 12)),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20),
              Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: newProducts.length,
        itemBuilder: (context, index) {
          final product = newProducts[index];
          return NewProductCard(product);
        },
      ),
    )
            ],
          ),
        ),
      ),
    );
  }
}





class NewProductCard extends StatelessWidget {
  final Product product;

  NewProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'http://192.168.220.48/art/stockage/images/${product.image}.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsArtScreen(product)),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 150,
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(height: 55),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text('${product.stars}'),
                    ],
                  ),
                  Text('${product.type}'),
                ],
              ),
              Spacer(),
              Image.network(
                imageUrl,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'http://192.168.220.48/art/stockage/images/${product.image}.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsArtScreen(product)),
        );
      },
      child :
     Card(
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
    ));
  }
}
