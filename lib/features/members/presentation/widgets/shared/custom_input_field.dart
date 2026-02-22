import 'package:flutter/material.dart';
import 'package:gym_management_system/core/extensions/extensions.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final bool? alignLabelWithHint;
  final FocusNode? focusNode;

  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomInputField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.alignLabelWithHint,
    this.maxLength,
    this.focusNode,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLength: maxLength,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: obscureText ? 1 : maxLines,
      style: Theme.of(context).textTheme.bodyMedium?.responsive,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        alignLabelWithHint: alignLabelWithHint,
        counterText: "",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
