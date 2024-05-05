import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/models/color_model.dart';
import 'package:flutter/material.dart';

class CoffeeCategoryProvider with ChangeNotifier {
  bool condition = true;
  int? sizeIndexRest = 0;
  String name = 'Cappuccino';
  List<String> sized = ['S', 'M', 'L'];

  List<CoffeeModel> getCappuccinoItems(String name) {
    CoffeeCategoryModel cappuccinoCategory = categories.firstWhere(
      (category) => category.name == name,
    );
    return cappuccinoCategory.items as List<CoffeeModel>;
  }

  List<bool> defaultColor = [
    true,
    false,
    false,
    false,
  ];
  List<bool> coffeSizeDefaultColor = [
    true,
    false,
    false,
  ];
  List<FontWeight> fontWeight = [
    FontWeight.w600,
    FontWeight.w400,
    FontWeight.w400,
    FontWeight.w400,
  ];
  List<Color> categoryBoxColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> coffeeSizeBgColor = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  List<Color> coffSizeTextColor = [
    ColorType.coffeeTextColor,
    ColorType.coffeeTextColor,
    ColorType.coffeeTextColor,
  ];
  List<Color> coffeeOutLineColor = [
    ColorType.coffeeOutLineColor,
    ColorType.coffeeOutLineColor,
    ColorType.coffeeOutLineColor,
  ];
  List<Color> textColor = [
    ColorType.categoryTextColor,
    ColorType.categoryTextColor,
    ColorType.categoryTextColor,
    ColorType.categoryTextColor,
  ];

  changeTab(
    int index,
    List categoryBoxColor,
    List textColor,
    List fontWeight,
  ) {
    if (index == 0) {
      name = 'Cappuccino';
      categoryBoxColor[index] = ColorType.buttonColor;
      categoryBoxColor[1] = Colors.white;
      categoryBoxColor[2] = Colors.white;
      categoryBoxColor[3] = Colors.white;
      textColor[index] = Colors.white;
      textColor[1] = ColorType.categoryTextColor;
      textColor[2] = ColorType.categoryTextColor;
      textColor[3] = ColorType.categoryTextColor;
      fontWeight[index] = FontWeight.w600;
      fontWeight[1] = FontWeight.w400;
      fontWeight[2] = FontWeight.w400;
      fontWeight[3] = FontWeight.w400;
    } else if (index == 1) {
      name = 'Machinato';
      categoryBoxColor[index] = ColorType.buttonColor;
      textColor[index] = Colors.white;
      categoryBoxColor[0] = Colors.white;
      categoryBoxColor[2] = Colors.white;
      categoryBoxColor[3] = Colors.white;
      textColor[0] = ColorType.categoryTextColor;
      textColor[2] = ColorType.categoryTextColor;
      textColor[3] = ColorType.categoryTextColor;
      defaultColor[0] = false;
      defaultColor[2] = false;
      defaultColor[3] = false;
      fontWeight[index] = FontWeight.w600;
      fontWeight[0] = FontWeight.w400;
      fontWeight[2] = FontWeight.w400;
      fontWeight[3] = FontWeight.w400;
    } else if (index == 2) {
      name = 'Latte';
      categoryBoxColor[index] = ColorType.buttonColor;
      textColor[index] = Colors.white;
      categoryBoxColor[0] = Colors.white;
      categoryBoxColor[1] = Colors.white;
      categoryBoxColor[3] = Colors.white;
      textColor[0] = ColorType.categoryTextColor;
      textColor[1] = ColorType.categoryTextColor;
      textColor[3] = ColorType.categoryTextColor;
      fontWeight[index] = FontWeight.w600;
      fontWeight[0] = FontWeight.w400;
      fontWeight[1] = FontWeight.w400;
      fontWeight[3] = FontWeight.w400;
      defaultColor[0] = false;
      defaultColor[1] = false;
      defaultColor[3] = false;
    } else if (index == 3) {
      name = 'Americano';
      categoryBoxColor[index] = ColorType.buttonColor;
      textColor[index] = Colors.white;
      categoryBoxColor[0] = Colors.white;
      categoryBoxColor[1] = Colors.white;
      categoryBoxColor[2] = Colors.white;
      textColor[0] = ColorType.categoryTextColor;
      textColor[1] = ColorType.categoryTextColor;
      textColor[2] = ColorType.categoryTextColor;
      fontWeight[index] = FontWeight.w600;
      fontWeight[0] = FontWeight.w400;
      fontWeight[1] = FontWeight.w400;
      fontWeight[2] = FontWeight.w400;
      defaultColor[0] = false;
      defaultColor[1] = false;
      defaultColor[2] = false;
    }
    notifyListeners();
  }

