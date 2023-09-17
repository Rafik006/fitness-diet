import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  var boxColor;
  String description;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.description,
  });
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: "salad",
        iconPath: "assets/icons/plate.svg",
        boxColor: Color(0xff9DCEFF),
        description:
            "A salad is a dish consisting of mixed ingredients, frequently vegetables. They are typically served chilled or at room temperature, though some can be served warm. Condiments and salad dressings, which exist in a variety of flavors, are often used to enhance a salad."));
    categories.add(CategoryModel(
        name: "Cake",
        iconPath: "assets/icons/pancakes.svg",
        boxColor: Color(0xffEEA4CE),
        description:
            'Cake is a flour confection made from flour, sugar, and other ingredients and is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate and which share features with desserts such as pastries, meringues, custards, and pies.'));
    categories.add(CategoryModel(
        name: "Pie",
        iconPath: "assets/icons/pie.svg",
        boxColor: Color(0xff9DCEFF),
        description:
            "A pie is a baked dish which is usually made of a pastry dough casing that contains a filling of various sweet or savoury ingredients. Sweet pies may be filled with fruit (as in an apple pie), "));
    categories.add(CategoryModel(
        name: "Smoothies",
        iconPath: "assets/icons/orange-snacks.svg",
        boxColor: Color(0xffEEA4CE),
        description:
            "A smoothie is a beverage made by puréeing ingredients in a blender.[1] A smoothie commonly has a liquid base, such as fruit juice or milk, yogurt or ice cream. Other ingredients may be added, including fruits, vegetables, non-dairy milk, crushed ice, whey powder or nutritional supplements."));
    return categories;
  }
}
