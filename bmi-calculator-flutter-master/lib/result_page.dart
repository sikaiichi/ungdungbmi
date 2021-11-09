import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import "constant.dart";
import 'bottom_button.dart';
import 'bmi_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.interpretation,@required this.resultText});
  
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CACULATOR"),
      ),
      body: Column(
        mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment :CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.all(15.0) ,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Your Result", style: KTiltleTextStyle,
            ),
          )),
          Expanded(
            flex : 5,
            child: ReusableCard(colour: kBodyContainerColor,
          cardChild: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resultText,style: kResultTextSyle,),
              Text(bmiResult,style: kBMIresult,),
              Text(interpretation,style: kBodyTextStyle,textAlign: TextAlign.center,)
            ],
          
          ),)),
          BottomButton(buttonTitle: "Re-Calculate",onTap:(){ Navigator.pop(context);},)
        ],
      )
    );
  }
}