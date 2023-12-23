import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'rounded_icon_button.dart';
import 'results_page.dart';
import 'dart:math';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender; // define the gender tapped on a button
  int height = 180;
  int weight = 60;
  int age = 20;
  String category;
  String advice;
  double bmi;

  void bmiCalcs(height, weight) {
    print(height);
    print(weight);
    bmi = (weight / pow((height / 100), 2));
    print(bmi);
    if (bmi < 18) {
      category = 'Under Weight';
      advice = 'You Lost a lot of Weight!, So You can Eat More.';
    } else if (bmi < 25) {
      category = 'Normal';
      advice = 'You have a normal body weight!. Good job!';
    } else {
      category = 'Over Weight';
      advice = 'You gained some more weight!, So focus on and Excercise Hard.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI Calculator'))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      if (selectedGender != Gender.male) {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icon: (FontAwesomeIcons.mars),
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      if (selectedGender != Gender.female) {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      }
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: kThemeAccentPinkColor,
                      overlayColor: kThemeAccentPinkColor.withAlpha(0x29),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: kSliderInActiveColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }, //onPress
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }, //onPress
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bmiCalcs(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    advice: advice,
                    bmi: bmi,
                    category: category,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              color: kThemeAccentPinkColor,
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
