import 'package:bmi_calculator/features/constants/bmi_result_constants.dart';
import 'package:bmi_calculator/features/constants/bmi_texts.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
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

  // Reusable widgets
  SizedBox get _sizedBox =>
      const SizedBox(height: BmiResultConstants.spacingHeight);


  Text _buildItemText(String value) =>
      Text(
        value,
        style: const TextStyle(
          fontWeight: BmiResultConstants.itemFontWeight,
          fontSize: BmiResultConstants.itemFontSize,
          color: AppColors.black,
        ),
      );

  Text _buildBodyConditionText() {
    return Text(
      'BC: $bodyCondition',
      style: TextStyle(
        fontWeight: BmiResultConstants.itemFontWeight,
        fontSize: BmiResultConstants.bodyConditionFontSize,
        color: color,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) =>
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      );

  AppBar _buildAppBar(BuildContext context) =>
      AppBar(
        leading: _buildBackButton(context),
        title: BmiTexts.title,
      );

  List<Widget> _buildContentItems() {
    return [
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
  }

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