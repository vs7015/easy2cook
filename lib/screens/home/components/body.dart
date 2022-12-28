import 'package:easy2cook/constants.dart';
import 'package:easy2cook/models/RecipeBundle.dart';
import 'package:flutter/material.dart';
import 'package:easy2cook/size_config.dart';
import 'package:easy2cook/screens/home/components/categories.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy2cook/screens/home/components/recipe_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          // Search
          //RecipeCard(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  // crossAxisSpacing: SizeConfig.defaultSize,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeCard(
                  recipeBundle: recipeBundles[index],
                  press: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
