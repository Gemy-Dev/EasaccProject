import 'package:flutter/material.dart';

extension Navigation on BuildContext{
  go(Widget screen)=>Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (_)=>screen), (route) => false);
  push(Widget screen)=>Navigator.push(this, MaterialPageRoute(builder: (_)=>screen),);
  
}

extension SnackBr on BuildContext{
 snackBar(String message)=>ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));

}