import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, time;
  final String complexity, title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {required this.id,
      required this.time,
      required this.complexity,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color});
}

List<RecipeBundle> recipeBundles = [
  RecipeBundle(
      id: 1,
      time: 25,
      complexity: "Zelo lahko",
      title: "Pasta",
      description: "Tvoja mama",
      imageSrc: "assets/images/pasta.jpg",
      color: Colors.green),
  RecipeBundle(
      id: 2,
      time: 25,
      complexity: "Zelo zahtevno",
      title: "Naslov",
      description: "Podnaslov",
      imageSrc: "assets/images/pasta.jpg",
      color: Colors.blue),
  RecipeBundle(
      id: 3,
      time: 25,
      complexity: "Lahko",
      title: "Naslov",
      description: "Lorem ipsum",
      imageSrc: "assets/images/pasta.jpg",
      color: Colors.red),
  RecipeBundle(
      id: 4,
      time: 25,
      complexity: "Srednje",
      title: "Naslov",
      description: "Lorem ipsum",
      imageSrc: "assets/images/pasta.jpg",
      color: Colors.orange),
];
