import 'package:flutter/material.dart';
import 'package:refeicao/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color,
          ],
          begin: Alignment.topCenter,
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
