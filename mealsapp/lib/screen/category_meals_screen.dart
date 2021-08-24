import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = List.empty();
  Color color = Colors.white;
  var _loadedData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      final id = routeArgs["id"] as String;

      color = routeArgs["color"] as Color;
      categoryTitle = routeArgs["title"] as String;
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(id))
          .toList();
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var itemMeal = displayedMeals[index];

          return MealItem(
            id: itemMeal.id,
            title: itemMeal.title,
            imageUrl: itemMeal.imageUrl,
            duration: itemMeal.duration,
            complexity: itemMeal.complexity,
            affordability: itemMeal.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
