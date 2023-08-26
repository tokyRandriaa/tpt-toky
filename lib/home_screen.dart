import 'package:art/fragments/profile_fragement.dart';
import 'package:flutter/material.dart';

import 'fragments/diamond_fragment.dart';
import 'fragments/home_fragment.dart'; // Utilisation d'un alias 'details'

import 'fragments/hosodoko_fragment.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;// Liste pour stocker les articles ajoutés au panier
  int userId = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _fragments = [
      HomeFragment(),
      DiamondFragment(),
      HosodokoFragment(), // Passer la liste des articles ajoutés au panier
    ProfileFragment(userId: userId)
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
  
      body: _fragments[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Filan-kevitra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.diamond, color: Colors.black,),
            label: 'Vato',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette, color: Colors.black,),
            label: 'Hosodoko',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
            label: 'Mombamomba',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 89, 92, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}


