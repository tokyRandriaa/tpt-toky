import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nomController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController prixController = TextEditingController();
  TextEditingController etoileController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Future<void> _insertProduct() async {
    final url = 'https://192.168.220.48/art/insert_product.php'; // Remplacez par votre URL d'insertion
    final response = await http.post(
      Uri.parse(url),
      body: {
        'nom': nomController.text,
        'type': typeController.text,
        'prix': prixController.text,
        'etoile': etoileController.text,
        'description': descriptionController.text,
        'image': imageController.text,
      },
    );

    if (response.statusCode == 200 && response.body == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produit inséré avec succès')),
      );
      // Effacez les champs après l'insertion réussie si nécessaire
      nomController.clear();
      typeController.clear();
      prixController.clear();
      etoileController.clear();
      descriptionController.clear();
      imageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'insertion')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: nomController, decoration: InputDecoration(labelText: 'Nom')),
            TextField(controller: typeController, decoration: InputDecoration(labelText: 'Type')),
            TextField(controller: prixController, decoration: InputDecoration(labelText: 'Prix')),
            TextField(controller: etoileController, decoration: InputDecoration(labelText: 'Étoile')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            TextField(controller: imageController, decoration: InputDecoration(labelText: 'Image URL')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _insertProduct, child: Text('Insérer Produit')),
          ],
        ),
      ),
    );
  }
}
