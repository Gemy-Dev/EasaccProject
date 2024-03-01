import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
final String text;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,height: 50,
      child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), child: Text(text,style:Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white) ,),));
  }
}