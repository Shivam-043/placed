import 'package:flutter/material.dart';

class CustomCircularTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final EdgeInsets padding;
  final double borderRadius;
  final Color borderColor;
  final Color shadowColor;

  const CustomCircularTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.padding = const EdgeInsets.all(8.0),
    this.borderRadius = 20.0,
    this.borderColor = Colors.grey,
    this.shadowColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white, // Background color of the text field
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // Changes the shadow direction
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

