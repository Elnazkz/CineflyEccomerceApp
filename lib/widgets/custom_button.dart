import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final double margin;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.orangeAccent,
    this.textColor = Colors.black,
    this.borderRadius = 8.0,
    this.padding = 16.0,
    this.margin = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(padding),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ), // Adjust margin as needed
    );
  }
}
