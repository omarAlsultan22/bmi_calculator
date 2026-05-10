import 'package:bmi_calculator/features/constants/bmi_texts.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
import '../constants/bmi_screen_constants.dart';
import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';
import 'dart:math';


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool _isMale = true;
  double _height = BmiScreenConstants.initialHeight;
  int _weight = BmiScreenConstants.initialWeight;
  int _age = BmiScreenConstants.initialAge;

  //spaces
  static const _spacingSize = BmiScreenConstants.spacingSize;
  static const _paddingForAll = BmiScreenConstants.paddingForAll;
  static const _paddingSymmetric = BmiScreenConstants.paddingSymmetric;

  (String, Color) _calculateBodyCondition(double bmi) {
    final conditions = BmiScreenConstants.bmiConditions;

    for (final condition in conditions) {
      if (bmi <= condition.maxLimit) {
        return (condition.label, condition.color);
      }
    }
    return const('Third degree obesity', Color(0xFFB71C1C));
  }

  double _calculateBmi() {
    return _weight / pow(_height / 100, 2);
  }

  void _navigateToResultScreen(BuildContext context) {
    final double bmi = _calculateBmi();
    final (String condition, Color color) = _calculateBodyCondition(bmi);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(
              isMale: _isMale,
              age: _age,
              result: bmi.round(),
              bodyCondition: condition,
              color: color,
            ),
      ),
    );
  }

  // Reusable widgets
  Widget _buildTitleText(String text) =>
      Text(
        text,
        style: const TextStyle(
          fontSize: BmiScreenConstants.titleFontSize,
          fontWeight: BmiScreenConstants.boldWeight,
        ),
      );

  Widget _buildValueText(String text) =>
      Text(
        text,
        style: const TextStyle(
          fontSize: BmiScreenConstants.valueFontSize,
          fontWeight: BmiScreenConstants.boldWeight,
        ),
      );

  Widget _buildUnitText(String text) =>
      Text(
        text,
        style: const TextStyle(
          fontSize: BmiScreenConstants.unitFontSize,
          fontWeight: BmiScreenConstants.boldWeight,
        ),
      );

  Widget _buildSpacing({bool isHorizontal = false}) =>
      SizedBox(
        height: isHorizontal ? _spacingSize : BmiScreenConstants.spacingHeight,
        width: isHorizontal ? BmiScreenConstants.spacingWidth : _spacingSize,
      );

  // Main section widgets
  Widget _buildGenderSelection() {
    return Expanded(
      child: Padding(
        padding: _paddingForAll,
        child: Row(
          children: [
            _buildGenderCard(
              isSelected: _isMale,
              imagePath: 'assets/images/male.png',
              label: 'MALE',
              onTap: () => setState(() => _isMale = true),
            ),
            _buildSpacing(isHorizontal: true),
            _buildGenderCard(
              isSelected: !_isMale,
              imagePath: 'assets/images/female.png',
              label: 'FEMALE',
              onTap: () => setState(() => _isMale = false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required bool isSelected,
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  BmiScreenConstants.containerBorderRadius),
              color: isSelected ? BmiScreenConstants.blue : BmiScreenConstants
                  .lightGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  height: BmiScreenConstants.imageSize,
                  width: BmiScreenConstants.imageSize,
                ),
                _buildSpacing(),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: BmiScreenConstants.titleFontSize,
                    fontWeight: BmiScreenConstants.boldWeight,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildHeightSelection() {
    return Expanded(
      child: Padding(
        padding: _paddingSymmetric,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                BmiScreenConstants.containerBorderRadius),
            color: BmiScreenConstants.lightGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitleText('HEIGHT'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  _buildValueText('${_height.round()}'),
                  _buildSpacing(isHorizontal: true),
                  _buildUnitText('CM'),
                ],
              ),
              Padding(
                padding: _paddingSymmetric,
                child: Slider(
                  value: _height,
                  min: BmiScreenConstants.minHeight,
                  max: BmiScreenConstants.maxHeight,
                  onChanged: (value) => setState(() => _height = value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounterSection() {
    return Expanded(
      child: Padding(
        padding: _paddingForAll,
        child: Row(
          children: [
            _buildCounterCard(
              title: 'WEIGHT',
              value: _weight,
              onDecrement: () => setState(() => _weight--),
              onIncrement: () => setState(() => _weight++),
            ),
            _buildSpacing(isHorizontal: true),
            _buildCounterCard(
              title: 'AGE',
              value: _age,
              onDecrement: () => setState(() => _age--),
              onIncrement: () => setState(() => _age++),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard({
    required String title,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              BmiScreenConstants.containerBorderRadius),
          color: BmiScreenConstants.lightGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitleText(title),
            _buildValueText('$value'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCounterButton(
                  icon: Icons.remove,
                  onPressed: onDecrement,
                  heroTag: '$title-decrement',
                ),
                _buildSpacing(isHorizontal: true),
                _buildCounterButton(
                  icon: Icons.add,
                  onPressed: onIncrement,
                  heroTag: '$title-increment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String heroTag,
  }) =>
      FloatingActionButton.small(
        onPressed: onPressed,
        heroTag: heroTag,
        child: Icon(icon),
      );

  Widget _buildCalculateButton() {
    return Container(
      color: BmiScreenConstants.blue,
      width: double.infinity,
      height: BmiScreenConstants.height_50,
      child: MaterialButton(
        onPressed: () => _navigateToResultScreen(context),
        child: const Center(
          child: Text(
            'CALCULATE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BmiTexts.title,
      ),
      body: Column(
        children: [
          _buildGenderSelection(),
          _buildHeightSelection(),
          _buildCounterSection(),
          _buildCalculateButton(),
        ],
      ),
    );
  }
}