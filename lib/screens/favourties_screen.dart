import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet - start adding some!!"),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealItems(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              affordability: favouriteMeals[index].affordability,
              duration: favouriteMeals[index].duration,
              complexity: favouriteMeals[index].complexity,
            );
          });
    }
  }
}
