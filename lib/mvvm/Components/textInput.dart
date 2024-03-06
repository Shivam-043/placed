import 'package:flutter/material.dart';

class CustomCircularTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomCircularTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  _CustomCircularTextFieldState createState() =>
      _CustomCircularTextFieldState();
}

class _CustomCircularTextFieldState extends State<CustomCircularTextField> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: isEditing
            ? TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              )
            : Row(
              children :[
                Text(widget.hintText +  ":"),
                Text(
                widget.controller.text.isNotEmpty
                    ? widget.controller.text
                    : widget.hintText,
                style: TextStyle(
                  color: Colors.black, // Label text color
                  fontSize: 16.0, // Label text font size
                ),
              ),])
      ),
    );
  }
}

// Example usage:
// CustomCircularTextField(
//   controller: _nameController,
//   hintText: 'Name',
// ),
