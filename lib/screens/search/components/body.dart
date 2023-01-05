import 'dart:ui';

import 'package:easy2cook/constants.dart';
import 'package:easy2cook/screens/search/components/ingredient_box.dart';
import 'package:easy2cook/models/IngredientsBundle.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:easy2cook/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:easy2cook/services/database.dart';

import '../../wrapper.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    List<IngredientsBundle> ingredients =
        Provider.of<List<IngredientsBundle>>(context);
    final cat = Provider.of<MyChangeNotifier>(context);
    String searchValue = "";
    List<String> avalibleIngredients = [];
    try {
      avalibleIngredients =
          (ingredients.map((ingredients) => ingredients.name)).toList();
    } catch (e) {}
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> chosenIngredients = [];
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Form(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Container(
                    width: screenWidth * 0.75,
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return avalibleIngredients.where((String option) {
                          searchValue = textEditingValue.text.toString();
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        debugPrint('You just selected $selection');
                      },
                    )),
                Container(
                  child: ElevatedButton(
                    child: Icon(Icons.add, color: Colors.black),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), padding: EdgeInsets.all(10)),
                    onPressed: () {
                      if (avalibleIngredients.contains(searchValue)) {
                        for (int i = 0; i < avalibleIngredients.length; i++) {
                          if (avalibleIngredients[i].toLowerCase() ==
                                  searchValue.toLowerCase() &&
                              !chosenIngredients
                                  .contains(avalibleIngredients[i])) {
                            chosenIngredients.add(avalibleIngredients[i]);
                          }
                        }
                        print(chosenIngredients.toString());
                      }
                    },
                  ),
                ),
              ]))),
    );
  }
}
