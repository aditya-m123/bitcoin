import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/calculatorComponents/bottom_Button.dart';
import 'package:myapp/calculatorComponents/reusable.dart';
import 'package:myapp/calculatorscreen/constants.dart';

class Results extends StatelessWidget {
  Results(
      {required this.result_bmiResult,
      required this.result_Text,
      required this.result_interpretation});

  String result_bmiResult = " ";
  String result_Text = " ";
  String result_interpretation = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'YOUR RESULT',
                    style: kLarge_TextStyle,
                  ),
                )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: active_Colour,
                  cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(result_Text.toUpperCase(), style: resultTextStyle),
                        Text(
                          result_bmiResult,
                          style: kBMI_textStyle,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              result_interpretation,
                              style: kBody_Style,
                              textAlign: TextAlign.center,
                            ))
                      ]),
                  onPress: () {},
                )),
            Expanded(
                flex: 1,
                child: Container(
                    color: Color(0xFFEB1555),
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 10),
                    height: bottomContainerHeight,
                    child: BottomWidget(
                        text: 'RE-CALCULATE',
                        on_BottomPressed: () {
                          // Navigator.pop(context);
                        })))
          ],
        ));
  }
}
