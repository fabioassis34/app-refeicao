import 'package:flutter/material.dart';
import 'package:refeicao/components/meal_icon.dart';
import 'package:refeicao/utils/app_routes.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key? key, required this.meal}) : super(key: key);

  _selecetMeal(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.mealDetail, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selecetMeal(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealIcon(
                      text: '${meal.duration} min', icon: Icons.access_time),
                  MealIcon(text: meal.complexityText, icon: Icons.work_outline),
                  MealIcon(
                      text: meal.costText, icon: Icons.attach_money_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
