import 'package:bmii/result_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  // Constants
  static const double _minHeight = 80.0;
  static const double _maxHeight = 220.0;
  static const double _initialHeight = 120.0;
  static const int _initialWeight = 40;
  static const int _initialAge = 20;
  static const double _containerBorderRadius = 10.0;
  static const double _imageSize = 90.0;
  static const double _spacingHeight = 15.0;
  static const double _spacingWidth = 20.0;
  static const double _titleFontSize = 25.0;
  static const double _valueFontSize = 40.0;
  static const double _unitFontSize = 20.0;
  static const FontWeight _boldWeight = FontWeight.bold;

  // State variables
  bool isMale = true;
  double height = _initialHeight;
  int weight = _initialWeight;
  int age = _initialAge;

  // BMI Calculation logic
  (String, Color) _calculateBodyCondition(double bmi) {
    if (bmi < 15) return ('Very severe weight loss', Colors.red.shade900);
    if (bmi <= 16) return ('Severe weight loss', Colors.red);
    if (bmi <= 18.5) return ('Weight loss', Colors.yellow);
    if (bmi <= 25) return ('Normal weight', Colors.green);
    if (bmi <= 30) return ('Increase in weight', Colors.yellow);
    if (bmi <= 35) return ('First degree obesity', Colors.red);
    if (bmi <= 40) return ('Second degree obesity', Colors.red.shade700);
    return ('Third degree obesity', Colors.red.shade900);
  }

  double _calculateBmi() {
    return weight / pow(height / 100, 2);
  }

  void _navigateToResultScreen(BuildContext context) {
    final double bmi = _calculateBmi();
    final (String condition, Color color) = _calculateBodyCondition(bmi);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          isMale: isMale,
          age: age,
          result: bmi.round(),
          bodyCondition: condition,
          color: color,
        ),
      ),
    );
  }

  // Reusable widgets
  Widget _buildTitleText(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: _titleFontSize,
      fontWeight: _boldWeight,
    ),
  );

  Widget _buildValueText(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: _valueFontSize,
      fontWeight: _boldWeight,
    ),
  );

  Widget _buildUnitText(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: _unitFontSize,
      fontWeight: _boldWeight,
    ),
  );

  Widget _buildSpacing({bool isHorizontal = false}) => SizedBox(
    height: isHorizontal ? 0 : _spacingHeight,
    width: isHorizontal ? _spacingWidth : 0,
  );

  // Main section widgets
  Widget _buildGenderSelection() => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _buildGenderCard(
            isSelected: isMale,
            imagePath: 'assets/images/male.png',
            label: 'MALE',
            onTap: () => setState(() => isMale = true),
          ),
          _buildSpacing(isHorizontal: true),
          _buildGenderCard(
            isSelected: !isMale,
            imagePath: 'assets/images/female.png',
            label: 'FEMALE',
            onTap: () => setState(() => isMale = false),
          ),
        ],
      ),
    ),
  );

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
              borderRadius: BorderRadius.circular(_containerBorderRadius),
              color: isSelected ? Colors.blue : Colors.grey[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  height: _imageSize,
                  width: _imageSize,
                ),
                _buildSpacing(),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: _titleFontSize,
                    fontWeight: _boldWeight,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildHeightSelection() => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_containerBorderRadius),
          color: Colors.grey[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitleText("HEIGHT"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                _buildValueText('${height.round()}'),
                _buildSpacing(isHorizontal: true),
                _buildUnitText('CM'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Slider(
                value: height,
                min: _minHeight,
                max: _maxHeight,
                onChanged: (value) => setState(() => height = value),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildCounterSection() => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          _buildCounterCard(
            title: 'WEIGHT',
            value: weight,
            onDecrement: () => setState(() => weight--),
            onIncrement: () => setState(() => weight++),
          ),
          _buildSpacing(isHorizontal: true),
          _buildCounterCard(
            title: 'AGE',
            value: age,
            onDecrement: () => setState(() => age--),
            onIncrement: () => setState(() => age++),
          ),
        ],
      ),
    ),
  );

  Widget _buildCounterCard({
    required String title,
    required int value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) =>
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_containerBorderRadius),
            color: Colors.grey[400],
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

  Widget _buildCalculateButton() => Container(
    color: Colors.blue,
    width: double.infinity,
    height: 50.0,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
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