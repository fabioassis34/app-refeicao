import 'package:flutter/material.dart';
import 'package:refeicao/screens/categories_meals_screen.dart';
import 'package:refeicao/screens/meal_datail_screen.dart';
import 'package:refeicao/screens/tabs_screen.dart';
import 'package:refeicao/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        AppRoutes.home: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
