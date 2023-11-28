


import 'package:flutter/material.dart';

class Utils{
  static void showSnackBar(var mes,BuildContext contex,var color){
    ScaffoldMessenger.of(contex).showSnackBar
      (SnackBar(
      content: Text(mes),
      backgroundColor: color,
    ));
  }
}