import 'package:bmi_calculator/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import '../models/bmi_condition.dart';


abstract class BmiScreenConstants {
  // BMI Screen
  static const double minHeight = 80.0;
  static const double maxHeight = 220.0;
  static const double initialHeight = 120.0;
  static const int initialWeight = 40;
  static const int initialAge = 20;

  // Design
  static const double spacingSize = 0.0;
  static const double height_50 = 50.0;
  static const double containerBorderRadius = 10.0;
  static const double imageSize = 90.0;
  static const double spacingHeight = 15.0;
  static const double spacingWidth = AppSizes.size_20;
  static const double titleFontSize = AppSizes.fontSize_25;
  static const double valueFontSize = 40.0;
  static const double unitFontSize = AppSizes.size_20;
  static const FontWeight boldWeight = FontWeight.bold;
  static const EdgeInsets paddingForAll = EdgeInsets.all(20.0);
  static const EdgeInsets paddingSymmetric = EdgeInsets.symmetric(horizontal: 20.0);

  //colors
  static const Color blue = Colors.blue;
  static const Color lightGrey = Color(0xFFBDBDBD);

  // BMI Conditions
  static List<BMICondition> get bmiConditions =>
      const[
        BMICondition(15, 'Very severe weight loss', Color(0xFFB71C1C)),
        BMICondition(16, 'Severe weight loss', Color(0xFFD32F2F)),
        BMICondition(18.5, 'Weight loss', Color(0xFFFBC02D)),
        BMICondition(25, 'Normal weight', Color(0xFF388E3C)),
        BMICondition(30, 'Increase in weight', Color(0xFFFBC02D)),
        BMICondition(35, 'First degree obesity', Color(0xFFD32F2F)),
        BMICondition(40, 'Second degree obesity', Color(0xFFB71C1C)),
      ];
}