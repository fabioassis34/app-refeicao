// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:refeicao/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _createItem(IconData icon, String label, String route) {
      return Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          onTap: () => Navigator.of(context).pushReplacementNamed(route),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            color: Theme.of(context).colorScheme.tertiary,
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Vamos cozinhar',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 20,
            thickness: 0.1,
          ),
          _createItem(
              Icons.restaurant_menu_outlined, 'Refeições', AppRoutes.home),
          _createItem(
              Icons.settings, 'Configurações', AppRoutes.settingsScreen),
        ],
      ),
    );
  }
}
