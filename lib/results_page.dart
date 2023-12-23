import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.advice, @required this.category, @required this.bmi});
  final double bmi;
  final String category;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: Colors.greenAccent[400],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 110.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          advice,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: bottomContainerHeight,
                color: kThemeAccentPinkColor,
                child: Center(
                  child: Text(
                    'RE-CALCULATE BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}
