import 'package:flutter/material.dart';

class Calc extends StatelessWidget {
  final String bodyCondition;
  final bool isMale ;
  final int result ;
  final int age ;
  final Color color ;

  const Calc({
    required this.isMale,
    required this.result,
    required this.age,
    required this.bodyCondition,
    required this.color,super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text('BMI Calculator'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [

      Text('Gender: ${isMale ? 'Male' : 'Female'}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),),const SizedBox(height: 5,),

            Text('Age: $age',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),const SizedBox(height: 5,),

      Text('Result: $result',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),),const SizedBox(height: 5,),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[Text('BC: $bodyCondition',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: color,

      ))
      ])
          ])
      ));
  }
}
