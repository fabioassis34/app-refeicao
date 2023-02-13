// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:refeicao/screens/categories_screen.dart';
import 'package:refeicao/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de categorias',
      'screen': CategoriesScreen(),
    },
    {
      'title': 'Meus favoritos',
      'screen': FavoriteScreen(),
    },
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categorias',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favoritos',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
