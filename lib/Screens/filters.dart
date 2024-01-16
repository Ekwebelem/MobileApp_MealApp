import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meals/Screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,

// }

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen ({
    super.key,
   // required this.currentFilters,
     });

 // final Map<Filter, bool> currentFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFilters = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
  //    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
  //     _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
  //      _veganFilterSet = activeFilters[Filter.vegan]!;
  // }

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
   return Scaffold(
    appBar: AppBar(
      title: const Text('Your Filters'),
    ),
    // drawer: MainDrawer(onSelectScreen: (identifier) {
    //      Navigator.of(context).pop();
    //      if (identifier == 'meals') {
    //          Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(
    //             builder: (ctx) => const TabsScreen(),),);
    //      }
    // },),
    body: 
      // WillPopScope(
      // onWillPop: () async {
      //   ref.read(filtersProvider.notifier).setFilters({
      //     Filter.glutenFree: _glutenFreeFilterSet,
      //     Filter.lactoseFree: _lactoseFreeFilterSet,
      //     Filter.vegetarian: _vegetarianFilterSet,
      //     Filter.vegan: _veganFilterSet,
      //   });
      //  // Navigator.of(context).pop();
      //   return true;
      // },
      Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, 
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            }, 
            title: Text('Gluten-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only include gluten-free meals.', 
             style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
             SwitchListTile(
             value: activeFilters[Filter.vegetarian]!, 
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            }, 
            title: Text('Vegetarian-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only include vegetarian-free meals.', 
             style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
             value: activeFilters[Filter.lactoseFree]!, 
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            }, 
            title: Text('Lactose-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only include lactose-free meals.', 
             style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
             value: activeFilters[Filter.vegan]!, 
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            }, 
            title: Text('Vegan-free', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            subtitle: Text('Only include vegan-free meals.', 
             style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        ],
      ),
    
   );
  }
  }
