import 'dart:math';

import 'package:bmii/calc_screen.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();

}

class _BmiState extends State<Bmi> {
  bool isMale = true;

  double height = 120.0;

  String bodyCondition = '';

  int weight = 40;
  int age = 20;

  late Color color;

  bodConCalc(x) {
    if (x < 15) {
      bodyCondition = 'Very severe weight loss';
      color = Colors.red.shade900;
    }
    else if (x >= 15 && x <= 16) {
      bodyCondition = 'Severe weight loss';
      color = Colors.red;
    }
    else if (x >= 17 && x <= 18.5) {
      bodyCondition = 'Weight loss';
      color = Colors.yellow;
    }
    else if (x >= 19 && x <= 25) {
      bodyCondition = 'Normal weight';
      color = Colors.green;
    }
    else if (x >= 26 && x <= 30) {
      bodyCondition = 'Increase in weight';
      color = Colors.yellow;
    }
    else if (x >= 31 && x <= 35) {
      bodyCondition = 'First degree obesity';
      color = Colors.red;
    }
    else if (x >= 36 && x <= 40) {
      bodyCondition = 'Second degree obesity';
      color = Colors.red.shade900;
    }
    else {
      bodyCondition = 'Third degree obesity';
      color = Colors.red.shade900;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          color: isMale ? Colors.blue : Colors
                                              .grey[400]),
                                      child: const Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Image(image: AssetImage(
                                              'assets/images/male.png',),
                                              height: 90.0,
                                              width: 90.0,
                                            ), SizedBox(
                                              height: 15.0,
                                            ), Text('MALE',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),)
                                          ]),
                                    ))), const SizedBox(width: 20.0,),
                            Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = false;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                        color: isMale
                                            ? Colors.grey[400]
                                            : Colors.blue),
                                    child: const Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Image(image: AssetImage(
                                            'assets/images/female.png',),
                                            height: 90.0,
                                            width: 90.0,
                                          ), SizedBox(
                                            height: 15.0,
                                          ), Text('FEMALE',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),)
                                        ]),
                                  ),
                                )),
                          ]))),

              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[400],),

                          child: Column( // this colum is not important
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("HEIGHT", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  //crossAxisAlignment: CrossAxisAlignment.baseline,

                                  children: [
                                    Text('${height.round()}',
                                      style: const TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                      ),), const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text('CM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  ],
                                ),
                                Slider(value: height,
                                    min: 80.0, max: 220.0,
                                    onChanged: (value) {
                                      setState(() {
                                        height = value;
                                      });
                                    })
                              ]
                          )
                      )
                  )
              ),

              Expanded(
                  child: Padding(padding: const EdgeInsets.all(20.0),
                      child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[400]),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        const Text('WEIGHT',
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold
                                          ),),

                                        Text('$weight',
                                          style: const TextStyle(
                                              fontSize: 40.0,
                                              fontWeight: FontWeight.bold),
                                        ), //const SizedBox(height: 15,),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              FloatingActionButton.small(
                                                onPressed: () {
                                                  setState(() {
                                                    weight --;
                                                  });
                                                },
                                                heroTag: 'weight-',
                                                //mouseCursor:MaterialStateMouseCursor.clickable,
                                                child: const Icon(Icons.remove),
                                              ),
                                              FloatingActionButton.small
                                                (
                                                onPressed: () {
                                                  setState(() {
                                                    weight ++;
                                                  });
                                                },
                                                heroTag: 'weight+',
                                                //mouseCursor:MaterialStateMouseCursor.clickable,
                                                child: const Icon(Icons.add),),
                                            ])
                                      ]),)),
                            const SizedBox(width: 20.5,),
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[400]),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        const Text('AGE',
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold
                                          ),),

                                        Text('$age',
                                          style: const TextStyle(
                                              fontSize: 40.0,
                                              fontWeight: FontWeight.bold),
                                        ), //const SizedBox(height: 15,),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              FloatingActionButton.small(
                                                onPressed: () {
                                                  setState(() {
                                                    age --;
                                                  });
                                                },
                                                heroTag: 'age-',
                                                //mouseCursor:MaterialStateMouseCursor.clickable,
                                                child: const Icon(
                                                    Icons.remove),),

                                              FloatingActionButton.small(
                                                onPressed: () {
                                                  setState(() {
                                                    age ++;
                                                  });
                                                },
                                                heroTag: 'age+',
                                                //mouseCursor:MaterialStateMouseCursor.clickable,
                                                child: const Icon(Icons.add),),
                                            ])
                                      ]),))
                          ]))),
              Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 50.0,
                  child: MaterialButton(onPressed: () {
                    //int result = bmi(height, weight);

                    double result = weight / (pow(height / 100, 2));
                    bodConCalc(result.round());

                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) =>
                            Calc(
                              isMale: isMale,
                              age: age,
                              result: result.round(),
                              bodyCondition: bodyCondition,
                              color: color,)));
                  },
                      child: const Center(
                        child: Text('CALCULATE',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                  )
              )
            ]
        )

    );
  }
}
