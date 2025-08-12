import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final String label; 
  final String? hintText; // optional helper (e.g., format)
  final TextEditingController? controller;
  final String? initialValue; 
  final bool obscureText;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon; // trailing icon (e.g., eye / calendar)
  final Widget? suffix; // trailing widget (e.g., text)
  final String? errorText; // external validation message

  const FormTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.initialValue,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.suffix,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    //final secondaryColor = theme.colorScheme.onSecondary; // light field background
    //final textColor = theme.colorScheme.tertiary; // light field background

    return TextFormField(
      controller: controller,
      initialValue:
          controller == null ? initialValue : null, // prevent assertion
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      style: const TextStyle(fontSize: 16), // value text
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20, // increase this to move text down (centers label area)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
    );
  }
}
