import 'dart:ui';

import 'package:bmi_calculator/bmi_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'extractcolumn_icon.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'roudicon.dart';
import 'bottom_button.dart';
const iconMale = FontAwesomeIcons.mars;
const iconFemale = FontAwesomeIcons.venus;
const textmale = "MALE";
const textfemale = "FEMALE";

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;
  int age = 22 ;
  // Color maleCardColour = bodyContainerColor ;
  // Color femaleCardColour = bodyContainerColor ;

  // void updateColour(Gender selectedGender){
      Gender selectedGender ;

  //   if (selectedGender == Gender.male){
  //     if (maleCardColour == bodyContainerColor){
  //       maleCardColour = incativeCardColour;
  //       femaleCardColour = bodyContainerColor;
  //     }else {
  //       maleCardColour = bodyContainerColor;
  //       femaleCardColour = incativeCardColour;
  //     }
  //   }
  //   if (selectedGender == Gender.female){
  //     if (femaleCardColour == bodyContainerColor){
  //       femaleCardColour = incativeCardColour;
  //       maleCardColour = bodyContainerColor;
  //     }else {
  //       femaleCardColour = bodyContainerColor;
  //       maleCardColour = incativeCardColour;
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender= Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kBodyContainerColor : kIncativeCardColour ,
                cardChild: ExtractColumn(icons: iconMale,texts: textmale,),)),
                Expanded(child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender= Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kBodyContainerColor : kIncativeCardColour ,
                cardChild: ExtractColumn(icons: iconFemale,texts: textfemale),)),
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: kBodyContainerColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEIGHT",
              style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),style: KNumberTextStyle),
                  Text('cm',style: kLabelTextStyle,)
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: 
                  RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: 
                  RoundSliderOverlayShape(overlayRadius: 30.0)
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 230,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double  NewValue){
                    setState(() {
                      height = NewValue.round();
                    });
                  },
              
                ),
              )
            ],
          ),)),
      Expanded(
        child: Row(
          children: [
            Expanded(child: ReusableCard(
              colour: kBodyContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEIGHT",style: kLabelTextStyle,),
                  Text(weight.toString(),
                  style: KNumberTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          weight--;
                        });

                      },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                      onPressed: (){
                        setState(() {
                          weight++;
                      });})
                        
                    ],
                  ),
                  
                  
                ],
              ),
            )),
            Expanded(child: ReusableCard(colour: kBodyContainerColor,
            cardChild : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("AGE",style: kLabelTextStyle,),
                Text(age.toString(),style: KNumberTextStyle,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          age--;
                        });

                      },
                      ),
                      SizedBox(width: 10.0),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                      onPressed: (){
                        setState(() {
                          age++;
                      });})
                        
                    ],
                  ),
              ],
            )),
            )],
        ),
      ),
      BottomButton(buttonTitle: "Caculate",onTap: (){
        CaculationBrain calc = CaculationBrain(height: height ,weight: weight);

        Navigator.push(context, MaterialPageRoute(builder: (context) {return ResultPage(
          bmiResult: calc.caculateBMI(),
          resultText: calc.getResult(),
          interpretation: calc.getInterpraytaition(),
        );}));

      },)
        ],
      )
      
    );
  }
}



