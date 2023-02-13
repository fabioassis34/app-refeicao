import 'package:flutter/material.dart';

class MealIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const MealIcon({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(text)
      ],
    );
  }
}
