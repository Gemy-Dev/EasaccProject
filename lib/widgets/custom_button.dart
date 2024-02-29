import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, required this.onPressed});
final Widget child;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: 50,
      child: ElevatedButton(onPressed: onPressed, child: Center(child: child)));
  }
}