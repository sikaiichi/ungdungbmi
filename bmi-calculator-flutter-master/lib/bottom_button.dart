import 'package:flutter/material.dart';
import 'constant.dart';
import 'result_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap , @required this.buttonTitle});
  final Function onTap ;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}