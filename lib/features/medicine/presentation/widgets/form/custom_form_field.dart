// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.autoFocus,
    required this.focus,
    required this.label,
    required this.hint,
    this.icon,
    this.validator,
    this.onSaved,
    required this.keyboard,
  }) : super(key: key);
  final FocusNode autoFocus;
  final FocusNode focus;
  final String label;
  final String hint;
  final IconData? icon;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final TextInputType keyboard;
  late String fieldValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      textInputAction: TextInputAction.next,
      focusNode: autoFocus,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(focus);
      },
      validator: validator,
      onSaved: onSaved,
    );
  }
}
