import 'package:flutter/material.dart';
import 'package:live_beer/app/design/design_tokens.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool autoFocus;
  final TextInputAction? textInputAction;

  const TextInputField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.autoFocus = false,
    this.textInputAction,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: DT.s1,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: DT.textLiteGrey,
          ),
        ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: textInputAction,
          style: const TextStyle(fontSize: 17, color: Colors.black),
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: DT.textLiteGrey),
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? const EdgeInsets.all(DT.s6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DT.radius),
              borderSide: const BorderSide(color: DT.errorBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DT.radius),
              borderSide: const BorderSide(color: DT.enabledBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DT.radius),
              borderSide: const BorderSide(color: DT.focusedBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DT.radius),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: enabled ? Colors.white : DT.enabledBorder,
          ),
        ),
      ],
    );
  }
}
