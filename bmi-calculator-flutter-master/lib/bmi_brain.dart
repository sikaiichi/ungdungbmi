import 'package:flutter/material.dart';
import 'dart:math';
import 'result_page.dart';
import 'input_page.dart';


class CaculationBrain {
CaculationBrain({this.height,this.weight});
final int height;
final int weight;

double _bmi ;

String caculateBMI (){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
}

String getResult(){
  if (_bmi >25){
    return "OverWeight";
  }else if (_bmi > 18.5){
    return "Normal";
  }else {
  return "UnderWeight";
}}


String getInterpraytaition(){
  if (_bmi >25){
    return "Mày béo vãi bìu, giảm ăn và tập thể dục đi con lợn";
  }else if (_bmi > 18.5){
    return "Body mày ổn đấy ";
  }else {
  return "Ốm yếu vãi xoài , ăn nhiều vào tập thể dục đi nhé";
}}




}