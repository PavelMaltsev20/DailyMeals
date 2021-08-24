import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet- start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var itemMeal = favoriteMeals[index];

          return MealItem(
            id: itemMeal.id,
            title: itemMeal.title,
            imageUrl: itemMeal.imageUrl,
            duration: itemMeal.duration,
            complexity: itemMeal.complexity,
            affordability: itemMeal.affordability,
            removeItem: null,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
