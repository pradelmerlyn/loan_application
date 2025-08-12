import 'package:flutter/material.dart';

class DateFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onPick;
  final FormFieldValidator<String>? validator; 

  const DateFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.onPick,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      validator: validator, 
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: onPick,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
      ),
      onTap: onPick, // optional: also open picker when field itself is tapped
    );
  }
}
