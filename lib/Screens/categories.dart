// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
//import 'package:meals/Screens/tabs.dart';

class CategoriesScreen extends StatefulWidget{
   const CategoriesScreen ({
    super.key, 
   // required this.onToggleFavorite,
    required this.availableMeals,
    });

    // final void Function(Meal meal) onToggleFavorite;
    final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
late AnimationController _animationController;

@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      
      );
      _animationController.forward();
  }

  @override
  void dispose() {
   _animationController.dispose();
    super.dispose();
  }

   //adding a method to a stateless widget
   void _selectCategory (BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where((meal) => 
    meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) =>  MealsScreen(
        title: category.title, 
        meals: filteredMeals,
        // onToggleFavorite: onToggleFavorite,
        )
        ,       )
        ); //or Navigator.push(context, route)
   }

@override
  Widget build(BuildContext context) {
   return  AnimatedBuilder(
    animation: _animationController, 
    child: GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // two grid side by side
         childAspectRatio: 3/2,  // sizing of the gridviw items 3/2 or 1.5
         crossAxisSpacing: 20, // spacing between grid horizontally
         mainAxisSpacing: 20, // spacing between grid vertically
          ),
      children: [
        // alternative : availableCategories.map((category) =>  CategoryGridItem(category: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(category: category, onSelectCategory: () {
            _selectCategory(context, category);
          },)
      ],
      
   ), 
   builder: (context, child) => SlideTransition(
    position: Tween(
      begin: const Offset(0, 0.3),
      end: const  Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Curves.easeInOut)
      ),
   
   child: child,)
   ); 
  }
}