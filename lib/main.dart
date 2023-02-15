// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:refeicao/data.dart/dummy_data.dart';
import 'package:refeicao/models/meal.dart';
import 'package:refeicao/models/settings.dart';
import 'package:refeicao/screens/categories_meals_screen.dart';
import 'package:refeicao/screens/meal_datail_screen.dart';
import 'package:refeicao/screens/settings_screen.dart';
import 'package:refeicao/screens/tabs_screen.dart';
import 'package:refeicao/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      print('antes $dummyMeals');
      _availableMeals = dummyMeals.where((meal) {
        print('depois ${meal.title}');
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Refeições',
      theme: ThemeData(
          fontFamily: 'Merriweather',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: const TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              )),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.cyan,
          ).copyWith(
            secondary: Colors.amber,
            tertiary: Colors.grey,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetail: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settingsScreen: (ctx) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
    );
  }
}
