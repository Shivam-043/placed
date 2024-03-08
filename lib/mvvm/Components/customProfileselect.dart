import 'package:flutter/material.dart';

class ProfileSelectField extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;
  final List<String> options;
  final ValueChanged<String>? onChanged;

  const ProfileSelectField({
    Key? key,
    required this.icon,
    required this.title,
    required this.controller,
    required this.options,
    this.onChanged, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: DropdownButtonFormField<String>(
          value: controller.text.isNotEmpty ? controller.text : 'null',
          items: [
             if (options.isNotEmpty)
              DropdownMenuItem<String>(
                value: 'null',
                child: Text('Select $title'),
              ),
            ...options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ],
          onChanged: (String? value) {
            if (value != null) {
              controller.text = value;
              onChanged
                  ?.call(value); 
            }
          },
          decoration: InputDecoration.collapsed(hintText: 'Select $title'),
        ),
      ),
    );
  }
}
