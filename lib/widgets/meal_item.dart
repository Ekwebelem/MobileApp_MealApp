import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({
    super.key, 
    required this.meal,
    required this.onSelectMeal,
    
    });

final Meal meal;
final void Function( Meal meal) onSelectMeal;

 //transforming first letter to uppercase
String get complexityText {
  return meal.complexity.name[0].toUpperCase() + 
  meal.complexity.name.substring(1) ; // 'Hello' + 'word' = 'Helloword'
}

String get affordabilityText {
  return meal.affordability.name[0].toUpperCase() +
   meal.affordability.name.substring(1) ; // 'Hello' + 'word' = 'Helloword'
}

  @override
  Widget build(BuildContext context) {
    return Card( 
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(8)),
      clipBehavior: Clip.hardEdge, // to force images into shape 
       elevation: 2,   // to add some slight drop shadow behind the Card to give it 3d effect
      child: InkWell(
      onTap: () {
        onSelectMeal(meal);
      },
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // to make sure the image isnt distorted but to zoom in and fit
              height: 200,
              width: double.infinity,
              ),
          ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(meal.title, maxLines: 2, 
                    textAlign: TextAlign.center,
                    softWrap: true, // to make sure that the text is wrapped in a good looking way
                    overflow: TextOverflow.ellipsis, // very long text ...
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // to centre the row
                      children: [
                          MealItemTrait(
                            icon: Icons.schedule, 
                            label: '${meal.duration} min   '
                            ),
                            const SizedBox(height: 12,),
                            MealItemTrait(
                            icon: Icons.work, 
                            label: complexityText
                            ),
                            const SizedBox(height: 12,),
                            MealItemTrait(
                            icon: Icons.attach_money, 
                            label: affordabilityText
                            ),
                      ],
                    )
                  ],
                ),

              )),
        ],
      ),
    ),
    );
  }
}