import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/calculatorComponents/IconContent.dart';
import 'package:myapp/calculatorComponents/bottom_Button.dart';
import 'package:myapp/calculatorComponents/reusable.dart';
import 'package:myapp/calculatorscreen/calculate_brain.dart';
import 'package:myapp/calculatorscreen/constants.dart';

import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  // void updateColor(GenderType selectedGender) { // if (selectedGender == GenderType.male) { // if (male_CardColor == active_Colour) { // male_CardColor = inactive_Colour; // } else { // male_CardColor = active_Colour; // female_CardColor = inactive_Colour; // } // } else { // if (female_CardColor == active_Colour) { // female_CardColor = inactive_Colour; // } else { // female_CardColor = active_Colour; // male_CardColor = inactive_Colour; // } // } // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderType.male;
                  });
                },
                colour: selectedGender == GenderType.male
                    ? active_Colour
                    : inactive_Colour,
                cardchild: IconContent('MALE', FontAwesomeIcons.mars),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderType.female;
                  });
                },
                colour: selectedGender == GenderType.female
                    ? active_Colour
                    : inactive_Colour,
                cardchild: IconContent('FEMALE', FontAwesomeIcons.venus),
              )),
            ])),
            Expanded(
                child: ReusableCard(
              colour: active_Colour,
              cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumber_TextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFFFFFFFF),
                          inactiveTrackColor: Color(0x568D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x1fEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 24.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ]),
            )),
            Expanded(
                child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: active_Colour,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT'),
                      Text(
                        weight.toString(),
                        style: kNumber_TextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: RounderIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressedtype: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ),
                          RounderIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressedtype: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: active_Colour,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age'.toUpperCase()),
                      Text(
                        age.toString(),
                        style: kNumber_TextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RounderIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressedtype: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          RounderIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressedtype: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ])),
            Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 10),
                height: bottomContainerHeight,
                child: BottomWidget(
                  text: 'CALCULATE',
                  on_BottomPressed: () {
                    Calculate_Brain cal =
                        Calculate_Brain(height: height, weight: weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(
                                  result_bmiResult: cal.calculateBmI(),
                                  result_Text: cal.getResult(),
                                  result_interpretation:
                                      cal.getInterpredation(),
                                )));
                  },
                ))
          ],
        ),
      ),
    );
  }
}

enum GenderType {
  male,
  female,
}

class RounderIconButton extends StatelessWidget {
  RounderIconButton({required this.icon, required this.onPressedtype});
  final IconData icon;
  final Function onPressedtype;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressedtype();
      },
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 46.0, height: 46.0),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
