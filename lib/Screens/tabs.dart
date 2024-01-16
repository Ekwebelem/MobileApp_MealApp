import 'package:flutter/material.dart';
import 'package:meals/Screens/categories.dart';
import 'package:meals/Screens/meals.dart';
//import 'package:meals/data/dummy_data.dart';
//import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/Screens/filters.dart';
//import 'package:meals/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen ({super.key,});


  @override
  ConsumerState<TabsScreen> createState() {
   return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  
  //final List<Meal> _favoriteMeals = []; //edded as favorite

 //  Map<Filter, bool> _selectedFilters = kInitialFilters;



  //info message once you update a meal 
  // void _showInfoMessage(String message) {
    

  // }

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //        _favoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage('Meal is no longer a favorite.');
     
  //     } 
  //   else {
  //     setState(() {
  //        _favoriteMeals.add(meal);
  //     });
  //   _showInfoMessage('Marked as a favorite.');
  //     }
  // }
  ///ends here

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //Drawer page button 
  void _setScreen(String identifier) async {
     Navigator.of(context).pop();
    if (identifier == 'filters') {       
        //final result = 
        await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  const FiltersScreen(),
       //     currentFilters: _selectedFilters,
        ),
          );

          // setState(() {
          //    _selectedFilters = result ?? kInitialFilters;
          // });
     
    } 
  }

@override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

Widget activePage =  CategoriesScreen(
  // onToggleFavorite: _toggleMealFavoriteStatus,
  availableMeals: availableMeals,
  );
var activePageTitle = "Categories";

if (_selectedPageIndex == 1) {
  final favoriteMeals = ref.watch(favoriteMealsProvider);
  activePage =  MealsScreen(
    meals: favoriteMeals, 
    //onToggleFavorite: _toggleMealFavoriteStatus,
    );
  activePageTitle = 'Your Favorites';
}


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:  MainDrawer( onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap:  _selectedPage,
        currentIndex: _selectedPageIndex,  // highlighted page 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label:'Categories' ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites' ),
          ],
      ),
    );
  }
}