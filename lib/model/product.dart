class Product {
  final String image;
  final String name;
  final String type;
  final double stars;
  final double price;
  final String description;

  Product(this.image, this.name, this.type, this.stars, this.price, this.description);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['images'],
      json['nom'],
      json['type'],
      double.parse(json['etoile']),
      double.parse(json['prix']),
      json['description'], 
    );
  }
}
