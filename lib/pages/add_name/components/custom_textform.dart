import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          'please enter field value';
        }
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}