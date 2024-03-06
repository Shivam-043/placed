import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  final String hintText;

  const ProfileField({
    Key? key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: TextFormField(
          controller: controller,
          decoration: InputDecoration.collapsed(hintText: hintText),
        ),
      ),
    );
  }
}
