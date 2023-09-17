import 'package:flutter/material.dart';

class DietModels {
  var boxColor;
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.boxColor,
  });
  static List<DietModels> getDiet() {
    List<DietModels> Diets = [];
    Diets.add(
      DietModels(
          boxColor: Color(0xff9DCEFF),
          name: "Honey Pancake",
          iconPath: "assets/icons/honey-pancakes.svg",
          level: "Easy",
          duration: "30mins",
          calorie: "180kcal",
          viewIsSelected: true),
    );
    Diets.add(DietModels(
      boxColor: Color(0xffEEA4CE),
      name: 'Canai Bread',
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230kCal',
      viewIsSelected: false,
    ));
    Diets.add(DietModels(
      boxColor: Color(0xffEEA4CE),
      name: 'Canai Smoothies',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230kCal',
      viewIsSelected: true,
    ));

    return Diets;
  }
}
