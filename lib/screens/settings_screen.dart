// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:refeicao/components/main_drawer.dart';
import 'package:refeicao/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  var settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
            _createSwitch(
              'Sem Glúten',
              'Só exibe refeições sem glúten',
              settings.isGlutenFree,
              (value) => setState(() => settings.isGlutenFree = value),
            ),
            _createSwitch(
              'Sem Lactose',
              'Só exibe refeições sem lactose',
              settings.isLactoseFree,
              (value) => setState(() => settings.isLactoseFree = value),
            ),
            _createSwitch(
              'Vegana',
              'Só exibe refeições veganas',
              settings.isVegan,
              (value) => setState(() => settings.isVegan = value),
            ),
            _createSwitch(
              'Vegetariana',
              'Só exibe refeições vegetarianas',
              settings.isVegetarian,
              (value) => setState(() => settings.isVegetarian = value),
            ),
          ],
        ));
  }
}
