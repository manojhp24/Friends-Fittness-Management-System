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

  const CustomInputField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines,
    this.alignLabelWithHint,
    this.maxLength, this.focusNode, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: readOnly ? onTap : null,
      focusNode: focusNode,
      maxLength: maxLength,
      maxLines: maxLines,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.bodyMedium?.responsive,
      decoration: InputDecoration(
        labelText: label,
          alignLabelWithHint: alignLabelWithHint,
          counterText: ""
      ),
    );
  }
}
