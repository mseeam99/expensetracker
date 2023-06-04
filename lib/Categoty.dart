import 'package:flutter/material.dart';

enum Category {
  FOOD,
  SHOPPING,
  TRANSPORTATION,
  UNIVERSITY,
  HEALTH,
  HOME,
  FUN,
  OTHERS,
}

const categoryIcons = {
  Category.FOOD: Icons.dinner_dining,
  Category.SHOPPING: Icons.shopping_bag,
  Category.TRANSPORTATION: Icons.emoji_transportation,
  Category.UNIVERSITY: Icons.school_outlined,
  Category.HEALTH: Icons.health_and_safety_outlined,
  Category.HOME: Icons.home,
  Category.FUN: Icons.liquor_outlined,
  Category.OTHERS: Icons.attach_money,
};
