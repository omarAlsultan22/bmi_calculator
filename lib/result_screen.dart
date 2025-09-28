import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String bodyCondition;
  final bool isMale;
  final int result;
  final int age;
  final Color color;

  const ResultScreen({
    required this.isMale,
    required this.result,
    required this.age,
    required this.bodyCondition,
    required this.color,
    super.key,
  });

  // Constants for consistent styling
  static const double _itemFontSize = 25.0;
  static const double _bodyConditionFontSize = 20.0;
  static const double _spacingHeight = 5.0;
  static const FontWeight _itemFontWeight = FontWeight.bold;
  static const Color _itemTextColor = Colors.black;

  // Reusable widgets
  SizedBox get _sizedBox => const SizedBox(height: _spacingHeight);

  Text _buildItemText(String value) => Text(
    value,
    style: const TextStyle(
      fontWeight: _itemFontWeight,
      fontSize: _itemFontSize,
      color: _itemTextColor,
    ),
  );

  Text _buildBodyConditionText() => Text(
    'BC: $bodyCondition',
    style: TextStyle(
      fontWeight: _itemFontWeight,
      fontSize: _bodyConditionFontSize,
      color: color,
    ),
  );

  Widget _buildBackButton(BuildContext context) => IconButton(
    onPressed: () => Navigator.pop(context),
    icon: const Icon(Icons.arrow_back_ios),
  );

  AppBar _buildAppBar(BuildContext context) => AppBar(
    leading: _buildBackButton(context),
    title: const Text('BMI Calculator'),
  );

  List<Widget> _buildContentItems() => [
    _buildItemText('Gender: ${isMale ? 'Male' : 'Female'}'),
    _sizedBox,
    _buildItemText('Age: $age'),
    _sizedBox,
    _buildItemText('Result: $result'),
    _sizedBox,
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildBodyConditionText()],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildContentItems(),
        ),
      ),
    );
  }
}