  coffeeSizedColorDefault() {
    notifyListeners();
  }

  coffeeSizeSelection(
    int index,
    List coffeeOutLineColor,
    List coffeeSizeBgColor,
    List coffeeSizeTextColor,
  ) {
    if (index == 0) {
      coffeeOutLineColor[index] = ColorType.buttonColor;
      coffSizeTextColor[index] = ColorType.buttonColor;
      coffSizeTextColor[1] = ColorType.coffeeTextColor;
      coffSizeTextColor[2] = ColorType.coffeeTextColor;
      coffeeOutLineColor[1] = ColorType.coffeeOutLineColor;
      coffeeOutLineColor[2] = ColorType.coffeeOutLineColor;
      coffeeSizeBgColor[index] = const Color(0xffFFF5EE);
      coffeeSizeBgColor[1] = Colors.transparent;
      coffeeSizeBgColor[2] = Colors.transparent;
      coffeSizeDefaultColor[index] = true;
      coffeSizeDefaultColor[1] = false;
      coffeSizeDefaultColor[2] = false;
    } else if (index == 1) {
      sizeIndexRest = index;
      coffeeOutLineColor[index] = ColorType.buttonColor;
      coffSizeTextColor[index] = ColorType.buttonColor;
      coffSizeTextColor[0] = ColorType.coffeeTextColor;
      coffSizeTextColor[2] = ColorType.coffeeTextColor;
      coffeeOutLineColor[0] = ColorType.coffeeOutLineColor;
      coffeeOutLineColor[2] = ColorType.coffeeOutLineColor;
      coffeeSizeBgColor[index] = const Color(0xffFFF5EE);
      coffeeSizeBgColor[0] = Colors.transparent;
      coffeeSizeBgColor[2] = Colors.transparent;
      coffeSizeDefaultColor[0] = false;
      coffeSizeDefaultColor[2] = false;
    } else if (index == 2) {
      sizeIndexRest = index;
      coffSizeTextColor[index] = ColorType.buttonColor;
      coffSizeTextColor[0] = ColorType.coffeeTextColor;
      coffSizeTextColor[1] = ColorType.coffeeTextColor;
      coffeeOutLineColor[index] = ColorType.buttonColor;
      coffeeOutLineColor[0] = ColorType.coffeeOutLineColor;
      coffeeOutLineColor[1] = ColorType.coffeeOutLineColor;
      coffeeSizeBgColor[index] = const Color(0xffFFF5EE);
      coffeeSizeBgColor[0] = Colors.transparent;
      coffeeSizeBgColor[1] = Colors.transparent;
      coffeSizeDefaultColor[0] = false;
      coffeSizeDefaultColor[1] = false;
    }
    notifyListeners();
  }

/*The function below resets the coffee size selection to its default listing 
when ever we navigate to another cofee page
*/
  coffeeSizeDefaultSettings() {
    coffeSizeDefaultColor[0] = true;
    coffeSizeDefaultColor[1] = false;
    coffeSizeDefaultColor[2] = false;
    coffeeOutLineColor[0] = ColorType.buttonColor;
    coffeeOutLineColor[1] = ColorType.coffeeOutLineColor;
    coffeeOutLineColor[2] = ColorType.coffeeOutLineColor;
    coffeeSizeBgColor[0] = const Color(0xffFFF5EE);
    coffeeSizeBgColor[1] = Colors.transparent;
    coffeeSizeBgColor[2] = Colors.transparent;
    coffSizeTextColor[0] = ColorType.buttonColor;
    coffSizeTextColor[1] = ColorType.coffeeTextColor;
    coffSizeTextColor[2] = ColorType.coffeeTextColor;
    notifyListeners();
  }

  toggleBool() {
    condition != false;
    notifyListeners();
  }
}
