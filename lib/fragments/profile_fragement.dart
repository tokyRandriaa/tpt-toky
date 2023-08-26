import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../login_screen.dart';

class ProfileFragment extends StatefulWidget {
  final int userId;

  ProfileFragment({required this.userId});

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }


  Future<void> logout() async {
    // Vous pouvez implémenter le code de déconnexion ici
    // Par exemple, supprimer les données d'authentification, vider le cache, etc.

    // Après la déconnexion, vous pouvez naviguer vers l'écran de connexion
   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),// Remplacez '/login' par la route de votre écran de connexion
   );
  }


  Future<void> fetchUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.220.48/art/get_user.php?id=1'),
      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        setState(() {
          userName = userData['nom'];
          userEmail = userData['email'];
        });
      } else {
        throw Exception('Erreur lors de la récupération du profil utilisateur');
      }
    } catch (e) {
      print('Erreur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Mombamomba', style: TextStyle(color: Colors.black),),
      ),
      body: 
      Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              // backgroundImage: NetworkImage('url_de_l_image'),
            ),
            SizedBox(height: 20),
            Text(
              'Nom: $userName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('E-mail: $userEmail'),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: logout, // Utilisez la fonction de déconnexion
              child: Text('Se déconnecter'),
            ),
          ],
        ),
      ),
      )
      
    );
  }
}
